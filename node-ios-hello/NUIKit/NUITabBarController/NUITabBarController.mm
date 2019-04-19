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

std::pair<Local<Object>, Local<FunctionTemplate>> NUITabBarController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITabBarController"));
  ctor->Inherit(Nan::New(NUIViewController::type));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "setViewControllers", SetViewControllers);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITabBarController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITabBarController *ctrl = new NUITabBarController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITabBarController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UITabBarController alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
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
      [controllers addObject:view->As<UIViewController>()];
    }
  }
  
  UITabBarController* c = vc->As<UITabBarController>();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [c setViewControllers:controllers animated:animated];
    });
  }
}
