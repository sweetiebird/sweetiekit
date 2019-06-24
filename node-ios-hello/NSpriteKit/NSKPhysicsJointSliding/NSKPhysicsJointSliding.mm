//
//  NSKPhysicsJointSliding.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJointSliding.h"

#define instancetype SKPhysicsJointSliding
#define js_value_instancetype js_value_SKPhysicsJointSliding

NSKPhysicsJointSliding::NSKPhysicsJointSliding() {}
NSKPhysicsJointSliding::~NSKPhysicsJointSliding() {}

JS_INIT_CLASS(SKPhysicsJointSliding, SKPhysicsJoint);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyABodyBAnchorAxis);
  JS_ASSIGN_PROTO_PROP(shouldEnableLimits);
  JS_ASSIGN_PROTO_PROP(lowerDistanceLimit);
  JS_ASSIGN_PROTO_PROP(upperDistanceLimit);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJointSliding, SKPhysicsJoint);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJointSliding, SKPhysicsJoint);

NAN_METHOD(NSKPhysicsJointSliding::New) {
  JS_RECONSTRUCT(SKPhysicsJointSliding);
  @autoreleasepool {
    SKPhysicsJointSliding* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJointSliding *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJointSliding alloc] init];
    }
    if (self) {
      NSKPhysicsJointSliding *wrapper = new NSKPhysicsJointSliding();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJointSliding::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsJointSliding::jointWithBodyABodyBAnchorAxis) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsBody, bodyA);
    declare_pointer(SKPhysicsBody, bodyB);
    declare_value(CGPoint, anchor);
    declare_value(CGVector, axis);
    JS_SET_RETURN(js_value_SKPhysicsJointSliding([SKPhysicsJointSliding jointWithBodyA: bodyA bodyB: bodyB anchor: anchor axis: axis]));
  }
}

NAN_GETTER(NSKPhysicsJointSliding::shouldEnableLimitsGetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldEnableLimits]));
  }
}

NAN_SETTER(NSKPhysicsJointSliding::shouldEnableLimitsSetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldEnableLimits: input];
  }
}

NAN_GETTER(NSKPhysicsJointSliding::lowerDistanceLimitGetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self lowerDistanceLimit]));
  }
}

NAN_SETTER(NSKPhysicsJointSliding::lowerDistanceLimitSetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setLowerDistanceLimit: input];
  }
}

NAN_GETTER(NSKPhysicsJointSliding::upperDistanceLimitGetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self upperDistanceLimit]));
  }
}

NAN_SETTER(NSKPhysicsJointSliding::upperDistanceLimitSetter) {
  JS_UNWRAP(SKPhysicsJointSliding, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setUpperDistanceLimit: input];
  }
}
