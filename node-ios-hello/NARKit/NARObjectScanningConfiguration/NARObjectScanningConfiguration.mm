//
//  NARObjectScanningConfiguration.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARObjectScanningConfiguration.h"

#if TARGET_OS_IPHONE

#define instancetype ARObjectScanningConfiguration
#define Ninstancetype NARObjectScanningConfiguration
#define js_value_instancetype js_value_ARObjectScanningConfiguration

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

NARObjectScanningConfiguration::NARObjectScanningConfiguration() {}
NARObjectScanningConfiguration::~NARObjectScanningConfiguration() {}

JS_INIT_CLASS(ARObjectScanningConfiguration, ARConfiguration);
  JS_ASSIGN_STATIC_PROP_READONLY(isSupported);
  JS_ASSIGN_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_ASSIGN_PROTO_PROP(isAutoFocusEnabled);
  JS_ASSIGN_PROTO_PROP(planeDetection);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARObjectScanningConfiguration, ARConfiguration);
  // constant values (exports)
JS_INIT_CLASS_END(ARObjectScanningConfiguration, ARConfiguration);

NAN_METHOD(NARObjectScanningConfiguration::New) {
  JS_RECONSTRUCT(ARObjectScanningConfiguration);
  @autoreleasepool {
    ARObjectScanningConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARObjectScanningConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARObjectScanningConfiguration alloc] init];
    }
    if (self) {
      NARObjectScanningConfiguration *wrapper = new NARObjectScanningConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARObjectScanningConfiguration::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARObjectScanningConfiguration::isAutoFocusEnabledGetter) {
  JS_UNWRAP(ARObjectScanningConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoFocusEnabled]));
  }
}

NAN_SETTER(NARObjectScanningConfiguration::isAutoFocusEnabledSetter) {
  JS_UNWRAP(ARObjectScanningConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoFocusEnabled: input];
  }
}

NAN_GETTER(NARObjectScanningConfiguration::planeDetectionGetter) {
  JS_UNWRAP(ARObjectScanningConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARPlaneDetection([self planeDetection]));
  }
}

NAN_SETTER(NARObjectScanningConfiguration::planeDetectionSetter) {
  JS_UNWRAP(ARObjectScanningConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(ARPlaneDetection, input);
    [self setPlaneDetection: input];
  }
}

#endif
