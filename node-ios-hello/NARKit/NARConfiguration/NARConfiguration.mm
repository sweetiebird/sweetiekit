//
//  NARConfiguration.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARConfiguration.h"

NARConfiguration::NARConfiguration () {}
NARConfiguration::~NARConfiguration () {}

JS_INIT_CLASS(ARConfiguration, NSObject);
  JS_ASSIGN_STATIC_PROP_READONLY(isSupported);
  JS_ASSIGN_STATIC_PROP_READONLY(supportedVideoFormats);
  JS_ASSIGN_PROTO_PROP(videoFormat);
  JS_ASSIGN_PROTO_PROP(worldAlignment);
  JS_ASSIGN_PROTO_PROP(isLightEstimationEnabled);
  JS_ASSIGN_PROTO_PROP(providesAudioData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARConfiguration, NSObject);
  // constants (exports)

/**
 Enum constants for indicating the world alignment.
 */
//API_AVAILABLE(ios(11.0))
//typedef NS_ENUM(NSInteger, ARWorldAlignment) {
  /** Aligns the world with gravity that is defined by vector (0, -1, 0). */
  JS_ASSIGN_ENUM(ARWorldAlignmentGravity, NSInteger);
  
  /** Aligns the world with gravity that is defined by the vector (0, -1, 0)
   and heading (w.r.t. True North) that is given by the vector (0, 0, -1). */
  JS_ASSIGN_ENUM(ARWorldAlignmentGravityAndHeading, NSInteger);
  
  /** Aligns the world with the camera’s orientation. */
  JS_ASSIGN_ENUM(ARWorldAlignmentCamera, NSInteger);
//} NS_SWIFT_NAME(ARConfiguration.WorldAlignment);


/**
Enum constants for indicating the mode of environment texturing to run.
*/
//API_AVAILABLE(ios(12.0))
//typedef NS_ENUM(NSInteger, AREnvironmentTexturing) {
  /** No texture information is gathered. */
  JS_ASSIGN_ENUM(AREnvironmentTexturingNone, NSInteger);
  
  /** Texture information is gathered for the environment.
   Environment textures will be generated for AREnvironmentProbes added to the session. */
  JS_ASSIGN_ENUM(AREnvironmentTexturingManual, NSInteger);
  
  /** Texture information is gathered for the environment and probes automatically placed in the scene. */
  JS_ASSIGN_ENUM(AREnvironmentTexturingAutomatic, NSInteger);
//} NS_SWIFT_NAME(ARWorldTrackingConfiguration.EnvironmentTexturing);


/**
Option set indicating the type of planes to detect.
*/
//API_AVAILABLE(ios(11.0))
//typedef NS_OPTIONS(NSUInteger, ARPlaneDetection) {
  /** No plane detection is run. */
  JS_ASSIGN_ENUM(ARPlaneDetectionNone, NSUInteger); //                               = 0,
  
  /** Plane detection determines horizontal planes in the scene. */
  JS_ASSIGN_ENUM(ARPlaneDetectionHorizontal, NSUInteger); //                         = (1 << 0),
  
  /** Plane detection determines vertical planes in the scene. */
  JS_ASSIGN_ENUM(ARPlaneDetectionVertical, NSUInteger); //  API_AVAILABLE(ios(11.3)) = (1 << 1)
//} NS_SWIFT_NAME(ARWorldTrackingConfiguration.PlaneDetection);


  
JS_INIT_CLASS_END(ARConfiguration, NSObject);

NAN_METHOD(NARConfiguration::New) {
  JS_RECONSTRUCT(ARConfiguration);
  @autoreleasepool {
    ARConfiguration* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARConfiguration *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARConfiguration *wrapper = new NARConfiguration();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARConfiguration::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARConfiguration::isSupportedGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([ARConfiguration isSupported]));
  }
}

NAN_GETTER(NARConfiguration::supportedVideoFormatsGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<ARVideoFormat*>([ARConfiguration supportedVideoFormats]));
  }
}

#include "NARVideoFormat.h"

NAN_GETTER(NARConfiguration::videoFormatGetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARVideoFormat([self videoFormat]));
  }
}

NAN_SETTER(NARConfiguration::videoFormatSetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(ARVideoFormat, input);
    [self setVideoFormat: input];
  }
}

NAN_GETTER(NARConfiguration::worldAlignmentGetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARWorldAlignment([self worldAlignment]));
  }
}

NAN_SETTER(NARConfiguration::worldAlignmentSetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(ARWorldAlignment, input);
    [self setWorldAlignment: input];
  }
}

NAN_GETTER(NARConfiguration::isLightEstimationEnabledGetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLightEstimationEnabled]));
  }
}

NAN_SETTER(NARConfiguration::isLightEstimationEnabledSetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLightEstimationEnabled: input];
  }
}

NAN_GETTER(NARConfiguration::providesAudioDataGetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self providesAudioData]));
  }
}

NAN_SETTER(NARConfiguration::providesAudioDataSetter) {
  JS_UNWRAP(ARConfiguration, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setProvidesAudioData: input];
  }
}
