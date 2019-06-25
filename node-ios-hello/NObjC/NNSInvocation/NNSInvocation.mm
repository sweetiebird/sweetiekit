//
//  NNSInvocation.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSInvocation.h"

#define instancetype NSInvocation
#define js_value_instancetype js_value_NSInvocation

NNSInvocation::NNSInvocation() {}
NNSInvocation::~NNSInvocation() {}

JS_INIT_CLASS(NSInvocation, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSInvocation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSInvocation, NSObject);

NAN_METHOD(NNSInvocation::New) {
  JS_RECONSTRUCT(NSInvocation);
  @autoreleasepool {
    NSInvocation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSInvocation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSInvocation alloc] init];
    }
    if (self) {
      NNSInvocation *wrapper = new NNSInvocation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSInvocation::New: invalid arguments");
    }
  }
}
