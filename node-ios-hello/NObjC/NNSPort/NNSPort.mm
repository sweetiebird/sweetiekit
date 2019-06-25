//
//  NNSPort.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSPort.h"

#define instancetype NSPort
#define js_value_instancetype js_value_NSPort

NNSPort::NNSPort() {}
NNSPort::~NNSPort() {}

JS_INIT_CLASS(NSPort, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSPort, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSPort, NSObject);

NAN_METHOD(NNSPort::New) {
  JS_RECONSTRUCT(NSPort);
  @autoreleasepool {
    NSPort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSPort *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSPort alloc] init];
    }
    if (self) {
      NNSPort *wrapper = new NNSPort();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSPort::New: invalid arguments");
    }
  }
}
