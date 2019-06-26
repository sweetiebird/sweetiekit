//
//  NMTLParallelRenderCommandEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLParallelRenderCommandEncoder.h"

#define instancetype MTLParallelRenderCommandEncoder
#define js_value_instancetype js_value_MTLParallelRenderCommandEncoder

NMTLParallelRenderCommandEncoder::NMTLParallelRenderCommandEncoder() {}
NMTLParallelRenderCommandEncoder::~NMTLParallelRenderCommandEncoder() {}

JS_INIT_PROTOCOL(MTLParallelRenderCommandEncoder, MTLCommandEncoder);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLParallelRenderCommandEncoder, MTLCommandEncoder);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLParallelRenderCommandEncoder, MTLCommandEncoder);


NAN_METHOD(NMTLParallelRenderCommandEncoder::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLParallelRenderCommandEncoder);
  @autoreleasepool {
    id<MTLParallelRenderCommandEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLParallelRenderCommandEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLParallelRenderCommandEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLParallelRenderCommandEncoder, value);
      self = value;
    }
    if (self) {
      NMTLParallelRenderCommandEncoder *wrapper = new NMTLParallelRenderCommandEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLParallelRenderCommandEncoder::New: invalid arguments");
    }
  }
}
