//
//  NUIPresentationController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "NUIPresentationController.h"
#include "NUIViewController.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NUIPresentationController::type;

NUIPresentationController::NUIPresentationController () {}
NUIPresentationController::~NUIPresentationController () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPresentationController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPresentationController"));
  type.Reset(ctor);
  
  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPresentationController::New) {
  Nan::HandleScope scope;
  
  Local<Object> obj = info.This();
  
  NUIPresentationController *view = new NUIPresentationController();
  
  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIPresentationController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      NUIViewController *presented = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));
      NUIViewController *presenting = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[1]));
      dispatch_sync(dispatch_get_main_queue(), ^ {
        view->SetNSObject([[UIPresentationController alloc] initWithPresentedViewController:presented->As<UIViewController>() presentingViewController:presenting->As<UIViewController>()]);
      });
    }
  }
  view->Wrap(obj);
  
  JS_SET_RETURN(obj);
}
