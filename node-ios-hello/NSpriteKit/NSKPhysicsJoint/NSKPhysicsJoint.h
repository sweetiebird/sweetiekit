//
//  NSKPhysicsJoint.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJoint_h
#define NSKPhysicsJoint_h    

#include "NNSObject.h"

#define js_value_SKPhysicsJoint(x) js_value_wrapper(x, SKPhysicsJoint)
#define to_value_SKPhysicsJoint(x) to_value_wrapper(x, SKPhysicsJoint)
#define is_value_SKPhysicsJoint(x) is_value_wrapper(x, SKPhysicsJoint)

JS_WRAP_CLASS(SKPhysicsJoint, NSObject);
  JS_PROP(bodyA);
  JS_PROP(bodyB);
  JS_PROP_READONLY(reactionForce);
  JS_PROP_READONLY(reactionTorque);
JS_WRAP_CLASS_END(SKPhysicsJoint);

#endif /* NSKPhysicsJoint_h */
