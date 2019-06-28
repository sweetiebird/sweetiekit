//
//  NSKReachConstraints.mm
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKReachConstraints.h"

#define instancetype SKReachConstraints
#define js_value_instancetype js_value_SKReachConstraints

NSKReachConstraints::NSKReachConstraints() {}
NSKReachConstraints::~NSKReachConstraints() {}

JS_INIT_CLASS(SKReachConstraints, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithLowerAngleLimitUpperAngleLimit);
  JS_ASSIGN_PROTO_PROP(lowerAngleLimit);
  JS_ASSIGN_PROTO_PROP(upperAngleLimit);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKReachConstraints, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SKReachConstraints, NSObject);

NAN_METHOD(NSKReachConstraints::New) {
  JS_RECONSTRUCT(SKReachConstraints);
  @autoreleasepool {
    SKReachConstraints* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKReachConstraints *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKReachConstraints alloc] init];
    }
    if (self) {
      NSKReachConstraints *wrapper = new NSKReachConstraints();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKReachConstraints::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSKReachConstraints::initWithLowerAngleLimitUpperAngleLimit) {
  JS_UNWRAP_OR_ALLOC(SKReachConstraints, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, lowerAngleLimit);
    declare_value(CGFloat, upperAngleLimit);
    JS_SET_RETURN(js_value_instancetype([self initWithLowerAngleLimit: lowerAngleLimit upperAngleLimit: upperAngleLimit]));
  }
}

NAN_GETTER(NSKReachConstraints::lowerAngleLimitGetter) {
  JS_UNWRAP(SKReachConstraints, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self lowerAngleLimit]));
  }
}

NAN_SETTER(NSKReachConstraints::lowerAngleLimitSetter) {
  JS_UNWRAP(SKReachConstraints, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setLowerAngleLimit: input];
  }
}

NAN_GETTER(NSKReachConstraints::upperAngleLimitGetter) {
  JS_UNWRAP(SKReachConstraints, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self upperAngleLimit]));
  }
}

NAN_SETTER(NSKReachConstraints::upperAngleLimitSetter) {
  JS_UNWRAP(SKReachConstraints, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setUpperAngleLimit: input];
  }
}
