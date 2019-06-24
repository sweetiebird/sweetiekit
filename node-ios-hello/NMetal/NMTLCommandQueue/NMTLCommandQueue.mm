//
//  NMTLCommandQueue.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLCommandQueue.h"

#define instancetype MTLCommandQueue
#define js_value_instancetype js_value_MTLCommandQueue

NMTLCommandQueue::NMTLCommandQueue() {}
NMTLCommandQueue::~NMTLCommandQueue() {}

JS_INIT_PROTOCOL(MTLCommandQueue, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLCommandQueue, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLCommandQueue, NSObject);

NAN_METHOD(NMTLCommandQueue::New) {
  JS_RECONSTRUCT(MTLCommandQueue);
  @autoreleasepool {
    id<MTLCommandQueue> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLCommandQueue>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLCommandQueue> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLCommandQueue, value);
      self = value;
    }
    if (self) {
      NMTLCommandQueue *wrapper = new NMTLCommandQueue();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLCommandQueue::New: invalid arguments");
    }
  }
}
