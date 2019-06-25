//
//  NMTLSharedEventListener.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLSharedEventListener.h"

#define instancetype MTLSharedEventListener
#define js_value_instancetype js_value_MTLSharedEventListener

NMTLSharedEventListener::NMTLSharedEventListener() {}
NMTLSharedEventListener::~NMTLSharedEventListener() {}

JS_INIT_CLASS(MTLSharedEventListener, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLSharedEventListener, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MTLSharedEventListener, NSObject);

NAN_METHOD(NMTLSharedEventListener::New) {
  JS_RECONSTRUCT(MTLSharedEventListener);
  @autoreleasepool {
    MTLSharedEventListener* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MTLSharedEventListener *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MTLSharedEventListener alloc] init];
    }
    if (self) {
      NMTLSharedEventListener *wrapper = new NMTLSharedEventListener();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLSharedEventListener::New: invalid arguments");
    }
  }
}
