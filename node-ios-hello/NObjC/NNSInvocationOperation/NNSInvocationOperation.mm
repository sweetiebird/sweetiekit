//
//  NNSInvocationOperation.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSInvocationOperation.h"

#define instancetype NSInvocationOperation
#define js_value_instancetype js_value_NSInvocationOperation

NNSInvocationOperation::NNSInvocationOperation() {}
NNSInvocationOperation::~NNSInvocationOperation() {}

JS_INIT_CLASS(NSInvocationOperation, NSOperation);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSInvocationOperation, NSOperation);
  // constant values (exports)
JS_INIT_CLASS_END(NSInvocationOperation, NSOperation);

NAN_METHOD(NNSInvocationOperation::New) {
  JS_RECONSTRUCT(NSInvocationOperation);
  @autoreleasepool {
    NSInvocationOperation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSInvocationOperation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSInvocationOperation alloc] init];
    }
    if (self) {
      NNSInvocationOperation *wrapper = new NNSInvocationOperation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSInvocationOperation::New: invalid arguments");
    }
  }
}
