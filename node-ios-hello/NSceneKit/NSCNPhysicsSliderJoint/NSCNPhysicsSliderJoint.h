//
//  NSCNPhysicsSliderJoint.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsSliderJoint_h
#define NSCNPhysicsSliderJoint_h    

#include "NSCNPhysicsBehavior.h"

#define js_value_SCNPhysicsSliderJoint(x) js_value_wrapper(x, SCNPhysicsSliderJoint)
#define to_value_SCNPhysicsSliderJoint(x) to_value_wrapper(x, SCNPhysicsSliderJoint)
#define is_value_SCNPhysicsSliderJoint(x) is_value_wrapper(x, SCNPhysicsSliderJoint)

JS_WRAP_CLASS(SCNPhysicsSliderJoint, SCNPhysicsBehavior);
  JS_STATIC_METHOD(jointWithBodyAAxisAAnchorABodyBAxisBAnchorB);
  JS_STATIC_METHOD(jointWithBodyAxisAnchor);
  JS_PROP_READONLY(bodyA);
  JS_PROP(axisA);
  JS_PROP(anchorA);
  JS_PROP_READONLY(bodyB);
  JS_PROP(axisB);
  JS_PROP(anchorB);
  JS_PROP(minimumLinearLimit);
  JS_PROP(maximumLinearLimit);
  JS_PROP(minimumAngularLimit);
  JS_PROP(maximumAngularLimit);
  JS_PROP(motorTargetLinearVelocity);
  JS_PROP(motorMaximumForce);
  JS_PROP(motorTargetAngularVelocity);
  JS_PROP(motorMaximumTorque);
JS_WRAP_CLASS_END(SCNPhysicsSliderJoint);

#endif /* NSCNPhysicsSliderJoint_h */
