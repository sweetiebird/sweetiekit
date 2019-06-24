//
//  NMTLComputePipelineReflection.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLComputePipelineReflection.h"

#define instancetype MTLComputePipelineReflection
#define js_value_instancetype js_value_MTLComputePipelineReflection

NMTLComputePipelineReflection::NMTLComputePipelineReflection() {}
NMTLComputePipelineReflection::~NMTLComputePipelineReflection() {}

JS_INIT_CLASS(MTLComputePipelineReflection, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLComputePipelineReflection, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLComputePipelineReflection, NSObject);

NAN_METHOD(NMTLComputePipelineReflection::New) {
  JS_RECONSTRUCT(MTLComputePipelineReflection);
  @autoreleasepool {
    MTLComputePipelineReflection* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLComputePipelineReflection *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLComputePipelineReflection alloc] init];
    }
    if (self) {
      NMTLComputePipelineReflection *wrapper = new NMTLComputePipelineReflection();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLComputePipelineReflection::New: invalid arguments");
    }
  }
}
