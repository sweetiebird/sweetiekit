//
//  NNSStream.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSStream.h"

NNSStream::NNSStream() {}
NNSStream::~NNSStream() {}

JS_INIT_CLASS(NSStream, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSStream, NSObject);
JS_INIT_CLASS_END(NSStream, NSObject);

NAN_METHOD(NNSStream::New) {
  JS_RECONSTRUCT(NSStream);
  @autoreleasepool {
    NSStream* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSStream *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSStream alloc] init];
    }
    if (self) {
      NNSStream *wrapper = new NNSStream();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSStream::New: invalid arguments");
    }
  }
}
