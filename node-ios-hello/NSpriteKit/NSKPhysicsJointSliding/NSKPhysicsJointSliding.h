//
//  NSKPhysicsJointSliding.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJointSliding_h
#define NSKPhysicsJointSliding_h    

#include "NSKPhysicsJoint.h"

#define js_value_SKPhysicsJointSliding(x) js_value_wrapper(x, SKPhysicsJointSliding)
#define to_value_SKPhysicsJointSliding(x) to_value_wrapper(x, SKPhysicsJointSliding)
#define is_value_SKPhysicsJointSliding(x) is_value_wrapper(x, SKPhysicsJointSliding)

JS_WRAP_CLASS(SKPhysicsJointSliding, SKPhysicsJoint);
  JS_STATIC_METHOD(jointWithBodyABodyBAnchorAxis);
  JS_PROP(shouldEnableLimits);
  JS_PROP(lowerDistanceLimit);
  JS_PROP(upperDistanceLimit);
JS_WRAP_CLASS_END(SKPhysicsJointSliding);

#endif /* NSKPhysicsJointSliding_h */
