//
//  NNSBlockOperation.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSBlockOperation.h"

#define instancetype NSBlockOperation
#define js_value_instancetype js_value_NSBlockOperation

NNSBlockOperation::NNSBlockOperation() {}
NNSBlockOperation::~NNSBlockOperation() {}

JS_INIT_CLASS(NSBlockOperation, NSOperation);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSBlockOperation, NSOperation);
  // constant values (exports)
JS_INIT_CLASS_END(NSBlockOperation, NSOperation);

NAN_METHOD(NNSBlockOperation::New) {
  JS_RECONSTRUCT(NSBlockOperation);
  @autoreleasepool {
    NSBlockOperation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSBlockOperation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSBlockOperation alloc] init];
    }
    if (self) {
      NNSBlockOperation *wrapper = new NNSBlockOperation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSBlockOperation::New: invalid arguments");
    }
  }
}
