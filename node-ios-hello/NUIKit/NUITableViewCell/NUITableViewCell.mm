//
//  NUITableViewCell.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableViewCell.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUITableViewCell::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableViewCell::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableViewCell"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITableViewCell::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITableViewCell *ctrl = new NUITableViewCell();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITableViewCell *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UITableViewCell alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUITableViewCell::NUITableViewCell () {}
NUITableViewCell::~NUITableViewCell () {}
