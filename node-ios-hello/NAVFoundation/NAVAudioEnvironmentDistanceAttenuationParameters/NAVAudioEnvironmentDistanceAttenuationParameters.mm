//
//  NAVAudioEnvironmentDistanceAttenuationParameters.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioEnvironmentDistanceAttenuationParameters.h"

#define instancetype AVAudioEnvironmentDistanceAttenuationParameters
#define js_value_instancetype js_value_AVAudioEnvironmentDistanceAttenuationParameters

NAVAudioEnvironmentDistanceAttenuationParameters::NAVAudioEnvironmentDistanceAttenuationParameters() {}
NAVAudioEnvironmentDistanceAttenuationParameters::~NAVAudioEnvironmentDistanceAttenuationParameters() {}

JS_INIT_CLASS(AVAudioEnvironmentDistanceAttenuationParameters, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioEnvironmentDistanceAttenuationParameters, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioEnvironmentDistanceAttenuationParameters, NSObject);

NAN_METHOD(NAVAudioEnvironmentDistanceAttenuationParameters::New) {
  JS_RECONSTRUCT(AVAudioEnvironmentDistanceAttenuationParameters);
  @autoreleasepool {
    AVAudioEnvironmentDistanceAttenuationParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioEnvironmentDistanceAttenuationParameters *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioEnvironmentDistanceAttenuationParameters *wrapper = new NAVAudioEnvironmentDistanceAttenuationParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioEnvironmentDistanceAttenuationParameters::New: invalid arguments");
    }
  }
}
