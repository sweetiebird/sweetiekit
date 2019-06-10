//
//  NAVAudioSessionRouteDescription.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioSessionRouteDescription.h"

NAVAudioSessionRouteDescription::NAVAudioSessionRouteDescription() {}
NAVAudioSessionRouteDescription::~NAVAudioSessionRouteDescription() {}

JS_INIT_CLASS(AVAudioSessionRouteDescription, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(inputs);
  JS_ASSIGN_PROTO_PROP_READONLY(outputs);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioSessionRouteDescription, NSObject);
JS_INIT_CLASS_END(AVAudioSessionRouteDescription, NSObject);

NAN_METHOD(NAVAudioSessionRouteDescription::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioSessionRouteDescription(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioSessionRouteDescription, info);
      return;
    }

    AVAudioSessionRouteDescription* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioSessionRouteDescription *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioSessionRouteDescription alloc] init];
    }
    if (self) {
      NAVAudioSessionRouteDescription *wrapper = new NAVAudioSessionRouteDescription();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioSessionRouteDescription::New: invalid arguments");
    }
  }
}
