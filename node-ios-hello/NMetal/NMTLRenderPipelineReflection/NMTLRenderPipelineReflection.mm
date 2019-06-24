//
//  NMTLRenderPipelineReflection.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineReflection.h"

#define instancetype MTLRenderPipelineReflection
#define js_value_instancetype js_value_MTLRenderPipelineReflection

NMTLRenderPipelineReflection::NMTLRenderPipelineReflection() {}
NMTLRenderPipelineReflection::~NMTLRenderPipelineReflection() {}

JS_INIT_CLASS(MTLRenderPipelineReflection, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineReflection, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLRenderPipelineReflection, NSObject);

NAN_METHOD(NMTLRenderPipelineReflection::New) {
  JS_RECONSTRUCT(MTLRenderPipelineReflection);
  @autoreleasepool {
    MTLRenderPipelineReflection* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLRenderPipelineReflection *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLRenderPipelineReflection alloc] init];
    }
    if (self) {
      NMTLRenderPipelineReflection *wrapper = new NMTLRenderPipelineReflection();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineReflection::New: invalid arguments");
    }
  }
}
