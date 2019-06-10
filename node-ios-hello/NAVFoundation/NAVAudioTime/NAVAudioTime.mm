//
//  NAVAudioTime.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioTime.h"

NAVAudioTime::NAVAudioTime() {}
NAVAudioTime::~NAVAudioTime() {}

JS_INIT_CLASS(AVAudioTime, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioTime, NSObject);
JS_INIT_CLASS_END(AVAudioTime, NSObject);

NAN_METHOD(NAVAudioTime::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioTime(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioTime, info);
      return;
    }

    AVAudioTime* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioTime *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioTime alloc] init];
    }
    if (self) {
      NAVAudioTime *wrapper = new NAVAudioTime();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioTime::New: invalid arguments");
    }
  }
}
