//
//  NUILabel.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUILabel.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUILabel::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUILabel::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UILabel"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("text"), TextGetter, TextSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUILabel::New) {
  Nan::HandleScope scope;

  Local<Object> txtObj = info.This();

  NUILabel *txt = new NUILabel();
  
  if (info[0]->IsExternal()) {
    txt->SetNSObject((__bridge UILabel *)(info[0].As<External>()->Value()));
  }
  txt->Wrap(txtObj);

  info.GetReturnValue().Set(txtObj);
}

NAN_METHOD(NUILabel::Alloc) {
  Nan::EscapableHandleScope scope;
  //auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> tfObj = JS_TYPE(NUILabel)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUILabel *field = ObjectWrap::Unwrap<NUILabel>(tfObj);

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);
  
  //Nan::Persistent<Function>* cb = new Nan::Persistent<Function>(Local<Function>::Cast(info[4]));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UILabel* txt = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
      field->SetNSObject(txt);
      [txt setFont:[UIFont systemFontOfSize:15]];
      /*
      [txt setPlaceholder:@"Enter text here"];
      [txt setBorderStyle:UITextBorderStyleRoundedRect];
      [txt setAutocorrectionType:UITextAutocorrectionTypeNo];
      [txt setKeyboardType:UIKeyboardTypeDefault];
      [txt setReturnKeyType:UIReturnKeyDone];
      [txt setClearButtonMode:UILabelViewModeWhileEditing];
      [txt setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
      [txt setTargetClosureWithClosure:^(UILabel*){
        sweetiekit::Resolve(cb);
        return true;
      }];*/
    });
  }

  info.GetReturnValue().Set(tfObj);
}

NAN_GETTER(NUILabel::TextGetter) {
  Nan::HandleScope scope;

  NUILabel *view = ObjectWrap::Unwrap<NUILabel>(info.This());
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [view->As<UILabel>() text];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
  
}

NAN_SETTER(NUILabel::TextSetter) {
  Nan::HandleScope scope;

  NUILabel *btn = ObjectWrap::Unwrap<NUILabel>(info.This());

  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [btn->As<UILabel>() setText:[NSString stringWithUTF8String:title.c_str()]];
    });
  }
}

NUILabel::NUILabel () {}
NUILabel::~NUILabel () {}


