//
//  NSKPhysicsJointFixed.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJointFixed.h"

#define instancetype SKPhysicsJointFixed
#define js_value_instancetype js_value_SKPhysicsJointFixed

NSKPhysicsJointFixed::NSKPhysicsJointFixed() {}
NSKPhysicsJointFixed::~NSKPhysicsJointFixed() {}

JS_INIT_CLASS(SKPhysicsJointFixed, SKPhysicsJoint);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyABodyBAnchor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJointFixed, SKPhysicsJoint);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJointFixed, SKPhysicsJoint);

NAN_METHOD(NSKPhysicsJointFixed::New) {
  JS_RECONSTRUCT(SKPhysicsJointFixed);
  @autoreleasepool {
    SKPhysicsJointFixed* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJointFixed *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJointFixed alloc] init];
    }
    if (self) {
      NSKPhysicsJointFixed *wrapper = new NSKPhysicsJointFixed();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJointFixed::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_METHOD(NSKPhysicsJointFixed::jointWithBodyABodyBAnchor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SKPhysicsBody, bodyA);
    declare_pointer(SKPhysicsBody, bodyB);
    declare_value(CGPoint, anchor);
    JS_SET_RETURN(js_value_SKPhysicsJointFixed([SKPhysicsJointFixed jointWithBodyA: bodyA bodyB: bodyB anchor: anchor]));
  }
}
