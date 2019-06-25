//
//  NSCNPhysicsBallSocketJoint.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsBallSocketJoint.h"

#define instancetype SCNPhysicsBallSocketJoint
#define js_value_instancetype js_value_SCNPhysicsBallSocketJoint

NSCNPhysicsBallSocketJoint::NSCNPhysicsBallSocketJoint() {}
NSCNPhysicsBallSocketJoint::~NSCNPhysicsBallSocketJoint() {}

JS_INIT_CLASS(SCNPhysicsBallSocketJoint, SCNPhysicsBehavior);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAAnchorABodyBAnchorB);
  JS_ASSIGN_STATIC_METHOD(jointWithBodyAnchor);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyA);
  JS_ASSIGN_PROTO_PROP(anchorA);
  JS_ASSIGN_PROTO_PROP_READONLY(bodyB);
  JS_ASSIGN_PROTO_PROP(anchorB);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsBallSocketJoint, SCNPhysicsBehavior);
  // constant values (exports)
JS_INIT_CLASS_END(SCNPhysicsBallSocketJoint, SCNPhysicsBehavior);

NAN_METHOD(NSCNPhysicsBallSocketJoint::New) {
  JS_RECONSTRUCT(SCNPhysicsBallSocketJoint);
  @autoreleasepool {
    SCNPhysicsBallSocketJoint* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsBallSocketJoint *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNPhysicsBallSocketJoint alloc] init];
    }
    if (self) {
      NSCNPhysicsBallSocketJoint *wrapper = new NSCNPhysicsBallSocketJoint();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsBallSocketJoint::New: invalid arguments");
    }
  }
}

#include "NSCNPhysicsBody.h"

NAN_METHOD(NSCNPhysicsBallSocketJoint::jointWithBodyAAnchorABodyBAnchorB) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, bodyA);
    declare_value(SCNVector3, anchorA);
    declare_pointer(SCNPhysicsBody, bodyB);
    declare_value(SCNVector3, anchorB);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsBallSocketJoint jointWithBodyA: bodyA anchorA: anchorA bodyB: bodyB anchorB: anchorB]));
  }
}

NAN_METHOD(NSCNPhysicsBallSocketJoint::jointWithBodyAnchor) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNPhysicsBody, body);
    declare_value(SCNVector3, anchor);
    JS_SET_RETURN(js_value_instancetype([SCNPhysicsBallSocketJoint jointWithBody: body anchor: anchor]));
  }
}

NAN_GETTER(NSCNPhysicsBallSocketJoint::bodyAGetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyA]));
  }
}

NAN_GETTER(NSCNPhysicsBallSocketJoint::anchorAGetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorA]));
  }
}

NAN_SETTER(NSCNPhysicsBallSocketJoint::anchorASetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorA: input];
  }
}

NAN_GETTER(NSCNPhysicsBallSocketJoint::bodyBGetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNPhysicsBody([self bodyB]));
  }
}

NAN_GETTER(NSCNPhysicsBallSocketJoint::anchorBGetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_SCNVector3([self anchorB]));
  }
}

NAN_SETTER(NSCNPhysicsBallSocketJoint::anchorBSetter) {
  JS_UNWRAP(SCNPhysicsBallSocketJoint, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(SCNVector3, input);
    [self setAnchorB: input];
  }
}

