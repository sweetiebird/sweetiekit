//
//  NSCNPhysicsBody.mm
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNPhysicsBody.h"

NSCNPhysicsBody::NSCNPhysicsBody() {}
NSCNPhysicsBody::~NSCNPhysicsBody() {}

JS_INIT_CLASS(SCNPhysicsBody, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(applyForce);
  JS_ASSIGN_PROTO_METHOD(applyForceAtPosition);
  JS_ASSIGN_PROTO_METHOD(applyTorque);
  JS_ASSIGN_PROTO_METHOD(clearAllForces);
  JS_ASSIGN_PROTO_METHOD(resetTransform);
  JS_ASSIGN_PROTO_METHOD(setResting);
  JS_ASSIGN_PROP(proto, type);
  JS_ASSIGN_PROP(proto, mass);
  JS_ASSIGN_PROP(proto, momentOfInertia);
  JS_ASSIGN_PROP(proto, usesDefaultMomentOfInertia);
  JS_ASSIGN_PROP(proto, charge);
  JS_ASSIGN_PROP(proto, friction);
  JS_ASSIGN_PROP(proto, restitution);
  JS_ASSIGN_PROP(proto, rollingFriction);
  JS_ASSIGN_PROP(proto, physicsShape);
  JS_ASSIGN_PROP_READONLY(proto, isResting);
  JS_ASSIGN_PROP(proto, allowsResting);
  JS_ASSIGN_PROP(proto, velocity);
  JS_ASSIGN_PROP(proto, angularVelocity);
  JS_ASSIGN_PROP(proto, damping);
  JS_ASSIGN_PROP(proto, angularDamping);
  JS_ASSIGN_PROP(proto, velocityFactor);
  JS_ASSIGN_PROP(proto, angularVelocityFactor);
  JS_ASSIGN_PROP(proto, categoryBitMask);
  JS_ASSIGN_PROP(proto, collisionBitMask);
  JS_ASSIGN_PROP(proto, contactTestBitMask);
  JS_ASSIGN_PROP(proto, affectedByGravity);
  JS_ASSIGN_PROP(proto, continuousCollisionDetectionThreshold);
  JS_ASSIGN_PROP(proto, centerOfMassOffset);
  JS_ASSIGN_PROP(proto, linearRestingThreshold);
  JS_ASSIGN_PROP(proto, angularRestingThreshold);

  // static members (ctor)
  JS_INIT_CTOR(SCNPhysicsBody, NSObject);
  JS_ASSIGN_METHOD(ctor, staticBody);
  JS_ASSIGN_METHOD(ctor, dynamicBody);
  JS_ASSIGN_METHOD(ctor, kinematicBody);
  JS_ASSIGN_METHOD(ctor, bodyWithTypeShape);
JS_INIT_CLASS_END(SCNPhysicsBody, NSObject);

NAN_METHOD(NSCNPhysicsBody::New) {
  JS_RECONSTRUCT(SCNPhysicsBody);
  @autoreleasepool {
    SCNPhysicsBody* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNPhysicsBody *)(info[0].As<External>()->Value());
    } else if(info.Length() <= 0) {
      self = [[SCNPhysicsBody alloc] init];
    }
    if (self) {
      NSCNPhysicsBody *wrapper = new NSCNPhysicsBody();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNPhysicsBody::New: invalid arguments");
    }
  }
}

//("+" ("instancetype") "staticBody")
NAN_METHOD(NSCNPhysicsBody::staticBody) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SCNPhysicsBody, [SCNPhysicsBody staticBody]);
  }
}

//("+" ("instancetype") "dynamicBody")
NAN_METHOD(NSCNPhysicsBody::dynamicBody) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SCNPhysicsBody, [SCNPhysicsBody dynamicBody]);
  }
}

//("+" ("instancetype") "kinematicBody")
NAN_METHOD(NSCNPhysicsBody::kinematicBody) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SCNPhysicsBody, [SCNPhysicsBody kinematicBody]);
  }
}

#define js_value_SCNPhysicsShape(x) js_value_wrapper_unknown(x, SCNPhysicsShape)
#define to_value_SCNPhysicsShape(x) to_value_wrapper_unknown(x, SCNPhysicsShape)
#define is_value_SCNPhysicsShape(x) is_value_wrapper_unknown(x, SCNPhysicsShape)

//("+" ("instancetype") "bodyWithType:" ("SCNPhysicsBodyType") "type" "shape:" ("nullable" "SCNPhysicsShape*") "shape")
NAN_METHOD(NSCNPhysicsBody::bodyWithTypeShape) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(SCNPhysicsBody,
      [SCNPhysicsBody
        bodyWithType:to_value_SCNPhysicsBodyType(info[0])
        shape:to_value_SCNPhysicsShape(info[1])]);
  }
}

//("-" ("void") "applyForce:" ("SCNVector3") "direction" "impulse:" ("BOOL") "impulse")
NAN_METHOD(NSCNPhysicsBody::applyForce) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    SCNVector3 direction(to_value_SCNVector3(info[0]));
    bool impulse(info[1]->IsBoolean() ? TO_BOOL(info[1]) : false);
    [self applyForce:direction impulse:impulse];
  }
}

//("-" ("void") "applyForce:" ("SCNVector3") "direction" "atPosition:" ("SCNVector3") "position" "impulse:" ("BOOL") "impulse")
NAN_METHOD(NSCNPhysicsBody::applyForceAtPosition) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    SCNVector3 direction(to_value_SCNVector3(info[0]));
    SCNVector3 position(to_value_SCNVector3(info[1]));
    bool impulse(info[2]->IsBoolean() ? TO_BOOL(info[2]) : false);
    [self applyForce:direction atPosition:position impulse:impulse];
  }
}

//("-" ("void") "applyTorque:" ("SCNVector4") "torque" "impulse:" ("BOOL") "impulse")
NAN_METHOD(NSCNPhysicsBody::applyTorque) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    SCNVector4 torque(to_value_SCNVector4(info[0]));
    bool impulse(info[1]->IsBoolean() ? TO_BOOL(info[1]) : false);
    [self applyTorque:torque impulse:impulse];
  }
}

//("-" ("void") "clearAllForces")
NAN_METHOD(NSCNPhysicsBody::clearAllForces) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    [self clearAllForces];
  }
}

//("-" ("void") "resetTransform")
NAN_METHOD(NSCNPhysicsBody::resetTransform) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    [self resetTransform];
  }
}

//("-" ("void") "setResting:" ("BOOL") "resting")
NAN_METHOD(NSCNPhysicsBody::setResting) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool {
    [self setResting:TO_BOOL(info[0])];
  }
}

NAN_GETTER(NSCNPhysicsBody::typeGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNPhysicsBodyType([self type]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::typeSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setType: to_value_SCNPhysicsBodyType(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::massGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self mass]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::massSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setMass: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::momentOfInertiaGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self momentOfInertia]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::momentOfInertiaSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setMomentOfInertia: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::usesDefaultMomentOfInertiaGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self usesDefaultMomentOfInertia]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::usesDefaultMomentOfInertiaSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setUsesDefaultMomentOfInertia: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::chargeGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self charge]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::chargeSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setCharge: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::frictionGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self friction]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::frictionSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setFriction: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::restitutionGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self restitution]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::restitutionSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setRestitution: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::rollingFrictionGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self rollingFriction]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::rollingFrictionSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setRollingFriction: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::physicsShapeGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNPhysicsShape([self physicsShape]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::physicsShapeSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setPhysicsShape: to_value_SCNPhysicsShape(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::isRestingGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isResting]));
    return;
  }
}

NAN_GETTER(NSCNPhysicsBody::allowsRestingGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self allowsResting]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::allowsRestingSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAllowsResting: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::velocityGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self velocity]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::velocitySetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setVelocity: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::angularVelocityGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector4([self angularVelocity]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::angularVelocitySetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularVelocity: to_value_SCNVector4(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::dampingGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self damping]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::dampingSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setDamping: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::angularDampingGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self angularDamping]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::angularDampingSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularDamping: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::velocityFactorGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self velocityFactor]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::velocityFactorSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setVelocityFactor: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::angularVelocityFactorGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self angularVelocityFactor]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::angularVelocityFactorSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularVelocityFactor: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::categoryBitMaskGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self categoryBitMask]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::categoryBitMaskSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setCategoryBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::collisionBitMaskGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self collisionBitMask]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::collisionBitMaskSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setCollisionBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::contactTestBitMaskGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self contactTestBitMask]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::contactTestBitMaskSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setContactTestBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::affectedByGravityGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isAffectedByGravity]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::affectedByGravitySetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAffectedByGravity: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::continuousCollisionDetectionThresholdGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self continuousCollisionDetectionThreshold]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::continuousCollisionDetectionThresholdSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setContinuousCollisionDetectionThreshold: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::centerOfMassOffsetGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNVector3([self centerOfMassOffset]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::centerOfMassOffsetSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setCenterOfMassOffset: to_value_SCNVector3(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::linearRestingThresholdGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self linearRestingThreshold]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::linearRestingThresholdSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setLinearRestingThreshold: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NSCNPhysicsBody::angularRestingThresholdGetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self angularRestingThreshold]));
    return;
  }
}

NAN_SETTER(NSCNPhysicsBody::angularRestingThresholdSetter) {
  JS_UNWRAP(SCNPhysicsBody, self);
  @autoreleasepool
  {
    [self setAngularRestingThreshold: to_value_CGFloat(value)];
  }
}

