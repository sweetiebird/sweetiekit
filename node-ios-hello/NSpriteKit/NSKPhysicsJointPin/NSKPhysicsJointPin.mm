//
//  NSKPhysicsJointPin.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJointPin.h"

#define instancetype SKPhysicsJointPin
#define js_value_instancetype js_value_SKPhysicsJointPin

NSKPhysicsJointPin::NSKPhysicsJointPin() {}
NSKPhysicsJointPin::~NSKPhysicsJointPin() {}

JS_INIT_CLASS(SKPhysicsJointPin, SKPhysicsJoint);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyABodyBAnchor);
  JS_ASSIGN_PROTO_PROP(shouldEnableLimits);
  JS_ASSIGN_PROTO_PROP(lowerAngleLimit);
  JS_ASSIGN_PROTO_PROP(upperAngleLimit);
  JS_ASSIGN_PROTO_PROP(frictionTorque);
  JS_ASSIGN_PROTO_PROP(rotationSpeed);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJointPin, SKPhysicsJoint);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJointPin, SKPhysicsJoint);

NAN_METHOD(NSKPhysicsJointPin::New) {
  JS_RECONSTRUCT(SKPhysicsJointPin);
  @autoreleasepool {
    SKPhysicsJointPin* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJointPin *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJointPin alloc] init];
    }
    if (self) {
      NSKPhysicsJointPin *wrapper = new NSKPhysicsJointPin();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJointPin::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsJointPin::jointWithBodyABodyBAnchor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsBody, bodyA);
    declare_pointer(SKPhysicsBody, bodyB);
    declare_value(CGPoint, anchor);
    JS_SET_RETURN(js_value_SKPhysicsJointPin([SKPhysicsJointPin jointWithBodyA: bodyA bodyB: bodyB anchor: anchor]));
  }
}

NAN_GETTER(NSKPhysicsJointPin::shouldEnableLimitsGetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldEnableLimits]));
  }
}

NAN_SETTER(NSKPhysicsJointPin::shouldEnableLimitsSetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldEnableLimits: input];
  }
}

NAN_GETTER(NSKPhysicsJointPin::lowerAngleLimitGetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self lowerAngleLimit]));
  }
}

NAN_SETTER(NSKPhysicsJointPin::lowerAngleLimitSetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setLowerAngleLimit: input];
  }
}

NAN_GETTER(NSKPhysicsJointPin::upperAngleLimitGetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self upperAngleLimit]));
  }
}

NAN_SETTER(NSKPhysicsJointPin::upperAngleLimitSetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setUpperAngleLimit: input];
  }
}

NAN_GETTER(NSKPhysicsJointPin::frictionTorqueGetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self frictionTorque]));
  }
}

NAN_SETTER(NSKPhysicsJointPin::frictionTorqueSetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFrictionTorque: input];
  }
}

NAN_GETTER(NSKPhysicsJointPin::rotationSpeedGetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self rotationSpeed]));
  }
}

NAN_SETTER(NSKPhysicsJointPin::rotationSpeedSetter) {
  JS_UNWRAP(SKPhysicsJointPin, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setRotationSpeed: input];
  }
}
