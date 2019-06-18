//
//  NSKPhysicsBody.h
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsBody_h
#define NSKPhysicsBody_h    

#include "NNSObject.h"

#define js_value_SKPhysicsBody(x) js_value_wrapper(x, SKPhysicsBody)
#define to_value_SKPhysicsBody(x) to_value_wrapper(x, SKPhysicsBody)
#define is_value_SKPhysicsBody(x) is_value_wrapper(x, SKPhysicsBody)

JS_WRAP_CLASS(SKPhysicsBody, NSObject);
  JS_METHOD(bodyWithCircleOfRadius);
  JS_METHOD(bodyWithTexture);
  JS_METHOD(bodyWithRectangleOfSize);
  JS_METHOD(bodyWithEdgeLoopFromRect);
  JS_METHOD(applyImpulse);
  JS_METHOD(applyTorque);
  JS_METHOD(applyForce);
  JS_METHOD(applyAngularImpulse);
  JS_METHOD(applyForceAtPoint);
  JS_METHOD(applyImpulseAtPoint);
  
  // JS_PROP(node);
  // JS_PROP(categoryBitMask);
  // JS_PROP(contactTestBitMask);
  // JS_PROP(collisionBitMask);
  JS_PROP(isDynamic);
  JS_PROP(usesPreciseCollisionDetection);
  JS_PROP(allowsRotation);
  JS_PROP(pinned);
  JS_PROP(resting);
  JS_PROP(friction);
  JS_PROP(charge);
  JS_PROP(restitution);
  JS_PROP(linearDamping);
  JS_PROP(angularDamping);
  JS_PROP(density);
  JS_PROP(mass);
  JS_PROP(area);
  JS_PROP(affectedByGravity);
  JS_PROP(fieldBitMask);
  JS_PROP(categoryBitMask);
  JS_PROP(collisionBitMask);
  JS_PROP(contactTestBitMask);
  JS_PROP(joints);
  JS_PROP(node);
  JS_PROP(velocity);
  JS_PROP(angularVelocity);
JS_WRAP_CLASS_END(SKPhysicsBody);

#endif /* NSKPhysicsBody_h */
