//
//  NMTLSharedEvent.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLSharedEvent.h"

#define instancetype MTLSharedEvent
#define js_value_instancetype js_value_MTLSharedEvent

NMTLSharedEvent::NMTLSharedEvent() {}
NMTLSharedEvent::~NMTLSharedEvent() {}

JS_INIT_PROTOCOL(MTLSharedEvent, MTLEvent);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLSharedEvent, MTLEvent);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLSharedEvent, MTLEvent);


NAN_METHOD(NMTLSharedEvent::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLSharedEvent);
  @autoreleasepool {
    id<MTLSharedEvent> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLSharedEvent>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLSharedEvent> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLSharedEvent, value);
      self = value;
    }
    if (self) {
      NMTLSharedEvent *wrapper = new NMTLSharedEvent();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLSharedEvent::New: invalid arguments");
    }
  }
}
