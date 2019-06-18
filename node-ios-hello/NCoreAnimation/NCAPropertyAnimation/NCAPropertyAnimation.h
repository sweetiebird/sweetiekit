//
//  NCAPropertyAnimation.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAPropertyAnimation_h
#define NCAPropertyAnimation_h    

#include "NCAAnimation.h"

#define js_value_CAPropertyAnimation(x) js_value_wrapper(x, CAPropertyAnimation)
#define to_value_CAPropertyAnimation(x) to_value_wrapper(x, CAPropertyAnimation)
#define is_value_CAPropertyAnimation(x) is_value_wrapper(x, CAPropertyAnimation)

JS_WRAP_CLASS(CAPropertyAnimation, CAAnimation);
  JS_STATIC_METHOD(animationWithKeyPath);
  JS_PROP(keyPath);
  JS_PROP(isAdditive);
  JS_PROP(isCumulative);
  JS_PROP(valueFunction);
JS_WRAP_CLASS_END(CAPropertyAnimation);

#endif /* NCAPropertyAnimation_h */
