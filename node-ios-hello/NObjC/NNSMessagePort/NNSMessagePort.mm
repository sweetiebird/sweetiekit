//
//  NNSMessagePort.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMessagePort.h"

#define instancetype NSMessagePort
#define js_value_instancetype js_value_NSMessagePort

NNSMessagePort::NNSMessagePort() {}
NNSMessagePort::~NNSMessagePort() {}

JS_INIT_CLASS(NSMessagePort, NSPort);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSMessagePort, NSPort);
  // constant values (exports)
JS_INIT_CLASS_END(NSMessagePort, NSPort);

NAN_METHOD(NNSMessagePort::New) {
  JS_RECONSTRUCT(NSMessagePort);
  @autoreleasepool {
    NSMessagePort* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSMessagePort *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSMessagePort alloc] init];
    }
    if (self) {
      NNSMessagePort *wrapper = new NNSMessagePort();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSMessagePort::New: invalid arguments");
    }
  }
}
