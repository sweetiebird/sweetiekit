//
//  NUIMotionEffect.h
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIMotionEffect_h
#define NUIMotionEffect_h    

#include "NNSObject.h"

#define js_value_UIMotionEffect(x) js_value_wrapper(x, UIMotionEffect)
#define to_value_UIMotionEffect(x) to_value_wrapper(x, UIMotionEffect)
#define is_value_UIMotionEffect(x) is_value_wrapper(x, UIMotionEffect)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(UIMotionEffect, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(UIMotionEffect);

#endif /* NUIMotionEffect_h */