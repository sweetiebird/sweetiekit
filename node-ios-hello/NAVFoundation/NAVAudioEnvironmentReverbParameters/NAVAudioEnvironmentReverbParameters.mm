//
//  NAVAudioEnvironmentReverbParameters.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioEnvironmentReverbParameters.h"

#define instancetype AVAudioEnvironmentReverbParameters
#define js_value_instancetype js_value_AVAudioEnvironmentReverbParameters

NAVAudioEnvironmentReverbParameters::NAVAudioEnvironmentReverbParameters() {}
NAVAudioEnvironmentReverbParameters::~NAVAudioEnvironmentReverbParameters() {}

JS_INIT_CLASS(AVAudioEnvironmentReverbParameters, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioEnvironmentReverbParameters, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioEnvironmentReverbParameters, NSObject);

NAN_METHOD(NAVAudioEnvironmentReverbParameters::New) {
  JS_RECONSTRUCT(AVAudioEnvironmentReverbParameters);
  @autoreleasepool {
    AVAudioEnvironmentReverbParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioEnvironmentReverbParameters *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioEnvironmentReverbParameters *wrapper = new NAVAudioEnvironmentReverbParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioEnvironmentReverbParameters::New: invalid arguments");
    }
  }
}
