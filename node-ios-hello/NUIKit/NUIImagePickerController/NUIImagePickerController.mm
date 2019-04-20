//
//  NUIImagePickerController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImagePickerController.h"
#include "NUINavigationController.h"
#include "NUIViewController.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIImagePickerController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImagePickerController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUINavigationController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImagePickerController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImagePickerController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerController *ctrl = new NUIImagePickerController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UIImagePickerController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        ctrl->SetNSObject([[UIImagePickerController alloc] init]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUIImagePickerController::NUIImagePickerController () {}
NUIImagePickerController::~NUIImagePickerController () {}
