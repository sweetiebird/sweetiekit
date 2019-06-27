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
  JS_ASSIGN_PROTO_PROP(distanceAttenuationModel);
  JS_ASSIGN_PROTO_PROP(referenceDistance);
  JS_ASSIGN_PROTO_PROP(maximumDistance);
  JS_ASSIGN_PROTO_PROP(rolloffFactor);

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

#include "NAVAudioEnvironmentNode.h"

NAN_GETTER(NAVAudioEnvironmentDistanceAttenuationParameters::distanceAttenuationModelGetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEnvironmentDistanceAttenuationModel([self distanceAttenuationModel]));
  }
}

NAN_SETTER(NAVAudioEnvironmentDistanceAttenuationParameters::distanceAttenuationModelSetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudioEnvironmentDistanceAttenuationModel, input);
    [self setDistanceAttenuationModel: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentDistanceAttenuationParameters::referenceDistanceGetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self referenceDistance]));
  }
}

NAN_SETTER(NAVAudioEnvironmentDistanceAttenuationParameters::referenceDistanceSetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setReferenceDistance: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentDistanceAttenuationParameters::maximumDistanceGetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self maximumDistance]));
  }
}

NAN_SETTER(NAVAudioEnvironmentDistanceAttenuationParameters::maximumDistanceSetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMaximumDistance: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentDistanceAttenuationParameters::rolloffFactorGetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self rolloffFactor]));
  }
}

NAN_SETTER(NAVAudioEnvironmentDistanceAttenuationParameters::rolloffFactorSetter) {
  JS_UNWRAP(AVAudioEnvironmentDistanceAttenuationParameters, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRolloffFactor: input];
  }
}

