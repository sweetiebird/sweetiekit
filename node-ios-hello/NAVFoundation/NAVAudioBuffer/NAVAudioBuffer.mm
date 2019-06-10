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
  JS_ASSIGN_PROTO_PROP_READONLY(format);
  JS_ASSIGN_PROTO_PROP_READONLY(audioBufferList);
  JS_ASSIGN_PROTO_PROP_READONLY(mutableAudioBufferList);
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

#include "NAVAudioFormat.h"

NAN_GETTER(NAVAudioBuffer::formatGetter) {
  JS_UNWRAP(AVAudioBuffer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self format]));
  }
}

NAN_GETTER(NAVAudioBuffer::audioBufferListGetter) {
  JS_UNWRAP(AVAudioBuffer, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AudioBufferList([self audioBufferList]));
    #endif
  }
}

NAN_GETTER(NAVAudioBuffer::mutableAudioBufferListGetter) {
  JS_UNWRAP(AVAudioBuffer, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_AudioBufferList([self mutableAudioBufferList]));
    #endif
  }
}
