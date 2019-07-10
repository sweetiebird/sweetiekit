//
//  NARRaycastQuery.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARRaycastQuery.h"

#define instancetype ARRaycastQuery
#define js_value_instancetype js_value_ARRaycastQuery

NARRaycastQuery::NARRaycastQuery() {}
NARRaycastQuery::~NARRaycastQuery() {}

JS_INIT_CLASS(ARRaycastQuery, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithOriginDirectionAllowingTargetAlignment);
  JS_ASSIGN_PROTO_PROP_READONLY(origin);
  JS_ASSIGN_PROTO_PROP_READONLY(direction);
  JS_ASSIGN_PROTO_PROP_READONLY(target);
  JS_ASSIGN_PROTO_PROP_READONLY(targetAlignment);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARRaycastQuery, NSObject);
  // constant values (exports)

  /**
   A value describing the target of a ray used for raycasting.
   */
  //API_AVAILABLE(ios(13.0))
  //typedef NS_ENUM(NSInteger, ARRaycastTarget) {
    
    /** Ray's target is an already detected plane, considering the plane's estimated size and shape. */
    JS_ASSIGN_ENUM(ARRaycastTargetExistingPlaneGeometry, NSInteger);
    
    /** Ray's target is an already detected plane, without considering the plane's size. */
    JS_ASSIGN_ENUM(ARRaycastTargetExistingPlaneInfinite, NSInteger);
    
    /**
     Ray's target is a plane that is estimated using the feature points around the ray.
     When alignment is ARRaycastTargetAlignmentAny, alignment of estimated planes is based on the normal of the real world
     surface corresponding to the estimated plane.
     */
    JS_ASSIGN_ENUM(ARRaycastTargetEstimatedPlane, NSInteger);

  //} NS_SWIFT_NAME(ARRaycastQuery.Target);

  /**
   A value describing the alignment of a target.
   */
  //API_AVAILABLE(ios(13.0))
  //typedef NS_ENUM(NSInteger, ARRaycastTargetAlignment) {
    /** A target that is horizontal with respect to gravity. */
    JS_ASSIGN_ENUM(ARRaycastTargetAlignmentHorizontal, NSInteger);
    
    /** A target that is vertical with respect to gravity. */
    JS_ASSIGN_ENUM(ARRaycastTargetAlignmentVertical, NSInteger);
    
    /** A target that is in any alignment, inclusive of horizontal and vertical. */
    JS_ASSIGN_ENUM(ARRaycastTargetAlignmentAny, NSInteger);
    
  //} NS_SWIFT_NAME(ARRaycastQuery.TargetAlignment);

JS_INIT_CLASS_END(ARRaycastQuery, NSObject);

NAN_METHOD(NARRaycastQuery::New) {
  JS_RECONSTRUCT(ARRaycastQuery);
  @autoreleasepool {
    ARRaycastQuery* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARRaycastQuery *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARRaycastQuery *wrapper = new NARRaycastQuery();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARRaycastQuery::New: invalid arguments");
    }
  }
}

NAN_METHOD(NARRaycastQuery::initWithOriginDirectionAllowingTargetAlignment) {
  JS_UNWRAP_OR_ALLOC(ARRaycastQuery, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(simd_float3, origin);
    declare_value(simd_float3, direction);
    declare_value(ARRaycastTarget, target);
    declare_value(ARRaycastTargetAlignment, alignment);
    JS_SET_RETURN(js_value_instancetype([self initWithOrigin: origin direction: direction allowingTarget: target alignment: alignment]));
  }
}

NAN_GETTER(NARRaycastQuery::originGetter) {
  JS_UNWRAP(ARRaycastQuery, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self origin]));
  }
}

NAN_GETTER(NARRaycastQuery::directionGetter) {
  JS_UNWRAP(ARRaycastQuery, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float3([self direction]));
  }
}

NAN_GETTER(NARRaycastQuery::targetGetter) {
  JS_UNWRAP(ARRaycastQuery, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARRaycastTarget([self target]));
  }
}

NAN_GETTER(NARRaycastQuery::targetAlignmentGetter) {
  JS_UNWRAP(ARRaycastQuery, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARRaycastTargetAlignment([self targetAlignment]));
  }
}
