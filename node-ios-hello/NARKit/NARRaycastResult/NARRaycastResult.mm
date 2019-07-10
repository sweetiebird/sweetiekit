//
//  NARRaycastResult.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARRaycastResult.h"

#define instancetype ARRaycastResult
#define js_value_instancetype js_value_ARRaycastResult

NARRaycastResult::NARRaycastResult() {}
NARRaycastResult::~NARRaycastResult() {}

JS_INIT_CLASS(ARRaycastResult, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(worldTransform);
  JS_ASSIGN_PROTO_PROP_READONLY(target);
  JS_ASSIGN_PROTO_PROP_READONLY(targetAlignment);
  JS_ASSIGN_PROTO_PROP_READONLY(anchor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(ARRaycastResult, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(ARRaycastResult, NSObject);

NAN_METHOD(NARRaycastResult::New) {
  JS_RECONSTRUCT(ARRaycastResult);
  @autoreleasepool {
    ARRaycastResult* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge ARRaycastResult *)(info[0].As<External>()->Value());
    }
    if (self) {
      NARRaycastResult *wrapper = new NARRaycastResult();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("ARRaycastResult::New: invalid arguments");
    }
  }
}

NAN_GETTER(NARRaycastResult::worldTransformGetter) {
  JS_UNWRAP(ARRaycastResult, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self worldTransform]));
  }
}

#include "NARRaycastQuery.h"

NAN_GETTER(NARRaycastResult::targetGetter) {
  JS_UNWRAP(ARRaycastResult, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARRaycastTarget([self target]));
  }
}

NAN_GETTER(NARRaycastResult::targetAlignmentGetter) {
  JS_UNWRAP(ARRaycastResult, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARRaycastTargetAlignment([self targetAlignment]));
  }
}

#include "NARAnchor.h"

NAN_GETTER(NARRaycastResult::anchorGetter) {
  JS_UNWRAP(ARRaycastResult, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_ARAnchor([self anchor]));
  }
}
