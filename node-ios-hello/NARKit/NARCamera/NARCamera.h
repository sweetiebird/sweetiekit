
//
//  NARCamera.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARCamera_h
#define NARCamera_h

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#define js_value_ARCamera(x) js_value_wrapper(x, ARCamera)
#define to_value_ARCamera(x) to_value_wrapper(x, ARCamera)
#define is_value_ARCamera(x) is_value_wrapper(x, ARCamera)

// ARKit enums

#define js_value_ARTrackingState(x) JS_ENUM(ARTrackingState, NSInteger, x)
#define to_value_ARTrackingState(x) TO_ENUM(ARTrackingState, NSInteger, x)
#define is_value_ARTrackingState(x) IS_ENUM(ARTrackingState, NSInteger, x)

#define js_value_ARTrackingStateReason(x) JS_ENUM(ARTrackingStateReason, NSInteger, x)
#define to_value_ARTrackingStateReason(x) TO_ENUM(ARTrackingStateReason, NSInteger, x)
#define is_value_ARTrackingStateReason(x) IS_ENUM(ARTrackingStateReason, NSInteger, x)

JS_WRAP_CLASS(ARCamera, NSObject);
  JS_METHOD(projectionMatrixForOrientationViewportSizeZNearZFar);
  JS_METHOD(projectPointOrientationViewportSize);
  JS_METHOD(unprojectPointOntoPlaneWithTransformOrientationViewportSize);
  JS_METHOD(viewMatrixForOrientation);
  JS_PROP_READONLY(transform);
  JS_PROP_READONLY(eulerAngles);
  JS_PROP_READONLY(trackingState);
  JS_PROP_READONLY(trackingStateReason);
  JS_PROP_READONLY(intrinsics);
  JS_PROP_READONLY(imageResolution);
  JS_PROP_READONLY(projectionMatrix);
JS_WRAP_CLASS_END(ARCamera);

#endif

#endif /* NARCamera_h */
