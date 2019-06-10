//
//  NAVAudioPCMBuffer.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioPCMBuffer.h"

NAVAudioPCMBuffer::NAVAudioPCMBuffer() {}
NAVAudioPCMBuffer::~NAVAudioPCMBuffer() {}

JS_INIT_CLASS(AVAudioPCMBuffer, AVAudioBuffer);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioPCMBuffer, AVAudioBuffer);
JS_INIT_CLASS_END(AVAudioPCMBuffer, AVAudioBuffer);

NAN_METHOD(NAVAudioPCMBuffer::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioPCMBuffer(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioPCMBuffer, info);
      return;
    }

    AVAudioPCMBuffer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioPCMBuffer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioPCMBuffer alloc] init];
    }
    if (self) {
      NAVAudioPCMBuffer *wrapper = new NAVAudioPCMBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioPCMBuffer::New: invalid arguments");
    }
  }
}
