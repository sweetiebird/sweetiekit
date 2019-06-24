//
//  NMTLTileRenderPipelineDescriptor.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLTileRenderPipelineDescriptor.h"

#define instancetype MTLTileRenderPipelineDescriptor
#define js_value_instancetype js_value_MTLTileRenderPipelineDescriptor

NMTLTileRenderPipelineDescriptor::NMTLTileRenderPipelineDescriptor() {}
NMTLTileRenderPipelineDescriptor::~NMTLTileRenderPipelineDescriptor() {}

JS_INIT_CLASS(MTLTileRenderPipelineDescriptor, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLTileRenderPipelineDescriptor, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLTileRenderPipelineDescriptor, NSObject);

NAN_METHOD(NMTLTileRenderPipelineDescriptor::New) {
  JS_RECONSTRUCT(MTLTileRenderPipelineDescriptor);
  @autoreleasepool {
    MTLTileRenderPipelineDescriptor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLTileRenderPipelineDescriptor *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLTileRenderPipelineDescriptor alloc] init];
    }
    if (self) {
      NMTLTileRenderPipelineDescriptor *wrapper = new NMTLTileRenderPipelineDescriptor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLTileRenderPipelineDescriptor::New: invalid arguments");
    }
  }
}
