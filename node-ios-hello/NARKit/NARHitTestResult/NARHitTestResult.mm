//
//  NARHitTestResult.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARHitTestResult.h"

#ifdef __IPHONEOS__

NARHitTestResult::NARHitTestResult() {}
NARHitTestResult::~NARHitTestResult() {}

JS_INIT_CLASS(ARHitTestResult, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, type);
  JS_ASSIGN_PROP_READONLY(proto, distance);
  JS_ASSIGN_PROP_READONLY(proto, localTransform);
  JS_ASSIGN_PROP_READONLY(proto, worldTransform);
  JS_ASSIGN_PROP_READONLY(proto, anchor);
  // static members (ctor)
  JS_INIT_CTOR(ARHitTestResult, NSObject);
  // constants (exports)

  /**
   Option set of hit-test result types.
   */
  //API_AVAILABLE(ios(11.0))
  //typedef NS_OPTIONS(NSUInteger, ARHitTestResultType) {
    /** Result type from intersecting the nearest feature point. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeFeaturePoint, NSUInteger); //                                         = (1 << 0),
    
    /** Result type from intersecting a horizontal plane estimate, determined for the current frame. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeEstimatedHorizontalPlane, NSUInteger); //                             = (1 << 1),
    
    /** Result type from intersecting a vertical plane estimate, determined for the current frame. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeEstimatedVerticalPlane, NSUInteger); //  API_AVAILABLE(ios(11.3))     = (1 << 2),
    
    /** Result type from intersecting with an existing plane anchor. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeExistingPlane, NSUInteger); //                                        = (1 << 3),
    
    /** Result type from intersecting with an existing plane anchor, taking into account the plane’s extent. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeExistingPlaneUsingExtent, NSUInteger); //                             = (1 << 4),
    
    /** Result type from intersecting with an existing plane anchor, taking into account the plane’s geometry. */
    JS_ASSIGN_ENUM(ARHitTestResultTypeExistingPlaneUsingGeometry, NSUInteger); //  API_AVAILABLE(ios(11.3)) = (1 << 5),
  //} NS_SWIFT_NAME(ARHitTestResult.ResultType);

JS_INIT_CLASS_END(ARHitTestResult, NSObject);

NAN_METHOD(NARHitTestResult::New) {
  JS_RECONSTRUCT(ARHitTestResult);
  @autoreleasepool {
    ARHitTestResult* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge ARHitTestResult *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARHitTestResult *wrapper = new NARHitTestResult();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARHitTestResult::New: invalid arguments");
    }
  }
}

#include "NARSCNView.h"

NAN_GETTER(NARHitTestResult::typeGetter) {
  JS_UNWRAP(ARHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_ARHitTestResultType([self type]));
    return;
  }
}

NAN_GETTER(NARHitTestResult::distanceGetter) {
  JS_UNWRAP(ARHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self distance]));
    return;
  }
}

NAN_GETTER(NARHitTestResult::localTransformGetter) {
  JS_UNWRAP(ARHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self localTransform]));
    return;
  }
}

NAN_GETTER(NARHitTestResult::worldTransformGetter) {
  JS_UNWRAP(ARHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self worldTransform]));
    return;
  }
}

#include "NARAnchor.h"

NAN_GETTER(NARHitTestResult::anchorGetter) {
  JS_UNWRAP(ARHitTestResult, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_ARAnchor([self anchor]));
    return;
  }
}

#endif
