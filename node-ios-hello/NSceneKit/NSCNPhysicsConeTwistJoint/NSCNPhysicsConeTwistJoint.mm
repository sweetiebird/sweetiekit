//
//  NSCNPhysicsConeTwistJoint.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsConeTwistJoint.h"

#define instancetype SCNPhysicsConeTwistJoint
#define js_value_instancetype js_value_SCNPhysicsConeTwistJoint

NSCNPhysicsConeTwistJoint::NSCNPhysicsConeTwistJoint() {}
NSCNPhysicsConeTwistJoint::~NSCNPhysicsConeTwistJoint() {}

JS_INIT_CLASS(SCNPhysicsConeTwistJoint, SCNPhysicsBehavior);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAFrameABodyBFrameB);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyFrame);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyA);
  JS_ASSIGN_PROTO_PROP(frameA);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyB);
  JS_ASSIGN_PROTO_PROP(frameB);
  JS_ASSIGN_PROTO_PROP(maximumAngularLimit1);
  JS_ASSIGN_PROTO_PROP(maximumAngularLimit2);
  JS_ASSIGN_PROTO_PROP(maximumTwistAngle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsConeTwistJoint, SCNPhysicsBehavior);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsConeTwistJoint, SCNPhysicsBehavior);

NAN_METHOD(NSCNPhysicsConeTwistJoint::New) {
  JS_RECONSTRUCT(SCNPhysicsConeTwistJoint);
  @autoreleasepool {
    SCNPhysicsConeTwistJoint* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsConeTwistJoint *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsConeTwistJoint alloc] init];
    }
    if (self) {
      NSCNPhysicsConeTwistJoint *wrapper = new NSCNPhysicsConeTwistJoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsConeTwistJoint::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsConeTwistJoint::jointWithBodyAFrameABodyBFrameB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, bodyA);
    declare_value(SCNMatrix4, frameA);
    declare_pointer(SCNPhysicsBody, bodyB);
    declare_value(SCNMatrix4, frameB);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsConeTwistJoint jointWithBodyA: bodyA frameA: frameA bodyB: bodyB frameB: frameB]));
  }
}

NAN_METHOD(NSCNPhysicsConeTwistJoint::jointWithBodyFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, body);
    declare_value(SCNMatrix4, frame);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsConeTwistJoint jointWithBody: body frame: frame]));
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::bodyAGetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyA]));
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::frameAGetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self frameA]));
  }
}

NAN_SETTER(NSCNPhysicsConeTwistJoint::frameASetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMatrix4, input);
    [self setFrameA: input];
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::bodyBGetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyB]));
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::frameBGetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNMatrix4([self frameB]));
  }
}

NAN_SETTER(NSCNPhysicsConeTwistJoint::frameBSetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNMatrix4, input);
    [self setFrameB: input];
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::maximumAngularLimit1Getter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumAngularLimit1]));
  }
}

NAN_SETTER(NSCNPhysicsConeTwistJoint::maximumAngularLimit1Setter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumAngularLimit1: input];
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::maximumAngularLimit2Getter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumAngularLimit2]));
  }
}

NAN_SETTER(NSCNPhysicsConeTwistJoint::maximumAngularLimit2Setter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumAngularLimit2: input];
  }
}

NAN_GETTER(NSCNPhysicsConeTwistJoint::maximumTwistAngleGetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumTwistAngle]));
  }
}

NAN_SETTER(NSCNPhysicsConeTwistJoint::maximumTwistAngleSetter) {
  JS_UNWRAP(SCNPhysicsConeTwistJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumTwistAngle: input];
  }
}
