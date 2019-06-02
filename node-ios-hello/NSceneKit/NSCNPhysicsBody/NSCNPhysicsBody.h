//
//  NSCNPhysicsBody.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsBody_h
#define NSCNPhysicsBody_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsBody(x) js_value_wrapper(x, SCNPhysicsBody)
#define to_value_SCNPhysicsBody(x) to_value_wrapper(x, SCNPhysicsBody)
#define is_value_SCNPhysicsBody(x) is_value_wrapper(x, SCNPhysicsBody)

// SpriteKit enums
#define js_value_SCNPhysicsBodyType(x) JS_ENUM(SCNPhysicsBodyType, NSInteger, x)
#define to_value_SCNPhysicsBodyType(x) TO_ENUM(SCNPhysicsBodyType, NSInteger, x)
#define is_value_SCNPhysicsBodyType(x) IS_ENUM(SCNPhysicsBodyType, NSInteger, x)

JS_WRAP_CLASS(SCNPhysicsBody, NSObject);
  JS_METHOD(staticBody);
  JS_METHOD(dynamicBody);
  JS_METHOD(kinematicBody);
  JS_METHOD(bodyWithTypeShape);
  JS_METHOD(applyForce);
  JS_METHOD(applyForceAtPosition);
  JS_METHOD(applyTorque);
  JS_METHOD(clearAllForces);
  JS_METHOD(resetTransform);
  JS_METHOD(setResting);
  JS_PROP(type);
  JS_PROP(mass);
  JS_PROP(momentOfInertia);
  JS_PROP(usesDefaultMomentOfInertia);
  JS_PROP(charge);
  JS_PROP(friction);
  JS_PROP(restitution);
  JS_PROP(rollingFriction);
  JS_PROP(physicsShape);
  JS_PROP_READONLY(isResting);
  JS_PROP(allowsResting);
  JS_PROP(velocity);
  JS_PROP(angularVelocity);
  JS_PROP(damping);
  JS_PROP(angularDamping);
  JS_PROP(velocityFactor);
  JS_PROP(angularVelocityFactor);
  JS_PROP(categoryBitMask);
  JS_PROP(collisionBitMask);
  JS_PROP(contactTestBitMask);
  JS_PROP(affectedByGravity);
  JS_PROP(continuousCollisionDetectionThreshold);
  JS_PROP(centerOfMassOffset);
  JS_PROP(linearRestingThreshold);
  JS_PROP(angularRestingThreshold);
JS_WRAP_CLASS_END(SCNPhysicsBody);

#endif /* NSCNPhysicsBody_h */
