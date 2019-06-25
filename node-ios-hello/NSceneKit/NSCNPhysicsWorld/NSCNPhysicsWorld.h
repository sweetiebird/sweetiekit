//
//  NSCNPhysicsWorld.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsWorld_h
#define NSCNPhysicsWorld_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsWorld(x) js_value_wrapper(x, SCNPhysicsWorld)
#define to_value_SCNPhysicsWorld(x) to_value_wrapper(x, SCNPhysicsWorld)
#define is_value_SCNPhysicsWorld(x) is_value_wrapper(x, SCNPhysicsWorld)

JS_WRAP_CLASS(SCNPhysicsWorld, NSObject);
  JS_METHOD(addBehavior);
  JS_METHOD(removeBehavior);
  JS_METHOD(removeAllBehaviors);
  JS_METHOD(rayTestWithSegmentFromPointToPointOptions);
  JS_METHOD(contactTestBetweenBodyAndBodyOptions);
  JS_METHOD(contactTestWithBodyOptions);
  JS_METHOD(convexSweepTestWithShapeFromTransformToTransformOptions);
  JS_METHOD(updateCollisionPairs);
  JS_PROP(gravity);
  JS_PROP(speed);
  JS_PROP(timeStep);
  JS_PROP(contactDelegate);
  JS_PROP_READONLY(allBehaviors);
JS_WRAP_CLASS_END(SCNPhysicsWorld);

#endif /* NSCNPhysicsWorld_h */
