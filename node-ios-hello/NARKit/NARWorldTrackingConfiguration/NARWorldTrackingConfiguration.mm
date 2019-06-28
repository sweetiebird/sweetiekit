//
//  NARWorldTrackingConfiguration.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARWorldTrackingConfiguration.h"

NARWorldTrackingConfiguration::NARWorldTrackingConfiguration () {}
NARWorldTrackingConfiguration::~NARWorldTrackingConfiguration () {}

JS_INIT_CLASS(ARWorldTrackingConfiguration, ARConfiguration);
  JS_ASSIGN_PROTO_PROP(isAutoFocusEnabled);
  JS_ASSIGN_PROTO_PROP(environmentTexturing);
  JS_ASSIGN_PROTO_PROP(planeDetection);
  JS_ASSIGN_PROTO_PROP(initialWorldMap);
  JS_ASSIGN_PROTO_PROP(detectionImages);
  JS_ASSIGN_PROTO_PROP(maximumNumberOfTrackedImages);
  JS_ASSIGN_PROTO_PROP(detectionObjects);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARWorldTrackingConfiguration, ARConfiguration);

JS_INIT_CLASS_END(ARWorldTrackingConfiguration, ARConfiguration);

NAN_METHOD(NARWorldTrackingConfiguration::New) {
  JS_RECONSTRUCT(ARWorldTrackingConfiguration);
  @autoreleasepool {
    ARWorldTrackingConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARWorldTrackingConfiguration *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[ARWorldTrackingConfiguration alloc] init];
    }
    if (self) {
      NARWorldTrackingConfiguration *wrapper = new NARWorldTrackingConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARWorldTrackingConfiguration::New: invalid arguments");
    }
  }
}


NAN_GETTER(NARWorldTrackingConfiguration::isAutoFocusEnabledGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAutoFocusEnabled]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::isAutoFocusEnabledSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutoFocusEnabled: input];
  }
}

NAN_GETTER(NARWorldTrackingConfiguration::environmentTexturingGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AREnvironmentTexturing([self environmentTexturing]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::environmentTexturingSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AREnvironmentTexturing, input);
    [self setEnvironmentTexturing: input];
  }
}

NAN_GETTER(NARWorldTrackingConfiguration::planeDetectionGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARPlaneDetection([self planeDetection]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::planeDetectionSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(ARPlaneDetection, input);
    [self setPlaneDetection: input];
  }
}

#include "NARWorldMap.h"

NAN_GETTER(NARWorldTrackingConfiguration::initialWorldMapGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARWorldMap([self initialWorldMap]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::initialWorldMapSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(ARWorldMap, input);
    [self setInitialWorldMap: input];
  }
}

#include "NARReferenceImage.h"

NAN_GETTER(NARWorldTrackingConfiguration::detectionImagesGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <ARReferenceImage*>*/([self detectionImages]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::detectionImagesSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSSet/* <ARReferenceImage*>*/, input);
    [self setDetectionImages: input];
  }
}

NAN_GETTER(NARWorldTrackingConfiguration::maximumNumberOfTrackedImagesGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self maximumNumberOfTrackedImages]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::maximumNumberOfTrackedImagesSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMaximumNumberOfTrackedImages: input];
  }
}

#include "NARReferenceObject.h"

NAN_GETTER(NARWorldTrackingConfiguration::detectionObjectsGetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <ARReferenceObject*>*/([self detectionObjects]));
  }
}

NAN_SETTER(NARWorldTrackingConfiguration::detectionObjectsSetter) {
  JS_UNWRAP(ARWorldTrackingConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSSet/* <ARReferenceObject*>*/, input);
    [self setDetectionObjects: input];
  }
}
