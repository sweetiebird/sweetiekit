//
//  NUIVisualEffect.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIVisualEffect.h"

#define instancetype UIVisualEffect
#define js_value_instancetype js_value_UIVisualEffect

NUIVisualEffect::NUIVisualEffect() {}
NUIVisualEffect::~NUIVisualEffect() {}

JS_INIT_CLASS(UIVisualEffect, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIVisualEffect, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UIVisualEffect, NSObject);

NAN_METHOD(NUIVisualEffect::New) {
  JS_RECONSTRUCT(UIVisualEffect);
  @autoreleasepool {
    UIVisualEffect* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIVisualEffect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIVisualEffect alloc] init];
    }
    if (self) {
      NUIVisualEffect *wrapper = new NUIVisualEffect();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIVisualEffect::New: invalid arguments");
    }
  }
}
