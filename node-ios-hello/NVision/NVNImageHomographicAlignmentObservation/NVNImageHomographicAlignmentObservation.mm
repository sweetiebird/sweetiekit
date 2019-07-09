//
//  NVNImageHomographicAlignmentObservation.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNImageHomographicAlignmentObservation.h"

#import <Vision/VNObservation.h>

#define instancetype VNImageHomographicAlignmentObservation
#define js_value_instancetype js_value_VNImageHomographicAlignmentObservation

NVNImageHomographicAlignmentObservation::NVNImageHomographicAlignmentObservation() {}
NVNImageHomographicAlignmentObservation::~NVNImageHomographicAlignmentObservation() {}

JS_INIT_CLASS(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);
  JS_ASSIGN_PROTO_PROP(warpTransform);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);
  // constant values (exports)
JS_INIT_CLASS_END(VNImageHomographicAlignmentObservation, VNImageAlignmentObservation);

NAN_METHOD(NVNImageHomographicAlignmentObservation::New) {
  JS_RECONSTRUCT(VNImageHomographicAlignmentObservation);
  @autoreleasepool {
    VNImageHomographicAlignmentObservation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNImageHomographicAlignmentObservation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNImageHomographicAlignmentObservation alloc] init];
    }
    if (self) {
      NVNImageHomographicAlignmentObservation *wrapper = new NVNImageHomographicAlignmentObservation();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNImageHomographicAlignmentObservation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NVNImageHomographicAlignmentObservation::warpTransformGetter) {
  JS_UNWRAP(VNImageHomographicAlignmentObservation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_matrix_float3x3([self warpTransform]));
  }
}

NAN_SETTER(NVNImageHomographicAlignmentObservation::warpTransformSetter) {
  JS_UNWRAP(VNImageHomographicAlignmentObservation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(matrix_float3x3, input);
    [self setWarpTransform: input];
  }
}
