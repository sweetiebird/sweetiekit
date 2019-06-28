//
//  NSKReachConstraints.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKReachConstraints_h
#define NSKReachConstraints_h    

#include "NNSObject.h"

#define js_value_SKReachConstraints(x) js_value_wrapper(x, SKReachConstraints)
#define to_value_SKReachConstraints(x) to_value_wrapper(x, SKReachConstraints)
#define is_value_SKReachConstraints(x) is_value_wrapper(x, SKReachConstraints)

JS_WRAP_CLASS(SKReachConstraints, NSObject);
  JS_METHOD(initWithLowerAngleLimitUpperAngleLimit);
  JS_PROP(lowerAngleLimit);
  JS_PROP(upperAngleLimit);
JS_WRAP_CLASS_END(SKReachConstraints);

#endif /* NSKReachConstraints_h */
