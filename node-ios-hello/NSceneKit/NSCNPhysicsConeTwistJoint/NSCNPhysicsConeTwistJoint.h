//
//  NSCNPhysicsConeTwistJoint.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsConeTwistJoint_h
#define NSCNPhysicsConeTwistJoint_h    

#include "NSCNPhysicsBehavior.h"

#define js_value_SCNPhysicsConeTwistJoint(x) js_value_wrapper(x, SCNPhysicsConeTwistJoint)
#define to_value_SCNPhysicsConeTwistJoint(x) to_value_wrapper(x, SCNPhysicsConeTwistJoint)
#define is_value_SCNPhysicsConeTwistJoint(x) is_value_wrapper(x, SCNPhysicsConeTwistJoint)

JS_WRAP_CLASS(SCNPhysicsConeTwistJoint, SCNPhysicsBehavior);
  JS_STATIC_METHOD(jointWithBodyAFrameABodyBFrameB);
  JS_STATIC_METHOD(jointWithBodyFrame);
  JS_PROP_READONLY(bodyA);
  JS_PROP(frameA);
  JS_PROP_READONLY(bodyB);
  JS_PROP(frameB);
  JS_PROP(maximumAngularLimit1);
  JS_PROP(maximumAngularLimit2);
  JS_PROP(maximumTwistAngle);
JS_WRAP_CLASS_END(SCNPhysicsConeTwistJoint);

#endif /* NSCNPhysicsConeTwistJoint_h */
