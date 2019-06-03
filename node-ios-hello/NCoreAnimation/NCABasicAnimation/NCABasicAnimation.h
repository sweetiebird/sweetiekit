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

JS_WRAP_CLASS(CABasicAnimation, NSObject);
  JS_PROP(fromValue);
  JS_PROP(toValue);
  JS_PROP(duration);
JS_WRAP_CLASS_END(CABasicAnimation);

#endif /* NCABasicAnimation_h */
