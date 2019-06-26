//
//  NMTLFence.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLFence.h"

#define instancetype MTLFence
#define js_value_instancetype js_value_MTLFence

NMTLFence::NMTLFence() {}
NMTLFence::~NMTLFence() {}

JS_INIT_PROTOCOL(MTLFence, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP(label);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLFence, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLFence, NSObject);

NAN_METHOD(NMTLFence::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLFence);
  @autoreleasepool {
    id<MTLFence> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLFence>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLFence> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLFence, value);
      self = value;
    }
    if (self) {
      NMTLFence *wrapper = new NMTLFence();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLFence::New: invalid arguments");
    }
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLFence::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLFence, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_GETTER(NMTLFence::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLFence, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLFence::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLFence, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}
