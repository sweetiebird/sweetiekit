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
#include "NUIWindow.h"

Nan::Persistent<FunctionTemplate> NUIApplication::type;
UIWindow* NUIApplication::tmp_UIWindow;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIApplication::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIApplication"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("keyWindow"), KeyWindowGetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIApplication::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIApplication *app = new NUIApplication();

  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
        app->SetNSObject([UIApplication sharedApplication]);
    });
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NUIApplication::KeyWindowGetter)
{
  NUIApplication *app = ObjectWrap::Unwrap<NUIApplication>(Local<Object>::Cast(info.This()));

  tmp_UIWindow = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      tmp_UIWindow = [app->As<UIApplication>() keyWindow];
    });
  }

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)tmp_UIWindow)
  };
  Local<Object> winObj = JS_TYPE(NUIWindow)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  
  info.GetReturnValue().Set(winObj);
}

NUIApplication::NUIApplication () {}
NUIApplication::~NUIApplication () {}


