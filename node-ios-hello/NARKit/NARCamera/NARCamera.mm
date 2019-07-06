
//
//  NARCamera.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARCamera.h"
#include "NNSObject.h"
#include "NARWorldTrackingConfiguration.h"

#define instancetype ARCamera
#define js_value_instancetype js_value_ARCamera

NARCamera::NARCamera () {}
NARCamera::~NARCamera () {}

JS_INIT_CLASS(ARCamera, NSObject);
  JS_ASSIGN_PROTO_METHOD(projectionMatrixForOrientationViewportSizeZNearZFar);
  JS_ASSIGN_PROTO_METHOD(projectPointOrientationViewportSize);
  JS_ASSIGN_PROTO_METHOD(unprojectPointOntoPlaneWithTransformOrientationViewportSize);
  JS_ASSIGN_PROTO_METHOD(viewMatrixForOrientation);
  JS_ASSIGN_PROTO_PROP_READONLY(transform);
  JS_ASSIGN_PROTO_PROP_READONLY(eulerAngles);
  JS_ASSIGN_PROTO_PROP_READONLY(trackingState);
  JS_ASSIGN_PROTO_PROP_READONLY(trackingStateReason);
  JS_ASSIGN_PROTO_PROP_READONLY(intrinsics);
  JS_ASSIGN_PROTO_PROP_READONLY(imageResolution);
  JS_ASSIGN_PROTO_PROP_READONLY(projectionMatrix);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARCamera, NSObject);
  // constants (exports)

  /**
   A value describing the camera’s tracking state.
   */
  //API_AVAILABLE(ios(11.0))
  //typedef NS_ENUM(NSInteger, ARTrackingState) {
    /** Tracking is not available. */
    JS_ASSIGN_ENUM(ARTrackingStateNotAvailable, NSInteger); // ,

    /** Tracking is limited. See tracking reason for details. */
    JS_ASSIGN_ENUM(ARTrackingStateLimited, NSInteger); // ,

    /** Tracking is Normal. */
    JS_ASSIGN_ENUM(ARTrackingStateNormal, NSInteger); // ,
  //} NS_REFINED_FOR_SWIFT;

  /**
   A reason describing why the camera’s tracking state is limited.
   */
  //API_AVAILABLE(ios(11.0))
  //typedef NS_ENUM(NSInteger, ARTrackingStateReason) {
    /** Tracking is not limited. */
    JS_ASSIGN_ENUM(ARTrackingStateReasonNone, NSInteger); // ,

    /** Tracking is limited due to initialization in progress. */
    JS_ASSIGN_ENUM(ARTrackingStateReasonInitializing, NSInteger); // ,

    /** Tracking is limited due to a excessive motion of the camera. */
    JS_ASSIGN_ENUM(ARTrackingStateReasonExcessiveMotion, NSInteger); // ,

    /** Tracking is limited due to a lack of features visible to the camera. */
    JS_ASSIGN_ENUM(ARTrackingStateReasonInsufficientFeatures, NSInteger); // ,

    /** Tracking is limited due to a relocalization in progress. */
    JS_ASSIGN_ENUM(ARTrackingStateReasonRelocalizing, NSInteger); //  API_AVAILABLE(ios(11.3)),
  //} NS_REFINED_FOR_SWIFT;

JS_INIT_CLASS_END(ARCamera, NSObject);

NAN_METHOD(NARCamera::New) {
  JS_RECONSTRUCT(ARCamera);
  @autoreleasepool {
    ARCamera* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARCamera *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARCamera *wrapper = new NARCamera();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARCamera::New: invalid arguments");
    }
  }
}

#include "NUIApplication.h"

NAN_METHOD(NARCamera::projectionMatrixForOrientationViewportSizeZNearZFar) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, orientation);
    declare_value(CGSize, viewportSize);
    declare_value(CGFloat, zNear);
    declare_value(CGFloat, zFar);
    JS_SET_RETURN(js_value_simd_float4x4([self projectionMatrixForOrientation: orientation viewportSize: viewportSize zNear: zNear zFar: zFar]));
  }
}

NAN_METHOD(NARCamera::projectPointOrientationViewportSize) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, point);
    declare_value(UIInterfaceOrientation, orientation);
    declare_value(CGSize, viewportSize);
    JS_SET_RETURN(js_value_CGPoint([self projectPoint: point orientation: orientation viewportSize: viewportSize]));
  }
}

NAN_METHOD(NARCamera::unprojectPointOntoPlaneWithTransformOrientationViewportSize) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point);
    declare_value(simd_float4x4, planeTransform);
    declare_value(UIInterfaceOrientation, orientation);
    declare_value(CGSize, viewportSize);
    JS_SET_RETURN(js_value_simd_float3([self unprojectPoint: point ontoPlaneWithTransform: planeTransform orientation: orientation viewportSize: viewportSize]));
  }
}

NAN_METHOD(NARCamera::viewMatrixForOrientation) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, orientation);
    JS_SET_RETURN(js_value_simd_float4x4([self viewMatrixForOrientation: orientation]));
  }
}

NAN_GETTER(NARCamera::transformGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self transform]));
  }
}

NAN_GETTER(NARCamera::eulerAnglesGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self eulerAngles]));
  }
}

NAN_GETTER(NARCamera::trackingStateGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARTrackingState([self trackingState]));
  }
}

NAN_GETTER(NARCamera::trackingStateReasonGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARTrackingStateReason([self trackingStateReason]));
  }
}

NAN_GETTER(NARCamera::intrinsicsGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3x3([self intrinsics]));
  }
}

NAN_GETTER(NARCamera::imageResolutionGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self imageResolution]));
  }
}

NAN_GETTER(NARCamera::projectionMatrixGetter) {
  JS_UNWRAP(ARCamera, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self projectionMatrix]));
  }
}
