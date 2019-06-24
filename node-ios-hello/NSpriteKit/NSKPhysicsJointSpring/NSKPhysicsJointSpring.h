//
//  NSKPhysicsJointSpring.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJointSpring_h
#define NSKPhysicsJointSpring_h    

#include "NSKPhysicsJoint.h"

#define js_value_SKPhysicsJointSpring(x) js_value_wrapper(x, SKPhysicsJointSpring)
#define to_value_SKPhysicsJointSpring(x) to_value_wrapper(x, SKPhysicsJointSpring)
#define is_value_SKPhysicsJointSpring(x) is_value_wrapper(x, SKPhysicsJointSpring)

JS_WRAP_CLASS(SKPhysicsJointSpring, SKPhysicsJoint);
  JS_STATIC_METHOD(jointWithBodyABodyBAnchorAAnchorB);
  JS_PROP(damping);
  JS_PROP(frequency);
JS_WRAP_CLASS_END(SKPhysicsJointSpring);

#endif /* NSKPhysicsJointSpring_h */
