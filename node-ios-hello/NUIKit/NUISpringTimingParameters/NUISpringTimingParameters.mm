//
//  NUISpringTimingParameters.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISpringTimingParameters.h"

#define instancetype UISpringTimingParameters
#define js_value_instancetype js_value_UISpringTimingParameters

NUISpringTimingParameters::NUISpringTimingParameters() {}
NUISpringTimingParameters::~NUISpringTimingParameters() {}

JS_INIT_CLASS(UISpringTimingParameters, UITimingCurveProvider);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(initWithDampingRatioInitialVelocity);
  JS_ASSIGN_PROTO_METHOD(initWithMassStiffnessDampingInitialVelocity);
  JS_ASSIGN_PROTO_METHOD(initWithDampingRatio);
  JS_ASSIGN_PROTO_PROP_READONLY(initialVelocity);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UISpringTimingParameters, UITimingCurveProvider);
  // constant values (exports)
JS_INIT_CLASS_END(UISpringTimingParameters, UITimingCurveProvider);

NAN_METHOD(NUISpringTimingParameters::New) {
  JS_RECONSTRUCT(UISpringTimingParameters);
  @autoreleasepool {
    UISpringTimingParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UISpringTimingParameters *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UISpringTimingParameters alloc] init];
    }
    if (self) {
      NUISpringTimingParameters *wrapper = new NUISpringTimingParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISpringTimingParameters::New: invalid arguments");
    }
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUISpringTimingParameters::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UISpringTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUISpringTimingParameters::initWithDampingRatioInitialVelocity) {
  JS_UNWRAP_OR_ALLOC(UISpringTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, ratio);
    declare_value(CGVector, velocity);
    JS_SET_RETURN(js_value_instancetype([self initWithDampingRatio: ratio initialVelocity: velocity]));
  }
}

NAN_METHOD(NUISpringTimingParameters::initWithMassStiffnessDampingInitialVelocity) {
  JS_UNWRAP_OR_ALLOC(UISpringTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, mass);
    declare_value(CGFloat, stiffness);
    declare_value(CGFloat, damping);
    declare_value(CGVector, velocity);
    JS_SET_RETURN(js_value_instancetype([self initWithMass: mass stiffness: stiffness damping: damping initialVelocity: velocity]));
  }
}

NAN_METHOD(NUISpringTimingParameters::initWithDampingRatio) {
  JS_UNWRAP_OR_ALLOC(UISpringTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, ratio);
    JS_SET_RETURN(js_value_instancetype([self initWithDampingRatio: ratio]));
  }
}

NAN_GETTER(NUISpringTimingParameters::initialVelocityGetter) {
  JS_UNWRAP(UISpringTimingParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGVector([self initialVelocity]));
  }
}

