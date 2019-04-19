//
//  NUITextField.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUITextField.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUITextField::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITextField::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITextField"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("text"), TextGetter, TextSetter);
  Nan::SetAccessor(proto, JS_STR("delegate"), DelegateGetter, DelegateSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITextField::New) {
  Nan::HandleScope scope;

  Local<Object> txtObj = info.This();

  NUITextField *txt = new NUITextField();
  
  txt->Wrap(txtObj);

  info.GetReturnValue().Set(txtObj);
}

NAN_METHOD(NUITextField::Alloc) {
  Nan::EscapableHandleScope scope;
  //auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> tfObj = JS_TYPE(NUITextField)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUITextField *field = ObjectWrap::Unwrap<NUITextField>(tfObj);

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);
/*
  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[4]));
  auto delegate = ctrl->As<NodeUIViewController>();*/
  
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>(Local<Function>::Cast(info[4]));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UITextField* txt = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
      field->SetNSObject(txt);
      [txt setPlaceholder:@"Enter text here"];
      [txt setFont:[UIFont systemFontOfSize:15]];
      [txt setBorderStyle:UITextBorderStyleRoundedRect];
      [txt setAutocorrectionType:UITextAutocorrectionTypeNo];
      [txt setKeyboardType:UIKeyboardTypeDefault];
      [txt setReturnKeyType:UIReturnKeyDone];
      [txt setClearButtonMode:UITextFieldViewModeWhileEditing];
      [txt setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
      //[txt setDelegate:delegate];
      [txt setTargetClosureWithClosure:^(UITextField*){
        sweetiekit::Resolve(cb);
        return true;
      }];
    });
  }

  info.GetReturnValue().Set(tfObj);
}

NAN_GETTER(NUITextField::TextGetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());

  info.GetReturnValue().Set(JS_STR([[view->As<UITextField>() text] UTF8String]));
}

NAN_SETTER(NUITextField::TextSetter) {
  Nan::HandleScope scope;

  NUITextField *txt = ObjectWrap::Unwrap<NUITextField>(info.This());
  
  std::string title;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    title = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [txt->As<UITextField>() setText:[NSString stringWithUTF8String:title.c_str()]];
    });
  }
}

NAN_GETTER(NUITextField::DelegateGetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());

  info.GetReturnValue().Set(JS_STR([[view->As<UITextField>() text] UTF8String]));
}

NAN_SETTER(NUITextField::DelegateSetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());
  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(value));
  auto delegate = ctrl->As<NodeUIViewController>();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [view->As<UITextField>() setDelegate:delegate];
    });
  }
}

NUITextField::NUITextField () {}
NUITextField::~NUITextField () {}

