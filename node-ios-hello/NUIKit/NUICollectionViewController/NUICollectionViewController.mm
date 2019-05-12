//
//  NUICollectionViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUICollectionViewController.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUICollectionViewController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionViewController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUICollectionViewController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUICollectionViewController *ctrl = new NUICollectionViewController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UICollectionViewController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UICollectionViewController alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUICollectionViewController::NUICollectionViewController () {}
NUICollectionViewController::~NUICollectionViewController () {}
