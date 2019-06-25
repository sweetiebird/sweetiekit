//
//  NMTLBlitCommandEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLBlitCommandEncoder.h"

#define instancetype MTLBlitCommandEncoder
#define js_value_instancetype js_value_MTLBlitCommandEncoder

NMTLBlitCommandEncoder::NMTLBlitCommandEncoder() {}
NMTLBlitCommandEncoder::~NMTLBlitCommandEncoder() {}

JS_INIT_PROTOCOL(MTLBlitCommandEncoder, MTLCommandEncoder);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLBlitCommandEncoder, MTLCommandEncoder);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLBlitCommandEncoder, MTLCommandEncoder);


NAN_METHOD(NMTLBlitCommandEncoder::New) {
  JS_RECONSTRUCT(MTLBlitCommandEncoder);
  @autoreleasepool {
    id<MTLBlitCommandEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLBlitCommandEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLBlitCommandEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLBlitCommandEncoder, value);
      self = value;
    }
    if (self) {
      NMTLBlitCommandEncoder *wrapper = new NMTLBlitCommandEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLBlitCommandEncoder::New: invalid arguments");
    }
  }
}
