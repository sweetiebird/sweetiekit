//
//  NMTLEvent.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLEvent.h"

#define instancetype MTLEvent
#define js_value_instancetype js_value_MTLEvent

NMTLEvent::NMTLEvent() {}
NMTLEvent::~NMTLEvent() {}

JS_INIT_PROTOCOL(MTLEvent, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLEvent, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLEvent, NSObject);


NAN_METHOD(NMTLEvent::New) {
  JS_RECONSTRUCT(MTLEvent);
  @autoreleasepool {
    id<MTLEvent> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLEvent>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLEvent> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLEvent, value);
      self = value;
    }
    if (self) {
      NMTLEvent *wrapper = new NMTLEvent();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLEvent::New: invalid arguments");
    }
  }
}
