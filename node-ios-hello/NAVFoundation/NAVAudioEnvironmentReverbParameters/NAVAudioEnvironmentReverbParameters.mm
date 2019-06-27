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
  JS_ASSIGN_PROTO_METHOD(loadFactoryReverbPreset);
  JS_ASSIGN_PROTO_PROP(enable);
  JS_ASSIGN_PROTO_PROP(level);
  JS_ASSIGN_PROTO_PROP_READONLY(filterParameters);

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

#include "NAVAudioUnitReverb.h"

NAN_METHOD(NAVAudioEnvironmentReverbParameters::loadFactoryReverbPreset) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioUnitReverbPreset, preset);
    [self loadFactoryReverbPreset: preset];
  }
}

NAN_GETTER(NAVAudioEnvironmentReverbParameters::enableGetter) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enable]));
  }
}

NAN_SETTER(NAVAudioEnvironmentReverbParameters::enableSetter) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnable: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentReverbParameters::levelGetter) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self level]));
  }
}

NAN_SETTER(NAVAudioEnvironmentReverbParameters::levelSetter) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setLevel: input];
  }
}

#include "NAVAudioUnitEQFilterParameters.h"

NAN_GETTER(NAVAudioEnvironmentReverbParameters::filterParametersGetter) {
  JS_UNWRAP(AVAudioEnvironmentReverbParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioUnitEQFilterParameters([self filterParameters]));
  }
}
