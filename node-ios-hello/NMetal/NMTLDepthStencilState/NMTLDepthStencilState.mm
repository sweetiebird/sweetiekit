//
//  NMTLDepthStencilState.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLDepthStencilState.h"

#define instancetype MTLDepthStencilState
#define js_value_instancetype js_value_MTLDepthStencilState

NMTLDepthStencilState::NMTLDepthStencilState() {}
NMTLDepthStencilState::~NMTLDepthStencilState() {}

JS_INIT_PROTOCOL(MTLDepthStencilState, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLDepthStencilState, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLDepthStencilState, NSObject);

NAN_METHOD(NMTLDepthStencilState::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLDepthStencilState);
  @autoreleasepool {
    id<MTLDepthStencilState> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLDepthStencilState>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLDepthStencilState> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLDepthStencilState, value);
      self = value;
    }
    if (self) {
      NMTLDepthStencilState *wrapper = new NMTLDepthStencilState();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLDepthStencilState::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMTLDepthStencilState::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLDepthStencilState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLDepthStencilState::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLDepthStencilState, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}
