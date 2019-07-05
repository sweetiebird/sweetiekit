//
//  NUICubicTimingParameters.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICubicTimingParameters.h"

#define instancetype UICubicTimingParameters
#define js_value_instancetype js_value_UICubicTimingParameters

NUICubicTimingParameters::NUICubicTimingParameters() {}
NUICubicTimingParameters::~NUICubicTimingParameters() {}

JS_INIT_CLASS(UICubicTimingParameters, UITimingCurveProvider);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(initWithAnimationCurve);
  JS_ASSIGN_PROTO_METHOD(initWithControlPoint1ControlPoint2);
  JS_ASSIGN_PROTO_PROP_READONLY(animationCurve);
  JS_ASSIGN_PROTO_PROP_READONLY(controlPoint1);
  JS_ASSIGN_PROTO_PROP_READONLY(controlPoint2);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UICubicTimingParameters, UITimingCurveProvider);
  // constant values (exports)
JS_INIT_CLASS_END(UICubicTimingParameters, UITimingCurveProvider);

NAN_METHOD(NUICubicTimingParameters::New) {
  JS_RECONSTRUCT(UICubicTimingParameters);
  @autoreleasepool {
    UICubicTimingParameters* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UICubicTimingParameters *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UICubicTimingParameters alloc] init];
    }
    if (self) {
      NUICubicTimingParameters *wrapper = new NUICubicTimingParameters();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UICubicTimingParameters::New: invalid arguments");
    }
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUICubicTimingParameters::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UICubicTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

#include "NUIView.h"

NAN_METHOD(NUICubicTimingParameters::initWithAnimationCurve) {
  JS_UNWRAP_OR_ALLOC(UICubicTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIViewAnimationCurve, curve);
    JS_SET_RETURN(js_value_instancetype([self initWithAnimationCurve: curve]));
  }
}

NAN_METHOD(NUICubicTimingParameters::initWithControlPoint1ControlPoint2) {
  JS_UNWRAP_OR_ALLOC(UICubicTimingParameters, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, point1);
    declare_value(CGPoint, point2);
    JS_SET_RETURN(js_value_instancetype([self initWithControlPoint1: point1 controlPoint2: point2]));
  }
}

NAN_GETTER(NUICubicTimingParameters::animationCurveGetter) {
  JS_UNWRAP(UICubicTimingParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewAnimationCurve([self animationCurve]));
  }
}

NAN_GETTER(NUICubicTimingParameters::controlPoint1Getter) {
  JS_UNWRAP(UICubicTimingParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self controlPoint1]));
  }
}

NAN_GETTER(NUICubicTimingParameters::controlPoint2Getter) {
  JS_UNWRAP(UICubicTimingParameters, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self controlPoint2]));
  }
}
