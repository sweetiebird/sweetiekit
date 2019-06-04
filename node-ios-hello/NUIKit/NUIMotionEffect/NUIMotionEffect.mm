//
//  NUIMotionEffect.mm
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIMotionEffect.h"

NUIMotionEffect::NUIMotionEffect() {}
NUIMotionEffect::~NUIMotionEffect() {}

JS_INIT_CLASS(UIMotionEffect, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIMotionEffect, NSObject);
JS_INIT_CLASS_END(UIMotionEffect, NSObject);

NAN_METHOD(NUIMotionEffect::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'UIMotionEffect(...)', turn into construct call.
      JS_SET_RETURN_NEW(UIMotionEffect, info);
      return;
    }

    UIMotionEffect* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIMotionEffect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIMotionEffect alloc] init];
    }
    if (self) {
      NUIMotionEffect *wrapper = new NUIMotionEffect();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIMotionEffect::New: invalid arguments");
    }
  }
}
