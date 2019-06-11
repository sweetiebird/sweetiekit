//
//  NAUAudioUnitPreset.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAUAudioUnitPreset.h"

NAUAudioUnitPreset::NAUAudioUnitPreset() {}
NAUAudioUnitPreset::~NAUAudioUnitPreset() {}

JS_INIT_CLASS(AUAudioUnitPreset, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AUAudioUnitPreset, NSObject);
JS_INIT_CLASS_END(AUAudioUnitPreset, NSObject);

NAN_METHOD(NAUAudioUnitPreset::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AUAudioUnitPreset(...)', turn into construct call.
      JS_SET_RETURN_NEW(AUAudioUnitPreset, info);
      return;
    }

    AUAudioUnitPreset* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AUAudioUnitPreset *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AUAudioUnitPreset alloc] init];
    }
    if (self) {
      NAUAudioUnitPreset *wrapper = new NAUAudioUnitPreset();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AUAudioUnitPreset::New: invalid arguments");
    }
  }
}
