//
//  NSCNPhysicsBallSocketJoint.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsBallSocketJoint_h
#define NSCNPhysicsBallSocketJoint_h    

#include "NSCNPhysicsBehavior.h"

#define js_value_SCNPhysicsBallSocketJoint(x) js_value_wrapper(x, SCNPhysicsBallSocketJoint)
#define to_value_SCNPhysicsBallSocketJoint(x) to_value_wrapper(x, SCNPhysicsBallSocketJoint)
#define is_value_SCNPhysicsBallSocketJoint(x) is_value_wrapper(x, SCNPhysicsBallSocketJoint)

JS_WRAP_CLASS(SCNPhysicsBallSocketJoint, SCNPhysicsBehavior);
  JS_STATIC_METHOD(jointWithBodyAAnchorABodyBAnchorB);
  JS_STATIC_METHOD(jointWithBodyAnchor);
  JS_PROP_READONLY(bodyA);
  JS_PROP(anchorA);
  JS_PROP_READONLY(bodyB);
  JS_PROP(anchorB);
JS_WRAP_CLASS_END(SCNPhysicsBallSocketJoint);

#endif /* NSCNPhysicsBallSocketJoint_h */
