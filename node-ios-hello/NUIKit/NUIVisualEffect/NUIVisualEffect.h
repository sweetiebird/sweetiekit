//
//  NUIVisualEffect.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIVisualEffect_h
#define NUIVisualEffect_h    

#include "NNSObject.h"

#define js_value_UIVisualEffect(x) js_value_wrapper(x, UIVisualEffect)
#define to_value_UIVisualEffect(x) to_value_wrapper(x, UIVisualEffect)
#define is_value_UIVisualEffect(x) is_value_wrapper(x, UIVisualEffect)

JS_WRAP_CLASS(UIVisualEffect, NSObject);
JS_WRAP_CLASS_END(UIVisualEffect);

#endif /* NUIVisualEffect_h */