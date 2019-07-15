//
//  NAROrientationTrackingConfiguration.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAROrientationTrackingConfiguration.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define instancetype AROrientationTrackingConfiguration
#define Ninstancetype NAROrientationTrackingConfiguration
#define js_value_instancetype js_value_AROrientationTrackingConfiguration

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

NAROrientationTrackingConfiguration::NAROrientationTrackingConfiguration() {}
NAROrientationTrackingConfiguration::~NAROrientationTrackingConfiguration() {}

JS_INIT_CLASS(AROrientationTrackingConfiguration, ARConfiguration);
  JS_ASSIGN_STATIC_PROP_READONLY(isSupported);
  JS_ASSIGN_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_ASSIGN_PROTO_PROP(isAutoFocusEnabled);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AROrientationTrackingConfiguration, ARConfiguration);
  // constant values (exports)
JS_INIT_CLASS_END(AROrientationTrackingConfiguration, ARConfiguration);

NAN_METHOD(NAROrientationTrackingConfiguration::New) {
  JS_RECONSTRUCT(AROrientationTrackingConfiguration);
  @autoreleasepool {
    AROrientationTrackingConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AROrientationTrackingConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AROrientationTrackingConfiguration alloc] init];
    }
    if (self) {
      NAROrientationTrackingConfiguration *wrapper = new NAROrientationTrackingConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AROrientationTrackingConfiguration::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAROrientationTrackingConfiguration::isAutoFocusEnabledGetter) {
  JS_UNWRAP(AROrientationTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoFocusEnabled]));
  }
}

NAN_SETTER(NAROrientationTrackingConfiguration::isAutoFocusEnabledSetter) {
  JS_UNWRAP(AROrientationTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoFocusEnabled: input];
  }
}

#endif

