//
//  NAVAudioBuffer.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioBuffer.h"

NAVAudioBuffer::NAVAudioBuffer() {}
NAVAudioBuffer::~NAVAudioBuffer() {}

JS_INIT_CLASS(AVAudioBuffer, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioBuffer, NSObject);
JS_INIT_CLASS_END(AVAudioBuffer, NSObject);

NAN_METHOD(NAVAudioBuffer::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioBuffer(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioBuffer, info);
      return;
    }

    AVAudioBuffer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioBuffer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioBuffer alloc] init];
    }
    if (self) {
      NAVAudioBuffer *wrapper = new NAVAudioBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioBuffer::New: invalid arguments");
    }
  }
}
