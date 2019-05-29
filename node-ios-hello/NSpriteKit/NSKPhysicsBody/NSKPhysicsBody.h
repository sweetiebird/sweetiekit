//
//  NSKPhysicsBody.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsBody_h
#define NSKPhysicsBody_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

#define js_value_SKPhysicsBody(x) js_value_wrapper(x, SKPhysicsBody)
#define to_value_SKPhysicsBody(x) to_value_wrapper(x, SKPhysicsBody)

class NSKPhysicsBody : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKPhysicsBody();
  virtual ~NSKPhysicsBody();

  static NAN_METHOD(New);
  static NAN_METHOD(bodyWithCircleOfRadius);
  static NAN_METHOD(bodyWithTexture);
  static NAN_METHOD(bodyWithRectangleOfSize);
  static NAN_METHOD(applyImpulse);
  static NAN_METHOD(applyTorque);
  static NAN_METHOD(applyForce);
  static NAN_METHOD(applyAngularImpulse);
  static NAN_METHOD(applyForceAtPoint);
  static NAN_METHOD(applyImpulseAtPoint);
  
  // JS_PROP(node);
  // JS_PROP(categoryBitMask);
  // JS_PROP(contactTestBitMask);
  // JS_PROP(collisionBitMask);
  JS_PROP(dynamic);
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
};

#endif /* NSKPhysicsBody_h */
