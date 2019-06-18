//
//  NCABasicAnimation.h
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCABasicAnimation_h
#define NCABasicAnimation_h

#include "NNSObject.h"

#define js_value_CABasicAnimation(x) js_value_wrapper(x, CABasicAnimation)
#define to_value_CABasicAnimation(x) to_value_wrapper(x, CABasicAnimation)
#define is_value_CABasicAnimation(x) is_value_wrapper(x, CABasicAnimation)

#define js_value_CAAnimationCalculationMode(x) JS_ENUM(CAAnimationCalculationMode, NSString, x)
#define to_value_CAAnimationCalculationMode(x) TO_ENUM(CAAnimationCalculationMode, NSString, x)
#define is_value_CAAnimationCalculationMode(x) IS_ENUM(CAAnimationCalculationMode, NSString, x)

#define js_value_CAAnimationRotationMode(x) JS_ENUM(CAAnimationRotationMode, NSString, x)
#define to_value_CAAnimationRotationMode(x) TO_ENUM(CAAnimationRotationMode, NSString, x)
#define is_value_CAAnimationRotationMode(x) IS_ENUM(CAAnimationRotationMode, NSString, x)

#define js_value_CATransitionType(x) JS_ENUM(CATransitionType, NSString, x)
#define to_value_CATransitionType(x) TO_ENUM(CATransitionType, NSString, x)
#define is_value_CATransitionType(x) IS_ENUM(CATransitionType, NSString, x)

#define js_value_CATransitionSubtype(x) JS_ENUM(CATransitionSubtype, NSString, x)
#define to_value_CATransitionSubtype(x) TO_ENUM(CATransitionSubtype, NSString, x)
#define is_value_CATransitionSubtype(x) IS_ENUM(CATransitionSubtype, NSString, x)

JS_WRAP_CLASS(CABasicAnimation, NSObject);
  JS_PROP(fromValue);
  JS_PROP(toValue);
  JS_PROP(duration);
JS_WRAP_CLASS_END(CABasicAnimation);

#endif /* NCABasicAnimation_h */
