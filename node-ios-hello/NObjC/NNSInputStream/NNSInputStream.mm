//
//  NNSInputStream.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSInputStream.h"

NNSInputStream::NNSInputStream() {}
NNSInputStream::~NNSInputStream() {}

JS_INIT_CLASS(NSInputStream, NSStream);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSInputStream, NSStream);
JS_INIT_CLASS_END(NSInputStream, NSStream);

NAN_METHOD(NNSInputStream::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSInputStream(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSInputStream, info);
      return;
    }

    NSInputStream* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSInputStream *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSInputStream alloc] init];
    }
    if (self) {
      NNSInputStream *wrapper = new NNSInputStream();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSInputStream::New: invalid arguments");
    }
  }
}
