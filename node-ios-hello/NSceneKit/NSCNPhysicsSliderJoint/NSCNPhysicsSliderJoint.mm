//
//  NSCNPhysicsSliderJoint.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsSliderJoint.h"

#define instancetype SCNPhysicsSliderJoint
#define js_value_instancetype js_value_SCNPhysicsSliderJoint

NSCNPhysicsSliderJoint::NSCNPhysicsSliderJoint() {}
NSCNPhysicsSliderJoint::~NSCNPhysicsSliderJoint() {}

JS_INIT_CLASS(SCNPhysicsSliderJoint, SCNPhysicsBehavior);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAAxisAAnchorABodyBAxisBAnchorB);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAxisAnchor);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyA);
  JS_ASSIGN_PROTO_PROP(axisA);
  JS_ASSIGN_PROTO_PROP(anchorA);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyB);
  JS_ASSIGN_PROTO_PROP(axisB);
  JS_ASSIGN_PROTO_PROP(anchorB);
  JS_ASSIGN_PROTO_PROP(minimumLinearLimit);
  JS_ASSIGN_PROTO_PROP(maximumLinearLimit);
  JS_ASSIGN_PROTO_PROP(minimumAngularLimit);
  JS_ASSIGN_PROTO_PROP(maximumAngularLimit);
  JS_ASSIGN_PROTO_PROP(motorTargetLinearVelocity);
  JS_ASSIGN_PROTO_PROP(motorMaximumForce);
  JS_ASSIGN_PROTO_PROP(motorTargetAngularVelocity);
  JS_ASSIGN_PROTO_PROP(motorMaximumTorque);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsSliderJoint, SCNPhysicsBehavior);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsSliderJoint, SCNPhysicsBehavior);

NAN_METHOD(NSCNPhysicsSliderJoint::New) {
  JS_RECONSTRUCT(SCNPhysicsSliderJoint);
  @autoreleasepool {
    SCNPhysicsSliderJoint* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsSliderJoint *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsSliderJoint alloc] init];
    }
    if (self) {
      NSCNPhysicsSliderJoint *wrapper = new NSCNPhysicsSliderJoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsSliderJoint::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsSliderJoint::jointWithBodyAAxisAAnchorABodyBAxisBAnchorB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, bodyA);
    declare_value(SCNVector3, axisA);
    declare_value(SCNVector3, anchorA);
    declare_pointer(SCNPhysicsBody, bodyB);
    declare_value(SCNVector3, axisB);
    declare_value(SCNVector3, anchorB);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsSliderJoint jointWithBodyA: bodyA axisA: axisA anchorA: anchorA bodyB: bodyB axisB: axisB anchorB: anchorB]));
  }
}

NAN_METHOD(NSCNPhysicsSliderJoint::jointWithBodyAxisAnchor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, body);
    declare_value(SCNVector3, axis);
    declare_value(SCNVector3, anchor);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsSliderJoint jointWithBody: body axis: axis anchor: anchor]));
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::bodyAGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyA]));
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::axisAGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self axisA]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::axisASetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAxisA: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::anchorAGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorA]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::anchorASetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorA: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::bodyBGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyB]));
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::axisBGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self axisB]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::axisBSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAxisB: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::anchorBGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorB]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::anchorBSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorB: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::minimumLinearLimitGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumLinearLimit]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::minimumLinearLimitSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumLinearLimit: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::maximumLinearLimitGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumLinearLimit]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::maximumLinearLimitSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumLinearLimit: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::minimumAngularLimitGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumAngularLimit]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::minimumAngularLimitSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumAngularLimit: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::maximumAngularLimitGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumAngularLimit]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::maximumAngularLimitSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumAngularLimit: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::motorTargetLinearVelocityGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self motorTargetLinearVelocity]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::motorTargetLinearVelocitySetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMotorTargetLinearVelocity: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::motorMaximumForceGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self motorMaximumForce]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::motorMaximumForceSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMotorMaximumForce: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::motorTargetAngularVelocityGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self motorTargetAngularVelocity]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::motorTargetAngularVelocitySetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMotorTargetAngularVelocity: input];
  }
}

NAN_GETTER(NSCNPhysicsSliderJoint::motorMaximumTorqueGetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self motorMaximumTorque]));
  }
}

NAN_SETTER(NSCNPhysicsSliderJoint::motorMaximumTorqueSetter) {
  JS_UNWRAP(SCNPhysicsSliderJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMotorMaximumTorque: input];
  }
}
