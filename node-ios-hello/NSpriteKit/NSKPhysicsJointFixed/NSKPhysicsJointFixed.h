//
//  NSKPhysicsJointFixed.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJointFixed_h
#define NSKPhysicsJointFixed_h    

#include "NSKPhysicsJoint.h"

#define js_value_SKPhysicsJointFixed(x) js_value_wrapper(x, SKPhysicsJointFixed)
#define to_value_SKPhysicsJointFixed(x) to_value_wrapper(x, SKPhysicsJointFixed)
#define is_value_SKPhysicsJointFixed(x) is_value_wrapper(x, SKPhysicsJointFixed)

JS_WRAP_CLASS(SKPhysicsJointFixed, SKPhysicsJoint);
  JS_STATIC_METHOD(jointWithBodyABodyBAnchor);
JS_WRAP_CLASS_END(SKPhysicsJointFixed);

#endif /* NSKPhysicsJointFixed_h */
