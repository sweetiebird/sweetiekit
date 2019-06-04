//
//  NNSLayoutYAxisAnchor.h
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutYAxisAnchor_h
#define NNSLayoutYAxisAnchor_h    

#include "NNSLayoutAnchor.h"

#define js_value_NSLayoutYAxisAnchor(x) js_value_wrapper(x, NSLayoutYAxisAnchor)
#define to_value_NSLayoutYAxisAnchor(x) to_value_wrapper(x, NSLayoutYAxisAnchor)
#define is_value_NSLayoutYAxisAnchor(x) is_value_wrapper(x, NSLayoutYAxisAnchor)

JS_WRAP_CLASS(NSLayoutYAxisAnchor, NSLayoutAnchor);
  JS_METHOD(anchorWithOffsetToAnchor);
  JS_METHOD(constraintEqualToSystemSpacingBelowAnchorMultiplier);
  JS_METHOD(constraintGreaterThanOrEqualToSystemSpacingBelowAnchorMultiplier);
  JS_METHOD(constraintLessThanOrEqualToSystemSpacingBelowAnchorMultiplier);
JS_WRAP_CLASS_END(NSLayoutYAxisAnchor);

#endif /* NNSLayoutYAxisAnchor_h */
