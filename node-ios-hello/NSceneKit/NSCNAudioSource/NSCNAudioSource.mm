//
//  NSCNAudioSource.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNAudioSource.h"

#define instancetype SCNAudioSource
#define js_value_instancetype js_value_SCNAudioSource

NSCNAudioSource::NSCNAudioSource() {}
NSCNAudioSource::~NSCNAudioSource() {}

JS_INIT_CLASS(SCNAudioSource, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNAudioSource, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNAudioSource, NSObject);

NAN_METHOD(NSCNAudioSource::New) {
  JS_RECONSTRUCT(SCNAudioSource);
  @autoreleasepool {
    SCNAudioSource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNAudioSource *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNAudioSource alloc] init];
    }
    if (self) {
      NSCNAudioSource *wrapper = new NSCNAudioSource();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNAudioSource::New: invalid arguments");
    }
  }
}
