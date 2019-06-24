//
//  NMTLRenderPipelineDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineDescriptor.h"

#define instancetype MTLRenderPipelineDescriptor
#define js_value_instancetype js_value_MTLRenderPipelineDescriptor

NMTLRenderPipelineDescriptor::NMTLRenderPipelineDescriptor() {}
NMTLRenderPipelineDescriptor::~NMTLRenderPipelineDescriptor() {}

JS_INIT_CLASS(MTLRenderPipelineDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPipelineDescriptor, NSObject);

NAN_METHOD(NMTLRenderPipelineDescriptor::New) {
  JS_RECONSTRUCT(MTLRenderPipelineDescriptor);
  @autoreleasepool {
    MTLRenderPipelineDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineDescriptor alloc] init];
    }
    if (self) {
      NMTLRenderPipelineDescriptor *wrapper = new NMTLRenderPipelineDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineDescriptor::New: invalid arguments");
    }
  }
}
