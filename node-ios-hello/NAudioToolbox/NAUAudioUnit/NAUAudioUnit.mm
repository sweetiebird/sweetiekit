//
//  NAUAudioUnit.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUAudioUnit.h"

NAUAudioUnit::NAUAudioUnit() {}
NAUAudioUnit::~NAUAudioUnit() {}

JS_INIT_CLASS(AUAudioUnit, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AUAudioUnit, NSObject);
JS_INIT_CLASS_END(AUAudioUnit, NSObject);

NAN_METHOD(NAUAudioUnit::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUAudioUnit(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUAudioUnit, info);
      return;
    }

    AUAudioUnit* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUAudioUnit *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAUAudioUnit *wrapper = new NAUAudioUnit();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUAudioUnit::New: invalid arguments");
    }
  }
}
