//
//  NMTLComputePipelineDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLComputePipelineDescriptor.h"

#define instancetype MTLComputePipelineDescriptor
#define js_value_instancetype js_value_MTLComputePipelineDescriptor

NMTLComputePipelineDescriptor::NMTLComputePipelineDescriptor() {}
NMTLComputePipelineDescriptor::~NMTLComputePipelineDescriptor() {}

JS_INIT_CLASS(MTLComputePipelineDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLComputePipelineDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLComputePipelineDescriptor, NSObject);

NAN_METHOD(NMTLComputePipelineDescriptor::New) {
  JS_RECONSTRUCT(MTLComputePipelineDescriptor);
  @autoreleasepool {
    MTLComputePipelineDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLComputePipelineDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLComputePipelineDescriptor alloc] init];
    }
    if (self) {
      NMTLComputePipelineDescriptor *wrapper = new NMTLComputePipelineDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLComputePipelineDescriptor::New: invalid arguments");
    }
  }
}
