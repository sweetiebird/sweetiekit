//
//  NSCNPhysicsHingeJoint.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsHingeJoint_h
#define NSCNPhysicsHingeJoint_h    

#include "NSCNPhysicsBehavior.h"

#define js_value_SCNPhysicsHingeJoint(x) js_value_wrapper(x, SCNPhysicsHingeJoint)
#define to_value_SCNPhysicsHingeJoint(x) to_value_wrapper(x, SCNPhysicsHingeJoint)
#define is_value_SCNPhysicsHingeJoint(x) is_value_wrapper(x, SCNPhysicsHingeJoint)

JS_WRAP_CLASS(SCNPhysicsHingeJoint, SCNPhysicsBehavior);
  JS_STATIC_METHOD(jointWithBodyAAxisAAnchorABodyBAxisBAnchorB);
  JS_STATIC_METHOD(jointWithBodyAxisAnchor);
  JS_PROP_READONLY(bodyA);
  JS_PROP(axisA);
  JS_PROP(anchorA);
  JS_PROP_READONLY(bodyB);
  JS_PROP(axisB);
  JS_PROP(anchorB);
JS_WRAP_CLASS_END(SCNPhysicsHingeJoint);

#endif /* NSCNPhysicsHingeJoint_h */
