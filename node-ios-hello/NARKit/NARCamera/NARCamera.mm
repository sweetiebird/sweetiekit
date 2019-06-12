//
//  NARCamera.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARCamera.h"
#include "NNSObject.h"
#include "NARWorldTrackingConfiguration.h"

NARCamera::NARCamera () {}
NARCamera::~NARCamera () {}

JS_INIT_CLASS(ARCamera, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, transform);
  JS_ASSIGN_PROP_READONLY(proto, eulerAngles);
  JS_ASSIGN_PROP_READONLY(proto, trackingState);
  JS_ASSIGN_PROP_READONLY(proto, trackingStateReason);
  JS_ASSIGN_PROP_READONLY(proto, intrinsics);
  JS_ASSIGN_PROP_READONLY(proto, imageResolution);
  JS_ASSIGN_PROP_READONLY(proto, projectionMatrix);

  // static members (ctor)
  JS_INIT_CTOR(ARCamera, NSObject);
  
JS_INIT_CLASS_END(ARCamera, NSObject);

NAN_METHOD(NARCamera::New) {
  JS_RECONSTRUCT(ARCamera);

  Local<Object> obj = info.This();

  NARCamera *cam = new NARCamera();

  if (info[0]->IsExternal()) {
    cam->SetNSObject((__bridge ARCamera *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("ARCamera must be external");
  }
  cam->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARCamera::transformGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self transform]));
  }
}

NAN_GETTER(NARCamera::eulerAnglesGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3([self eulerAngles]));
  }
}

NAN_GETTER(NARCamera::trackingStateGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_ARTrackingState([self trackingState]));
  }
}

NAN_GETTER(NARCamera::trackingStateReasonGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_ARTrackingStateReason([self trackingStateReason]));
  }
}

NAN_GETTER(NARCamera::intrinsicsGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float3x3([self intrinsics]));
  }
}

NAN_GETTER(NARCamera::imageResolutionGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGSize([self imageResolution]));
  }
}

NAN_GETTER(NARCamera::projectionMatrixGetter) {
  JS_UNWRAP(ARCamera, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_float4x4([self projectionMatrix]));
  }
}
