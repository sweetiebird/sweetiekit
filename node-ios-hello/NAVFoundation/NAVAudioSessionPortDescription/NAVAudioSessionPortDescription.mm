//
//  NAVAudioSessionPortDescription.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioSessionPortDescription.h"

NAVAudioSessionPortDescription::NAVAudioSessionPortDescription() {}
NAVAudioSessionPortDescription::~NAVAudioSessionPortDescription() {}

JS_INIT_CLASS(AVAudioSessionPortDescription, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setPreferredDataSourceError);
  JS_ASSIGN_PROTO_PROP_READONLY(portType);
  JS_ASSIGN_PROTO_PROP_READONLY(portName);
  JS_ASSIGN_PROTO_PROP_READONLY(UID);
  JS_ASSIGN_PROTO_PROP_READONLY(hasHardwareVoiceCallProcessing);
  JS_ASSIGN_PROTO_PROP_READONLY(channels);
  JS_ASSIGN_PROTO_PROP_READONLY(dataSources);
  JS_ASSIGN_PROTO_PROP_READONLY(selectedDataSource);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredDataSource);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioSessionPortDescription, NSObject);
JS_INIT_CLASS_END(AVAudioSessionPortDescription, NSObject);

NAN_METHOD(NAVAudioSessionPortDescription::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioSessionPortDescription(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioSessionPortDescription, info);
      return;
    }

    AVAudioSessionPortDescription* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioSessionPortDescription *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioSessionPortDescription alloc] init];
    }
    if (self) {
      NAVAudioSessionPortDescription *wrapper = new NAVAudioSessionPortDescription();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioSessionPortDescription::New: invalid arguments");
    }
  }
}

#include "NAVAudioSessionDataSourceDescription.h"

NAN_METHOD(NAVAudioSessionPortDescription::setPreferredDataSourceError) {
  JS_UNWRAP(AVAudioSessionPortDescription, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(AVAudioSessionDataSourceDescription, dataSource);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self setPreferredDataSource: dataSource error: &error]));
    js_panic_NSError(error);
  }
}
