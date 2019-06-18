//
//  NCAKeyframeAnimation.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAKeyframeAnimation_h
#define NCAKeyframeAnimation_h    

#include "NCAPropertyAnimation.h"

#define js_value_CAKeyframeAnimation(x) js_value_wrapper(x, CAKeyframeAnimation)
#define to_value_CAKeyframeAnimation(x) to_value_wrapper(x, CAKeyframeAnimation)
#define is_value_CAKeyframeAnimation(x) is_value_wrapper(x, CAKeyframeAnimation)

JS_WRAP_CLASS(CAKeyframeAnimation, CAPropertyAnimation);
  JS_PROP(values);
  JS_PROP(path);
  JS_PROP(keyTimes);
  JS_PROP(timingFunctions);
  JS_PROP(calculationMode);
  JS_PROP(tensionValues);
  JS_PROP(continuityValues);
  JS_PROP(biasValues);
  JS_PROP(rotationMode);
JS_WRAP_CLASS_END(CAKeyframeAnimation);

#endif /* NCAKeyframeAnimation_h */
