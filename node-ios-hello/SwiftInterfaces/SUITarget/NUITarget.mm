//
//  NUITarget.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NNSObject.h"
#include "NUITarget.h"

Nan::Persistent<FunctionTemplate> NUITarget::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITarget::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITarget"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITarget::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITarget *target = new NUITarget();

  if (info[0]->IsExternal()) {
    target->SetNSObject((__bridge SUITarget *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      target->SetNSObject([[SUITarget alloc] init]);
    }
  }

  target->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NUITarget::NUITarget () {}
NUITarget::~NUITarget () {}
