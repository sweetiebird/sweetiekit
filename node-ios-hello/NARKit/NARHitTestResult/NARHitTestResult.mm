//
//  NARHitTestResult.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARHitTestResult.h"

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
JS_INIT_CLASS_END(ARHitTestResult, NSObject);

NAN_METHOD(NARHitTestResult::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'ARHitTestResult(...)', turn into construct call.
      JS_SET_RETURN_NEW(ARHitTestResult, info);
      return;
    }

    ARHitTestResult* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge ARHitTestResult *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [ARHitTestResult alloc];
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
