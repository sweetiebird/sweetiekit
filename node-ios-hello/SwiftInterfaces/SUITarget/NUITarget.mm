//
//  NUITarget.m
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITarget.h"

JS_INIT_CLASS(UITarget, NSObject);
  // prototype members (proto)

  JS_INIT_CTOR(UITarget, NSObject);
  // static members (ctor)

JS_INIT_CLASS_END(UITarget, NSObject);

NAN_METHOD(NUITarget::New) {
  JS_RECONSTRUCT(UITarget);

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
