//
//  NAVAudioMixingDestination.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioMixingDestination.h"

#define instancetype AVAudioMixingDestination
#define js_value_instancetype js_value_AVAudioMixingDestination

NAVAudioMixingDestination::NAVAudioMixingDestination() {}
NAVAudioMixingDestination::~NAVAudioMixingDestination() {}

JS_INIT_CLASS(AVAudioMixingDestination, AVAudioMixing);
  JS_ASSIGN_PROTO_PROP_READONLY(connectionPoint);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioMixingDestination, AVAudioMixing);
  // constant values (exports)
JS_INIT_CLASS_END(AVAudioMixingDestination, AVAudioMixing);

NAN_METHOD(NAVAudioMixingDestination::New) {
  JS_RECONSTRUCT(AVAudioMixingDestination);
  @autoreleasepool {
    AVAudioMixingDestination* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioMixingDestination *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVAudioMixingDestination *wrapper = new NAVAudioMixingDestination();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioMixingDestination::New: invalid arguments");
    }
  }
}

#include "NAVAudioConnectionPoint.h"

NAN_GETTER(NAVAudioMixingDestination::connectionPointGetter) {
  JS_UNWRAP(AVAudioMixingDestination, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioConnectionPoint([self connectionPoint]));
  }
}
