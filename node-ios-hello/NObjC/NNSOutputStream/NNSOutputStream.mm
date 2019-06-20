//
//  NNSOutputStream.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSOutputStream.h"

#define instancetype NSOutputStream
#define js_value_instancetype js_value_NSOutputStream

NNSOutputStream::NNSOutputStream() {}
NNSOutputStream::~NNSOutputStream() {}

JS_INIT_CLASS(NSOutputStream, NSStream);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSOutputStream, NSStream);
  // constant values (exports)
JS_INIT_CLASS_END(NSOutputStream, NSStream);

NAN_METHOD(NNSOutputStream::New) {
  JS_RECONSTRUCT(NSOutputStream);
  @autoreleasepool {
    NSOutputStream* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSOutputStream *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSOutputStream alloc] init];
    }
    if (self) {
      NNSOutputStream *wrapper = new NNSOutputStream();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSOutputStream::New: invalid arguments");
    }
  }
}
