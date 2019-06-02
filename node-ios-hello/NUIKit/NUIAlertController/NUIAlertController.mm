//
//  NUIAlertController.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIAlertController.h"

NUIAlertController::NUIAlertController() {}
NUIAlertController::~NUIAlertController() {}

JS_INIT_CLASS(UIAlertController, UIViewController);
  // instance members (proto)
  JS_SET_METHOD(proto, "addAction", AddAction);
  // static members (ctor)
  JS_INIT_CTOR(UIAlertController, UIViewController);
JS_INIT_CLASS_END(UIAlertController, UIViewController);

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

#include "NUIAlertAction.h"

NAN_METHOD(NUIAlertController::AddAction) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIAlertController, ui);

  NUIAlertAction *actionObj = ObjectWrap::Unwrap<NUIAlertAction>(Local<Object>::Cast(info[0]));

  @autoreleasepool {
    [ui addAction:actionObj->As<UIAlertAction>()];
  }
}

