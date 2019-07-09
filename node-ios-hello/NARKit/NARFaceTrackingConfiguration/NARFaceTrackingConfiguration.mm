//
//  NARFaceTrackingConfiguration.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARFaceTrackingConfiguration.h"

#ifdef __IPHONEOS__

#define instancetype ARFaceTrackingConfiguration
#define Ninstancetype NARFaceTrackingConfiguration
#define js_value_instancetype js_value_ARFaceTrackingConfiguration

NAN_GETTER(Ninstancetype::isSupportedGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([instancetype isSupported]));
  }
}

NAN_GETTER(Ninstancetype::supportedVideoFormatsGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<ARVideoFormat*>([instancetype supportedVideoFormats]));
  }
}

NARFaceTrackingConfiguration::NARFaceTrackingConfiguration() {}
NARFaceTrackingConfiguration::~NARFaceTrackingConfiguration() {}

JS_INIT_CLASS(ARFaceTrackingConfiguration, ARConfiguration);
  JS_ASSIGN_STATIC_PROP_READONLY(isSupported);
  JS_ASSIGN_STATIC_PROP_READONLY(supportedVideoFormats);
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

#endif
