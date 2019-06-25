//
//  NMTLSharedEventHandle.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLSharedEventHandle.h"

#define instancetype MTLSharedEventHandle
#define js_value_instancetype js_value_MTLSharedEventHandle

NMTLSharedEventHandle::NMTLSharedEventHandle() {}
NMTLSharedEventHandle::~NMTLSharedEventHandle() {}

JS_INIT_CLASS(MTLSharedEventHandle, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLSharedEventHandle, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLSharedEventHandle, NSObject);

NAN_METHOD(NMTLSharedEventHandle::New) {
  JS_RECONSTRUCT(MTLSharedEventHandle);
  @autoreleasepool {
    MTLSharedEventHandle* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLSharedEventHandle *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLSharedEventHandle alloc] init];
    }
    if (self) {
      NMTLSharedEventHandle *wrapper = new NMTLSharedEventHandle();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLSharedEventHandle::New: invalid arguments");
    }
  }
}
