//
//  NCIKernel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIKernel.h"

#define instancetype CIKernel
#define js_value_instancetype js_value_CIKernel

NCIKernel::NCIKernel() {}
NCIKernel::~NCIKernel() {}

JS_INIT_CLASS(CIKernel, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIKernel, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CIKernel, NSObject);

NAN_METHOD(NCIKernel::New) {
  JS_RECONSTRUCT(CIKernel);
  @autoreleasepool {
    CIKernel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIKernel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIKernel alloc] init];
    }
    if (self) {
      NCIKernel *wrapper = new NCIKernel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIKernel::New: invalid arguments");
    }
  }
}
