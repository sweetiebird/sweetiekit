//
//  NCATransition.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCATransition_h
#define NCATransition_h    

#include "NCAAnimation.h"

#define js_value_CATransition(x) js_value_wrapper(x, CATransition)
#define to_value_CATransition(x) to_value_wrapper(x, CATransition)
#define is_value_CATransition(x) is_value_wrapper(x, CATransition)

JS_WRAP_CLASS(CATransition, CAAnimation);
  JS_PROP(type);
  JS_PROP(subtype);
  JS_PROP(startProgress);
  JS_PROP(endProgress);
JS_WRAP_CLASS_END(CATransition);

#endif /* NCATransition_h */
