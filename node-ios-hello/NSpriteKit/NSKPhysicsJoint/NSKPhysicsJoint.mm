//
//  NSKPhysicsJoint.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKPhysicsJoint.h"

#define instancetype SKPhysicsJoint
#define js_value_instancetype js_value_SKPhysicsJoint

NSKPhysicsJoint::NSKPhysicsJoint() {}
NSKPhysicsJoint::~NSKPhysicsJoint() {}

JS_INIT_CLASS(SKPhysicsJoint, NSObject);
  JS_ASSIGN_PROTO_PROP(bodyA);
  JS_ASSIGN_PROTO_PROP(bodyB);
  JS_ASSIGN_PROTO_PROP_READONLY(reactionForce);
  JS_ASSIGN_PROTO_PROP_READONLY(reactionTorque);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SKPhysicsJoint, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SKPhysicsJoint, NSObject);

NAN_METHOD(NSKPhysicsJoint::New) {
  JS_RECONSTRUCT(SKPhysicsJoint);
  @autoreleasepool {
    SKPhysicsJoint* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SKPhysicsJoint *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SKPhysicsJoint alloc] init];
    }
    if (self) {
      NSKPhysicsJoint *wrapper = new NSKPhysicsJoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SKPhysicsJoint::New: invalid arguments");
    }
  }
}

#include "NSKPhysicsBody.h"

NAN_GETTER(NSKPhysicsJoint::bodyAGetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyA]));
  }
}

NAN_SETTER(NSKPhysicsJoint::bodyASetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKPhysicsBody, input);
    [self setBodyA: input];
  }
}

NAN_GETTER(NSKPhysicsJoint::bodyBGetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SKPhysicsBody([self bodyB]));
  }
}

NAN_SETTER(NSKPhysicsJoint::bodyBSetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(SKPhysicsBody, input);
    [self setBodyB: input];
  }
}

NAN_GETTER(NSKPhysicsJoint::reactionForceGetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGVector([self reactionForce]));
  }
}

NAN_GETTER(NSKPhysicsJoint::reactionTorqueGetter) {
  JS_UNWRAP(SKPhysicsJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self reactionTorque]));
  }
}
