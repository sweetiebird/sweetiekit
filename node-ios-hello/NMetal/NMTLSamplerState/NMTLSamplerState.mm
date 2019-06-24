//
//  NMTLSamplerState.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLSamplerState.h"

#define instancetype MTLSamplerState
#define js_value_instancetype js_value_MTLSamplerState

NMTLSamplerState::NMTLSamplerState() {}
NMTLSamplerState::~NMTLSamplerState() {}

JS_INIT_PROTOCOL(MTLSamplerState, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLSamplerState, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLSamplerState, NSObject);

NAN_METHOD(NMTLSamplerState::New) {
  JS_RECONSTRUCT(MTLSamplerState);
  @autoreleasepool {
    id<MTLSamplerState> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLSamplerState>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLSamplerState> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLSamplerState, value);
      self = value;
    }
    if (self) {
      NMTLSamplerState *wrapper = new NMTLSamplerState();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLSamplerState::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLSamplerState::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLSamplerState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLSamplerState::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLSamplerState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}
