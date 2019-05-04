//
//  NUIViewControllerTransitioningDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIViewControllerTransitioningDelegate.h"

Nan::Persistent<FunctionTemplate> NUIViewControllerTransitioningDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIViewControllerTransitioningDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewControllerTransitioningDelegate"));
  type.Reset(ctor);
  
  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIViewControllerTransitioningDelegate::New) {
  Nan::HandleScope scope;
  
  Local<Object> ctrlObj = info.This();
  
  NUIViewControllerTransitioningDelegate *ctrl = new NUIViewControllerTransitioningDelegate();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ctrl->SetNSObject([[SUIViewControllerTransitioningDelegate alloc] init]);
    });
  }
  ctrl->Wrap(ctrlObj);
  
  info.GetReturnValue().Set(ctrlObj);
}

NUIViewControllerTransitioningDelegate::NUIViewControllerTransitioningDelegate () {}
NUIViewControllerTransitioningDelegate::~NUIViewControllerTransitioningDelegate () {}
