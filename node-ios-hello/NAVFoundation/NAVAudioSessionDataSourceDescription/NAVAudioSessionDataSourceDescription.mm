//
//  NAVAudioSessionDataSourceDescription.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioSessionDataSourceDescription.h"

NAVAudioSessionDataSourceDescription::NAVAudioSessionDataSourceDescription() {}
NAVAudioSessionDataSourceDescription::~NAVAudioSessionDataSourceDescription() {}

JS_INIT_CLASS(AVAudioSessionDataSourceDescription, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setPreferredPolarPatternError);
  JS_ASSIGN_PROTO_PROP_READONLY(dataSourceID);
  JS_ASSIGN_PROTO_PROP_READONLY(dataSourceName);
  JS_ASSIGN_PROTO_PROP_READONLY(location);
  JS_ASSIGN_PROTO_PROP_READONLY(orientation);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedPolarPatterns);
  JS_ASSIGN_PROTO_PROP_READONLY(selectedPolarPattern);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredPolarPattern);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioSessionDataSourceDescription, NSObject);
JS_INIT_CLASS_END(AVAudioSessionDataSourceDescription, NSObject);

NAN_METHOD(NAVAudioSessionDataSourceDescription::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioSessionDataSourceDescription(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioSessionDataSourceDescription, info);
      return;
    }

    AVAudioSessionDataSourceDescription* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioSessionDataSourceDescription *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioSessionDataSourceDescription alloc] init];
    }
    if (self) {
      NAVAudioSessionDataSourceDescription *wrapper = new NAVAudioSessionDataSourceDescription();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioSessionDataSourceDescription::New: invalid arguments");
    }
  }
}

#include "NAVAudioSession.h"

NAN_METHOD(NAVAudioSessionDataSourceDescription::setPreferredPolarPatternError) {
  JS_UNWRAP(AVAudioSessionDataSourceDescription, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(AVAudioSessionPolarPattern, pattern);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredPolarPattern: pattern error: &error]));
    js_panic_NSError(error);
  }
}
