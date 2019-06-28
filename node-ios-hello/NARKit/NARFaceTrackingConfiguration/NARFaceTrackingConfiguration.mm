//
//  NARFaceTrackingConfiguration.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARFaceTrackingConfiguration.h"

#define instancetype ARFaceTrackingConfiguration
#define js_value_instancetype js_value_ARFaceTrackingConfiguration

NARFaceTrackingConfiguration::NARFaceTrackingConfiguration() {}
NARFaceTrackingConfiguration::~NARFaceTrackingConfiguration() {}

JS_INIT_CLASS(ARFaceTrackingConfiguration, ARConfiguration);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARFaceTrackingConfiguration, ARConfiguration);
  // constant values (exports)
JS_INIT_CLASS_END(ARFaceTrackingConfiguration, ARConfiguration);

NAN_METHOD(NARFaceTrackingConfiguration::New) {
  JS_RECONSTRUCT(ARFaceTrackingConfiguration);
  @autoreleasepool {
    ARFaceTrackingConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARFaceTrackingConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARFaceTrackingConfiguration alloc] init];
    }
    if (self) {
      NARFaceTrackingConfiguration *wrapper = new NARFaceTrackingConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARFaceTrackingConfiguration::New: invalid arguments");
    }
  }
}
