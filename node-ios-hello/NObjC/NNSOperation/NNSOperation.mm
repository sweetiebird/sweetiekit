//
//  NNSOperation.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSOperation.h"

#define instancetype NSOperation
#define js_value_instancetype js_value_NSOperation

NNSOperation::NNSOperation() {}
NNSOperation::~NNSOperation() {}

JS_INIT_CLASS(NSOperation, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSOperation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSOperation, NSObject);

NAN_METHOD(NNSOperation::New) {
  JS_RECONSTRUCT(NSOperation);
  @autoreleasepool {
    NSOperation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOperation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSOperation alloc] init];
    }
    if (self) {
      NNSOperation *wrapper = new NNSOperation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOperation::New: invalid arguments");
    }
  }
}
