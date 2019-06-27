//
//  NSCNPhysicsField.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNPhysicsField_h
#define NSCNPhysicsField_h    

#include "NNSObject.h"

#define js_value_SCNPhysicsField(x) js_value_wrapper(x, SCNPhysicsField)
#define to_value_SCNPhysicsField(x) to_value_wrapper(x, SCNPhysicsField)
#define is_value_SCNPhysicsField(x) is_value_wrapper(x, SCNPhysicsField)

#define js_value_SCNPhysicsFieldScope(x) JS_ENUM(SCNPhysicsFieldScope, NSInteger, x)
#define to_value_SCNPhysicsFieldScope(x) TO_ENUM(SCNPhysicsFieldScope, NSInteger, x)
#define is_value_SCNPhysicsFieldScope(x) IS_ENUM(SCNPhysicsFieldScope, NSInteger, x)

JS_WRAP_CLASS(SCNPhysicsField, NSObject);
  JS_STATIC_METHOD(dragField);
  JS_STATIC_METHOD(vortexField);
  JS_STATIC_METHOD(radialGravityField);
  JS_STATIC_METHOD(linearGravityField);
  JS_STATIC_METHOD(noiseFieldWithSmoothnessAnimationSpeed);
  JS_STATIC_METHOD(turbulenceFieldWithSmoothnessAnimationSpeed);
  JS_STATIC_METHOD(springField);
  JS_STATIC_METHOD(electricField);
  JS_STATIC_METHOD(magneticField);
  JS_STATIC_METHOD(customFieldWithEvaluationBlock);
  JS_PROP(strength);
  JS_PROP(falloffExponent);
  JS_PROP(minimumDistance);
  JS_PROP(isActive);
  JS_PROP(isExclusive);
  JS_PROP(halfExtent);
  JS_PROP(usesEllipsoidalExtent);
  JS_PROP(scope);
  JS_PROP(offset);
  JS_PROP(direction);
  JS_PROP(categoryBitMask);
JS_WRAP_CLASS_END(SCNPhysicsField);

#endif /* NSCNPhysicsField_h */
