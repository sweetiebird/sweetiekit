//
//  NUITabBarController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITabBarController.h"

Nan::Persistent<FunctionTemplate> NUITabBarController::type;

Local<Object> NUITabBarController::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITabController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUITabBarController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITabBarController *ctrl = new NUITabBarController();

  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
        ctrl->controller = [UITabBarController alloc];
    });
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

Local<Object> makeUITabBarController() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUITabBarController::Initialize(isolate));
}

NUITabBarController::NUITabBarController () {}
NUITabBarController::~NUITabBarController () {}

