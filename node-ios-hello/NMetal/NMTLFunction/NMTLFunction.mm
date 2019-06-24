//
//  NMTLFunction.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLFunction.h"

#define instancetype MTLFunction
#define js_value_instancetype js_value_MTLFunction

NMTLFunction::NMTLFunction() {}
NMTLFunction::~NMTLFunction() {}

JS_INIT_PROTOCOL(MTLFunction, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLFunction, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLFunction, NSObject);

NAN_METHOD(NMTLFunction::New) {
  JS_RECONSTRUCT(MTLFunction);
  @autoreleasepool {
    id<MTLFunction> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLFunction>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLFunction> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLFunction, value);
      self = value;
    }
    if (self) {
      NMTLFunction *wrapper = new NMTLFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLFunction::New: invalid arguments");
    }
  }
}
