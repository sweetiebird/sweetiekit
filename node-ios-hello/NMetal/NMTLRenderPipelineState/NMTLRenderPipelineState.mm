//
//  NMTLRenderPipelineState.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipelineState.h"

#define instancetype MTLRenderPipelineState
#define js_value_instancetype js_value_MTLRenderPipelineState

NMTLRenderPipelineState::NMTLRenderPipelineState() {}
NMTLRenderPipelineState::~NMTLRenderPipelineState() {}

JS_INIT_PROTOCOL(MTLRenderPipelineState, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderPipelineState, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLRenderPipelineState, NSObject);

NAN_METHOD(NMTLRenderPipelineState::New) {
  JS_RECONSTRUCT(MTLRenderPipelineState);
  @autoreleasepool {
    id<MTLRenderPipelineState> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLRenderPipelineState>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLRenderPipelineState> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLRenderPipelineState, value);
      self = value;
    }
    if (self) {
      NMTLRenderPipelineState *wrapper = new NMTLRenderPipelineState();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderPipelineState::New: invalid arguments");
    }
  }
}
