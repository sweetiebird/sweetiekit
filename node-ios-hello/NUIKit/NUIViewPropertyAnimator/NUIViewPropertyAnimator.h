//
//  NUIViewPropertyAnimator.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewPropertyAnimator_h
#define NUIViewPropertyAnimator_h    

#include "NUIViewImplicitlyAnimating.h"

#define js_value_UIViewPropertyAnimator(x) js_value_wrapper(x, UIViewPropertyAnimator)
#define to_value_UIViewPropertyAnimator(x) to_value_wrapper(x, UIViewPropertyAnimator)
#define is_value_UIViewPropertyAnimator(x) is_value_wrapper(x, UIViewPropertyAnimator)

JS_WRAP_CLASS(UIViewPropertyAnimator, UIViewImplicitlyAnimating);
  JS_STATIC_METHOD(runningPropertyAnimatorWithDurationDelayOptionsAnimationsCompletion);
  JS_METHOD(initWithDurationTimingParameters);
  JS_METHOD(initWithDurationCurveAnimations);
  JS_METHOD(initWithDurationControlPoint1_controlPoint2_animations);
  JS_METHOD(initWithDurationDampingRatioAnimations);
  JS_METHOD(addAnimationsDelayFactor);
  JS_METHOD(addAnimations);
  JS_METHOD(addCompletion);
  JS_METHOD(continueAnimationWithTimingParametersDurationFactor);
  JS_PROP_READONLY(timingParameters);
  JS_PROP_READONLY(duration);
  JS_PROP_READONLY(delay);
  JS_PROP(isUserInteractionEnabled);
  JS_PROP(isManualHitTestingEnabled);
  JS_PROP(isInterruptible);
  JS_PROP(scrubsLinearly);
  JS_PROP(pausesOnCompletion);
JS_WRAP_CLASS_END(UIViewPropertyAnimator);

#endif /* NUIViewPropertyAnimator_h */
