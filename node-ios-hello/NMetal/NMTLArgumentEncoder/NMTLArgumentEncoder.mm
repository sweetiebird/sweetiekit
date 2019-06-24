//
//  NMTLArgumentEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLArgumentEncoder.h"

#define instancetype MTLArgumentEncoder
#define js_value_instancetype js_value_MTLArgumentEncoder

NMTLArgumentEncoder::NMTLArgumentEncoder() {}
NMTLArgumentEncoder::~NMTLArgumentEncoder() {}

JS_INIT_PROTOCOL(MTLArgumentEncoder, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLArgumentEncoder, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLArgumentEncoder, NSObject);


NAN_METHOD(NMTLArgumentEncoder::New) {
  JS_RECONSTRUCT(MTLArgumentEncoder);
  @autoreleasepool {
    id<MTLArgumentEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLArgumentEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLArgumentEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLArgumentEncoder, value);
      self = value;
    }
    if (self) {
      NMTLArgumentEncoder *wrapper = new NMTLArgumentEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLArgumentEncoder::New: invalid arguments");
    }
  }
}
