//
//  NSCNPhysicsHingeJoint.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsHingeJoint.h"

#define instancetype SCNPhysicsHingeJoint
#define js_value_instancetype js_value_SCNPhysicsHingeJoint

NSCNPhysicsHingeJoint::NSCNPhysicsHingeJoint() {}
NSCNPhysicsHingeJoint::~NSCNPhysicsHingeJoint() {}

JS_INIT_CLASS(SCNPhysicsHingeJoint, SCNPhysicsBehavior);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAAxisAAnchorABodyBAxisBAnchorB);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAxisAnchor);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyA);
  JS_ASSIGN_PROTO_PROP(axisA);
  JS_ASSIGN_PROTO_PROP(anchorA);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyB);
  JS_ASSIGN_PROTO_PROP(axisB);
  JS_ASSIGN_PROTO_PROP(anchorB);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsHingeJoint, SCNPhysicsBehavior);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsHingeJoint, SCNPhysicsBehavior);

NAN_METHOD(NSCNPhysicsHingeJoint::New) {
  JS_RECONSTRUCT(SCNPhysicsHingeJoint);
  @autoreleasepool {
    SCNPhysicsHingeJoint* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsHingeJoint *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsHingeJoint alloc] init];
    }
    if (self) {
      NSCNPhysicsHingeJoint *wrapper = new NSCNPhysicsHingeJoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsHingeJoint::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsHingeJoint::jointWithBodyAAxisAAnchorABodyBAxisBAnchorB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, bodyA);
    declare_value(SCNVector3, axisA);
    declare_value(SCNVector3, anchorA);
    declare_pointer(SCNPhysicsBody, bodyB);
    declare_value(SCNVector3, axisB);
    declare_value(SCNVector3, anchorB);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsHingeJoint jointWithBodyA: bodyA axisA: axisA anchorA: anchorA bodyB: bodyB axisB: axisB anchorB: anchorB]));
  }
}

NAN_METHOD(NSCNPhysicsHingeJoint::jointWithBodyAxisAnchor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, body);
    declare_value(SCNVector3, axis);
    declare_value(SCNVector3, anchor);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsHingeJoint jointWithBody: body axis: axis anchor: anchor]));
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::bodyAGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyA]));
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::axisAGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self axisA]));
  }
}

NAN_SETTER(NSCNPhysicsHingeJoint::axisASetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAxisA: input];
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::anchorAGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorA]));
  }
}

NAN_SETTER(NSCNPhysicsHingeJoint::anchorASetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorA: input];
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::bodyBGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyB]));
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::axisBGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self axisB]));
  }
}

NAN_SETTER(NSCNPhysicsHingeJoint::axisBSetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAxisB: input];
  }
}

NAN_GETTER(NSCNPhysicsHingeJoint::anchorBGetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorB]));
  }
}

NAN_SETTER(NSCNPhysicsHingeJoint::anchorBSetter) {
  JS_UNWRAP(SCNPhysicsHingeJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorB: input];
  }
}

