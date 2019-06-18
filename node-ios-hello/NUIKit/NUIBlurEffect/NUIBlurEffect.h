//
//  NUIBlurEffect.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBlurEffect_h
#define NUIBlurEffect_h    

#include "NUIVisualEffect.h"

#define js_value_UIBlurEffect(x) js_value_wrapper(x, UIBlurEffect)
#define to_value_UIBlurEffect(x) to_value_wrapper(x, UIBlurEffect)
#define is_value_UIBlurEffect(x) is_value_wrapper(x, UIBlurEffect)

#define js_value_UIBlurEffectStyle(x) JS_ENUM(UIBlurEffectStyle, NSInteger, x)
#define to_value_UIBlurEffectStyle(x) TO_ENUM(UIBlurEffectStyle, NSInteger, x)
#define is_value_UIBlurEffectStyle(x) IS_ENUM(UIBlurEffectStyle, NSInteger, x)

JS_WRAP_CLASS(UIBlurEffect, UIVisualEffect);
  JS_STATIC_METHOD(effectWithStyle);
JS_WRAP_CLASS_END(UIBlurEffect);

#endif /* NUIBlurEffect_h */
