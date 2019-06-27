//
//  NAVAudioUnitEffect.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioUnitEffect.h"

#define instancetype AVAudioUnitEffect
#define js_value_instancetype js_value_AVAudioUnitEffect

NAVAudioUnitEffect::NAVAudioUnitEffect() {}
NAVAudioUnitEffect::~NAVAudioUnitEffect() {}

JS_INIT_CLASS(AVAudioUnitEffect, AVAudioUnit);
  JS_ASSIGN_PROTO_METHOD(initWithAudioComponentDescription);
  JS_ASSIGN_PROTO_PROP(bypass);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioUnitEffect, AVAudioUnit);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioUnitEffect, AVAudioUnit);

NAN_METHOD(NAVAudioUnitEffect::New) {
  JS_RECONSTRUCT(AVAudioUnitEffect);
  @autoreleasepool {
    AVAudioUnitEffect* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioUnitEffect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioUnitEffect alloc] init];
    }
    if (self) {
      NAVAudioUnitEffect *wrapper = new NAVAudioUnitEffect();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioUnitEffect::New: invalid arguments");
    }
  }
}

#include "NCoreAudioTypes.h"

NAN_METHOD(NAVAudioUnitEffect::initWithAudioComponentDescription) {
  JS_UNWRAP_OR_ALLOC(AVAudioUnitEffect, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioComponentDescription, audioComponentDescription);
    JS_SET_RETURN(js_value_instancetype([self initWithAudioComponentDescription: audioComponentDescription]));
  }
}

NAN_GETTER(NAVAudioUnitEffect::bypassGetter) {
  JS_UNWRAP(AVAudioUnitEffect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self bypass]));
  }
}

NAN_SETTER(NAVAudioUnitEffect::bypassSetter) {
  JS_UNWRAP(AVAudioUnitEffect, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBypass: input];
  }
}
