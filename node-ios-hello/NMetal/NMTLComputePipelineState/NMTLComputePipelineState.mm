//
//  NMTLComputePipelineState.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLComputePipelineState.h"

#define instancetype MTLComputePipelineState
#define js_value_instancetype js_value_MTLComputePipelineState

NMTLComputePipelineState::NMTLComputePipelineState() {}
NMTLComputePipelineState::~NMTLComputePipelineState() {}

JS_INIT_PROTOCOL(MTLComputePipelineState, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLComputePipelineState, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLComputePipelineState, NSObject);

NAN_METHOD(NMTLComputePipelineState::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLComputePipelineState);
  @autoreleasepool {
    id<MTLComputePipelineState> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLComputePipelineState>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLComputePipelineState> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLComputePipelineState, value);
      self = value;
    }
    if (self) {
      NMTLComputePipelineState *wrapper = new NMTLComputePipelineState();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLComputePipelineState::New: invalid arguments");
    }
  }
}
