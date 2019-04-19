//
//  NAppDelegate.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIApplication.h"

Nan::Persistent<FunctionTemplate> NUIApplication::type;

Local<Object> NUIApplication::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIApplication"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIApplication::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIApplication *app = new NUIApplication();

  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
        app->me = [UIApplication sharedApplication];
    });
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

Local<Object> makeUIApplication() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIApplication::Initialize(isolate));
}

NUIApplication::NUIApplication () {}
NUIApplication::~NUIApplication () {}


