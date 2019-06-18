//
//  NCAMediaTimingFunction.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAMediaTimingFunction.h"

#define instancetype CAMediaTimingFunction
#define js_value_instancetype js_value_CAMediaTimingFunction

NCAMediaTimingFunction::NCAMediaTimingFunction() {}
NCAMediaTimingFunction::~NCAMediaTimingFunction() {}

JS_INIT_CLASS(CAMediaTimingFunction, NSObject);
  JS_ASSIGN_STATIC_METHOD(functionWithName);
  JS_ASSIGN_STATIC_METHOD(functionWithControlPoints);
  JS_ASSIGN_STATIC_METHOD(initWithControlPoints);
  JS_ASSIGN_PROTO_METHOD(getControlPointAtIndexValues);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CAMediaTimingFunction, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(kCAMediaTimingFunctionLinear, CAMediaTimingFunctionName);
  JS_ASSIGN_ENUM(kCAMediaTimingFunctionEaseIn, CAMediaTimingFunctionName);
  JS_ASSIGN_ENUM(kCAMediaTimingFunctionEaseOut, CAMediaTimingFunctionName);
  JS_ASSIGN_ENUM(kCAMediaTimingFunctionEaseInEaseOut, CAMediaTimingFunctionName);
  JS_ASSIGN_ENUM(kCAMediaTimingFunctionDefault, CAMediaTimingFunctionName);

JS_INIT_CLASS_END(CAMediaTimingFunction, NSObject);

NAN_METHOD(NCAMediaTimingFunction::New) {
  JS_RECONSTRUCT(CAMediaTimingFunction);
  @autoreleasepool {
    CAMediaTimingFunction* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CAMediaTimingFunction *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CAMediaTimingFunction alloc] init];
    }
    if (self) {
      NCAMediaTimingFunction *wrapper = new NCAMediaTimingFunction();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CAMediaTimingFunction::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCAMediaTimingFunction::functionWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CAMediaTimingFunctionName, name);
    JS_SET_RETURN(js_value_instancetype([CAMediaTimingFunction functionWithName: name]));
  }
}

NAN_METHOD(NCAMediaTimingFunction::functionWithControlPoints) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, c1x);
    declare_value(float, c1y);
    declare_value(float, c2x);
    declare_value(float, c2y);
    JS_SET_RETURN(js_value_instancetype([CAMediaTimingFunction functionWithControlPoints: c1x : c1y : c2x : c2y]));
  }
}

NAN_METHOD(NCAMediaTimingFunction::initWithControlPoints) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, c1x);
    declare_value(float, c1y);
    declare_value(float, c2x);
    declare_value(float, c2y);
    JS_SET_RETURN(js_value_instancetype([[CAMediaTimingFunction alloc] initWithControlPoints: c1x : c1y : c2x : c2y]));
  }
}

NAN_METHOD(NCAMediaTimingFunction::getControlPointAtIndexValues) {
  JS_UNWRAP(CAMediaTimingFunction, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, idx);
    float ptr[2] = { 0.0f, 0.0f };
    [self getControlPointAtIndex: idx values: ptr];
    JS_SET_RETURN(js_value_CGPoint(CGPointMake(ptr[0], ptr[1])));
  }
}

