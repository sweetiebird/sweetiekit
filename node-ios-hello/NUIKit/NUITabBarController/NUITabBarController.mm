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
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUITabBarController::type;

Local<Object> NUITabBarController::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITabController"));
  ctor->Inherit(Nan::New(NUIViewController::type));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "setViewControllers", SetViewControllers);

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUITabBarController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITabBarController *ctrl = new NUITabBarController();

  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
        ctrl->me = [UITabBarController alloc];
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


NAN_METHOD(NUITabBarController::SetViewControllers) {
  NUITabBarController *vc = ObjectWrap::Unwrap<NUITabBarController>(Local<Object>::Cast(info.This()));


  Local<Array> array = Local<Array>::Cast(info[0]);
  bool animated = TO_BOOL(info[1]);
  
  NSMutableArray *controllers = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NUIViewController *view = ObjectWrap::Unwrap<NUIViewController>(JS_OBJ(array->Get(i)));
      [controllers addObject:view->me];
    }
  }
  
  UITabBarController* c = (UITabBarController*)vc->me;
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      [c setViewControllers:controllers animated:animated];
      [[[UIApplication sharedApplication] keyWindow] setRootViewController:c];
    });
  }
}
