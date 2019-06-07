//
//  NNSCoder.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSCoder.h"

NNSCoder::NNSCoder() {}
NNSCoder::~NNSCoder() {}

JS_INIT_CLASS(NSCoder, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSCoder, NSObject);
JS_INIT_CLASS_END(NSCoder, NSObject);

NAN_METHOD(NNSCoder::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'NSCoder(...)', turn into construct call.
      JS_SET_RETURN_NEW(NSCoder, info);
      return;
    }

    NSCoder* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge NSCoder *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSCoder alloc] init];
    }
    if (self) {
      NNSCoder *wrapper = new NNSCoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSCoder::New: invalid arguments");
    }
  }
}
