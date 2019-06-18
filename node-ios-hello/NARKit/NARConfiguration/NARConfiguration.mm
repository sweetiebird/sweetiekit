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
  // instance members (proto)
  JS_ASSIGN_PROP(proto, isLightEstimationEnabled);
  JS_ASSIGN_PROP(proto, worldAlignment);

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

  Local<Object> obj = info.This();

  NARConfiguration *config = new NARConfiguration();

  if (info[0]->IsExternal()) {
    config->SetNSObject((__bridge ARConfiguration *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("Init not available");
  }
  config->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARConfiguration::isLightEstimationEnabledGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);
  
  JS_SET_RETURN(JS_BOOL([config isLightEstimationEnabled]));
}

NAN_SETTER(NARConfiguration::isLightEstimationEnabledSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);

  @autoreleasepool {
    [config setLightEstimationEnabled:TO_BOOL(value)];
  }
}

NAN_GETTER(NARConfiguration::worldAlignmentGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);
  
  ARWorldAlignment align = [config worldAlignment];

  int alignVal = 0;
  if (align == ARWorldAlignmentGravityAndHeading) {
    alignVal = 2;
  } else if (align == ARWorldAlignmentGravity) {
    alignVal = 1;
  }

  JS_SET_RETURN(JS_NUM(alignVal));
}

NAN_SETTER(NARConfiguration::worldAlignmentSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);

  ARWorldAlignment align = ARWorldAlignmentCamera;
  int alignVal = TO_INT32(value);
  if (alignVal == 1) {
    align = ARWorldAlignmentGravity;
  } else if (alignVal == 2) {
    align = ARWorldAlignmentGravityAndHeading;
  }
  
  @autoreleasepool {
    [config setWorldAlignment:align];
  }
}
