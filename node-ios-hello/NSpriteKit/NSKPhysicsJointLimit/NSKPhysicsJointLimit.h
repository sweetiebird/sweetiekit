//
//  NSKPhysicsJointLimit.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJointLimit_h
#define NSKPhysicsJointLimit_h    

#include "NSKPhysicsJoint.h"

#define js_value_SKPhysicsJointLimit(x) js_value_wrapper(x, SKPhysicsJointLimit)
#define to_value_SKPhysicsJointLimit(x) to_value_wrapper(x, SKPhysicsJointLimit)
#define is_value_SKPhysicsJointLimit(x) is_value_wrapper(x, SKPhysicsJointLimit)

JS_WRAP_CLASS(SKPhysicsJointLimit, SKPhysicsJoint);
  JS_STATIC_METHOD(jointWithBodyABodyBAnchorAAnchorB);
  JS_PROP(maxLength);
JS_WRAP_CLASS_END(SKPhysicsJointLimit);

#endif /* NSKPhysicsJointLimit_h */
