//
//  NCASpringAnimation.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCASpringAnimation_h
#define NCASpringAnimation_h    

#include "NCABasicAnimation.h"

#define js_value_CASpringAnimation(x) js_value_wrapper(x, CASpringAnimation)
#define to_value_CASpringAnimation(x) to_value_wrapper(x, CASpringAnimation)
#define is_value_CASpringAnimation(x) is_value_wrapper(x, CASpringAnimation)

JS_WRAP_CLASS(CASpringAnimation, CABasicAnimation);
  JS_PROP(mass);
  JS_PROP(stiffness);
  JS_PROP(damping);
  JS_PROP(initialVelocity);
  JS_PROP_READONLY(settlingDuration);
JS_WRAP_CLASS_END(CASpringAnimation);

#endif /* NCASpringAnimation_h */
