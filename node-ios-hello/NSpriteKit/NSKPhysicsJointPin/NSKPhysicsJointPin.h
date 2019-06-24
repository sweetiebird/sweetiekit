//
//  NSKPhysicsJointPin.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsJointPin_h
#define NSKPhysicsJointPin_h    

#include "NSKPhysicsJoint.h"

#define js_value_SKPhysicsJointPin(x) js_value_wrapper(x, SKPhysicsJointPin)
#define to_value_SKPhysicsJointPin(x) to_value_wrapper(x, SKPhysicsJointPin)
#define is_value_SKPhysicsJointPin(x) is_value_wrapper(x, SKPhysicsJointPin)

JS_WRAP_CLASS(SKPhysicsJointPin, SKPhysicsJoint);
  JS_STATIC_METHOD(jointWithBodyABodyBAnchor);
  JS_PROP(shouldEnableLimits);
  JS_PROP(lowerAngleLimit);
  JS_PROP(upperAngleLimit);
  JS_PROP(frictionTorque);
  JS_PROP(rotationSpeed);
JS_WRAP_CLASS_END(SKPhysicsJointPin);

#endif /* NSKPhysicsJointPin_h */
