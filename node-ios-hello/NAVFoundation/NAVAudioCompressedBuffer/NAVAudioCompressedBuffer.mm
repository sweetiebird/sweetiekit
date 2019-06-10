//
//  NAVAudioCompressedBuffer.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioCompressedBuffer.h"

NAVAudioCompressedBuffer::NAVAudioCompressedBuffer() {}
NAVAudioCompressedBuffer::~NAVAudioCompressedBuffer() {}

JS_INIT_CLASS(AVAudioCompressedBuffer, AVAudioBuffer);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioCompressedBuffer, AVAudioBuffer);
JS_INIT_CLASS_END(AVAudioCompressedBuffer, AVAudioBuffer);

NAN_METHOD(NAVAudioCompressedBuffer::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioCompressedBuffer(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioCompressedBuffer, info);
      return;
    }

    AVAudioCompressedBuffer* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioCompressedBuffer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioCompressedBuffer alloc] init];
    }
    if (self) {
      NAVAudioCompressedBuffer *wrapper = new NAVAudioCompressedBuffer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioCompressedBuffer::New: invalid arguments");
    }
  }
}
