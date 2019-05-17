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
  Nan::SetAccessor(proto, JS_STR("callback"), CallbackGetter, CallbackSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "alloc", Alloc);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITextField::New) {
  Nan::HandleScope scope;

  Local<Object> txtObj = info.This();

  NUITextField *txt = new NUITextField();
  
  if (info[0]->IsExternal()) {
    txt->SetNSObject((__bridge UITextField *)(info[0].As<External>()->Value()));
  }
  
  txt->Wrap(txtObj);

  info.GetReturnValue().Set(txtObj);
}

NAN_METHOD(NUITextField::Alloc) {
  Nan::EscapableHandleScope scope;
  //auto resolver = Promise::Resolver::New(JS_CONTEXT()).ToLocalChecked();
  
  Local<Value> argv[] = {
  };
  Local<Object> tfObj = JS_TYPE(NUITextField)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_UNWRAPPED(tfObj, UITextField, ui);

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ui = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
      nui->SetNSObject(ui);
      [ui setPlaceholder:@"Enter text here"];
      [ui setFont:[UIFont systemFontOfSize:15]];
      [ui setBorderStyle:UITextBorderStyleRoundedRect];
      [ui setAutocorrectionType:UITextAutocorrectionTypeNo];
      [ui setKeyboardType:UIKeyboardTypeDefault];
      [ui setReturnKeyType:UIReturnKeyDone];
      [ui setClearButtonMode:UITextFieldViewModeWhileEditing];
      [ui setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
      [ui setTargetClosureWithClosure:^(UITextField*){
        Nan::HandleScope scope;
        sweetiekit::Resolve(nui->_callback);
        return true;
      }];
    });
  }
  
  if (info[4]->IsFunction()) {
    nui->_callback->Reset(Local<Function>::Cast(info[4]));
    NodeUIViewController* del = [[NodeUIViewController alloc] init];
    [ui associateValue:del withKey:@"sweetiekit.UITextField.callback"];
    [ui setDelegate:del];
  }

  info.GetReturnValue().Set(tfObj);
}

NAN_GETTER(NUITextField::TextGetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());
  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [view->As<UITextField>() text];
    });
  }
  if (str != nullptr) {
    info.GetReturnValue().Set(JS_STR([str UTF8String]));
  }
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

  //info.GetReturnValue().Set(JS_STR([[view->As<UITextField>() text] UTF8String]));
}

NAN_SETTER(NUITextField::DelegateSetter) {
  Nan::HandleScope scope;
//
//  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());
//  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(value));
//  auto delegate = ctrl->As<NodeUIViewController>();
//
//  @autoreleasepool {
//    dispatch_sync(dispatch_get_main_queue(), ^ {
//      [view->As<UITextField>() setDelegate:delegate];
//    });
//  }
  Nan::ThrowError("UITextField:setDelegate not implemented");
}

NAN_GETTER(NUITextField::CallbackGetter) {
  Nan::HandleScope scope;

  NUITextField *view = ObjectWrap::Unwrap<NUITextField>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_callback));
}

NAN_SETTER(NUITextField::CallbackSetter) {
  Nan::HandleScope scope;

  NUITextField *field = ObjectWrap::Unwrap<NUITextField>(info.This());
  field->_callback->Reset(Local<Function>::Cast(value));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UITextField* txt = field->As<UITextField>();
      [txt setTargetClosureWithClosure:^(UITextField*){
        sweetiekit::Resolve(field->_callback);
        return true;
      }];
    });
  }
}

NUITextField::NUITextField () : _callback(new Nan::Persistent<Function>()) {}
NUITextField::~NUITextField () { delete _callback; }

