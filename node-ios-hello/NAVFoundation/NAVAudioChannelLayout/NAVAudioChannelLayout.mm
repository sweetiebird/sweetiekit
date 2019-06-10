//
//  NAVAudioChannelLayout.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioChannelLayout.h"

NAVAudioChannelLayout::NAVAudioChannelLayout() {}
NAVAudioChannelLayout::~NAVAudioChannelLayout() {}

JS_INIT_CLASS(AVAudioChannelLayout, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioChannelLayout, NSObject);
JS_INIT_CLASS_END(AVAudioChannelLayout, NSObject);

NAN_METHOD(NAVAudioChannelLayout::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioChannelLayout(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioChannelLayout, info);
      return;
    }

    AVAudioChannelLayout* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioChannelLayout *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioChannelLayout *wrapper = new NAVAudioChannelLayout();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioChannelLayout::New: invalid arguments");
    }
  }
}
