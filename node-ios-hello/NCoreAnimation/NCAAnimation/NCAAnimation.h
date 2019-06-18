//
//  NCAAnimation.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAAnimation_h
#define NCAAnimation_h    

#include "NNSObject.h"

#define js_value_CAAnimation(x) js_value_wrapper(x, CAAnimation)
#define to_value_CAAnimation(x) to_value_wrapper(x, CAAnimation)
#define is_value_CAAnimation(x) is_value_wrapper(x, CAAnimation)

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

JS_WRAP_CLASS(CAAnimation, NSObject);
  JS_STATIC_METHOD(animation);
  JS_STATIC_METHOD(defaultValueForKey);
  JS_METHOD(shouldArchiveValueForKey);
#if TODO
// CAAnimationDelegate
  JS_METHOD(animationDidStart);
  JS_METHOD(animationDidStopFinished);
#endif
// CAAnimation
  JS_PROP(timingFunction);
  JS_PROP(delegate);
  JS_PROP(isRemovedOnCompletion);
  
// global functions
  JS_METHOD(CACurrentMediaTime);
JS_WRAP_CLASS_END(CAAnimation);

#endif /* NCAAnimation_h */
