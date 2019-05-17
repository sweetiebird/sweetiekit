//
//  NUIAlertController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIAlertController.h"
#include "NUIViewController.h"
#include "NUIAlertAction.h"

Nan::Persistent<FunctionTemplate> NUIAlertController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIAlertController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIAlertController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addAction", AddAction);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIAlertController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIAlertController *ctrl = new NUIAlertController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UIAlertController *)(info[0].As<External>()->Value()));
  } else {
    std::string title;
    std::string message;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      title = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    if (info[1]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
      message = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }

    @autoreleasepool {
      NSString *titleStr = [NSString stringWithUTF8String:title.c_str()];
      NSString *messageStr = [NSString stringWithUTF8String:message.c_str()];
      ctrl->SetNSObject([UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert]);
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUIAlertController::NUIAlertController () {}
NUIAlertController::~NUIAlertController () {}

NAN_METHOD(NUIAlertController::AddAction) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIAlertController, ui);

  NUIAlertAction *actionObj = ObjectWrap::Unwrap<NUIAlertAction>(Local<Object>::Cast(info[0]));

  @autoreleasepool {
    [ui addAction:actionObj->As<UIAlertAction>()];
  }
}

