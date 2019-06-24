//
//  NSKPhysicsJointLimit.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJointLimit.h"

#define instancetype SKPhysicsJointLimit
#define js_value_instancetype js_value_SKPhysicsJointLimit

NSKPhysicsJointLimit::NSKPhysicsJointLimit() {}
NSKPhysicsJointLimit::~NSKPhysicsJointLimit() {}

JS_INIT_CLASS(SKPhysicsJointLimit, SKPhysicsJoint);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyABodyBAnchorAAnchorB);
  JS_ASSIGN_PROTO_PROP(maxLength);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJointLimit, SKPhysicsJoint);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJointLimit, SKPhysicsJoint);

NAN_METHOD(NSKPhysicsJointLimit::New) {
  JS_RECONSTRUCT(SKPhysicsJointLimit);
  @autoreleasepool {
    SKPhysicsJointLimit* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJointLimit *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJointLimit alloc] init];
    }
    if (self) {
      NSKPhysicsJointLimit *wrapper = new NSKPhysicsJointLimit();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJointLimit::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsJointLimit::jointWithBodyABodyBAnchorAAnchorB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsBody, bodyA);
    declare_pointer(SKPhysicsBody, bodyB);
    declare_value(CGPoint, anchorA);
    declare_value(CGPoint, anchorB);
    JS_SET_RETURN(js_value_SKPhysicsJointLimit([SKPhysicsJointLimit jointWithBodyA: bodyA bodyB: bodyB anchorA: anchorA anchorB: anchorB]));
  }
}

NAN_GETTER(NSKPhysicsJointLimit::maxLengthGetter) {
  JS_UNWRAP(SKPhysicsJointLimit, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maxLength]));
  }
}

NAN_SETTER(NSKPhysicsJointLimit::maxLengthSetter) {
  JS_UNWRAP(SKPhysicsJointLimit, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaxLength: input];
  }
}
