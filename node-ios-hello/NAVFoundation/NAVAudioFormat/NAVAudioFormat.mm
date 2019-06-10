//
//  NAVAudioFormat.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioFormat.h"

NAVAudioFormat::NAVAudioFormat() {}
NAVAudioFormat::~NAVAudioFormat() {}

JS_INIT_CLASS(AVAudioFormat, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioFormat, NSObject);
JS_INIT_CLASS_END(AVAudioFormat, NSObject);

NAN_METHOD(NAVAudioFormat::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioFormat(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioFormat, info);
      return;
    }

    AVAudioFormat* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioFormat *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioFormat alloc] init];
    }
    if (self) {
      NAVAudioFormat *wrapper = new NAVAudioFormat();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioFormat::New: invalid arguments");
    }
  }
}
