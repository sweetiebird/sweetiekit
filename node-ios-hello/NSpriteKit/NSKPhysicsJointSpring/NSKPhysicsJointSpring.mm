//
//  NSKPhysicsJointSpring.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJointSpring.h"

#define instancetype SKPhysicsJointSpring
#define js_value_instancetype js_value_SKPhysicsJointSpring

NSKPhysicsJointSpring::NSKPhysicsJointSpring() {}
NSKPhysicsJointSpring::~NSKPhysicsJointSpring() {}

JS_INIT_CLASS(SKPhysicsJointSpring, SKPhysicsJoint);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyABodyBAnchorAAnchorB);
  JS_ASSIGN_PROTO_PROP(damping);
  JS_ASSIGN_PROTO_PROP(frequency);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJointSpring, SKPhysicsJoint);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJointSpring, SKPhysicsJoint);

NAN_METHOD(NSKPhysicsJointSpring::New) {
  JS_RECONSTRUCT(SKPhysicsJointSpring);
  @autoreleasepool {
    SKPhysicsJointSpring* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJointSpring *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJointSpring alloc] init];
    }
    if (self) {
      NSKPhysicsJointSpring *wrapper = new NSKPhysicsJointSpring();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJointSpring::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsJointSpring::jointWithBodyABodyBAnchorAAnchorB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsBody, bodyA);
    declare_pointer(SKPhysicsBody, bodyB);
    declare_value(CGPoint, anchorA);
    declare_value(CGPoint, anchorB);
    JS_SET_RETURN(js_value_SKPhysicsJointSpring([SKPhysicsJointSpring jointWithBodyA: bodyA bodyB: bodyB anchorA: anchorA anchorB: anchorB]));
  }
}

NAN_GETTER(NSKPhysicsJointSpring::dampingGetter) {
  JS_UNWRAP(SKPhysicsJointSpring, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self damping]));
  }
}

NAN_SETTER(NSKPhysicsJointSpring::dampingSetter) {
  JS_UNWRAP(SKPhysicsJointSpring, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setDamping: input];
  }
}

NAN_GETTER(NSKPhysicsJointSpring::frequencyGetter) {
  JS_UNWRAP(SKPhysicsJointSpring, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self frequency]));
  }
}

NAN_SETTER(NSKPhysicsJointSpring::frequencySetter) {
  JS_UNWRAP(SKPhysicsJointSpring, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setFrequency: input];
  }
}
