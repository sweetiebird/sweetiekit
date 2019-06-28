//
//  NARImageTrackingConfiguration.mm
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARImageTrackingConfiguration.h"

#define instancetype ARImageTrackingConfiguration
#define js_value_instancetype js_value_ARImageTrackingConfiguration

NARImageTrackingConfiguration::NARImageTrackingConfiguration() {}
NARImageTrackingConfiguration::~NARImageTrackingConfiguration() {}

JS_INIT_CLASS(ARImageTrackingConfiguration, ARConfiguration);
  JS_ASSIGN_PROTO_PROP(isAutoFocusEnabled);
  JS_ASSIGN_PROTO_PROP(trackingImages);
  JS_ASSIGN_PROTO_PROP(maximumNumberOfTrackedImages);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARImageTrackingConfiguration, ARConfiguration);
  // constant values (exports)
JS_INIT_CLASS_END(ARImageTrackingConfiguration, ARConfiguration);

NAN_METHOD(NARImageTrackingConfiguration::New) {
  JS_RECONSTRUCT(ARImageTrackingConfiguration);
  @autoreleasepool {
    ARImageTrackingConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARImageTrackingConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARImageTrackingConfiguration alloc] init];
    }
    if (self) {
      NARImageTrackingConfiguration *wrapper = new NARImageTrackingConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARImageTrackingConfiguration::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARImageTrackingConfiguration::isAutoFocusEnabledGetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoFocusEnabled]));
  }
}

NAN_SETTER(NARImageTrackingConfiguration::isAutoFocusEnabledSetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoFocusEnabled: input];
  }
}

#include "NARReferenceImage.h"

NAN_GETTER(NARImageTrackingConfiguration::trackingImagesGetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <ARReferenceImage*>*/([self trackingImages]));
  }
}

NAN_SETTER(NARImageTrackingConfiguration::trackingImagesSetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSSet/* <ARReferenceImage*>*/, input);
    [self setTrackingImages: input];
  }
}

NAN_GETTER(NARImageTrackingConfiguration::maximumNumberOfTrackedImagesGetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumNumberOfTrackedImages]));
  }
}

NAN_SETTER(NARImageTrackingConfiguration::maximumNumberOfTrackedImagesSetter) {
  JS_UNWRAP(ARImageTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMaximumNumberOfTrackedImages: input];
  }
}
