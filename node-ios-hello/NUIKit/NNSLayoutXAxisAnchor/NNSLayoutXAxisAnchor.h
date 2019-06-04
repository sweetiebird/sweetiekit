//
//  NNSLayoutXAxisAnchor.h
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutXAxisAnchor_h
#define NNSLayoutXAxisAnchor_h    

#include "NNSLayoutAnchor.h"

#define js_value_NSLayoutXAxisAnchor(x) js_value_wrapper(x, NSLayoutXAxisAnchor)
#define to_value_NSLayoutXAxisAnchor(x) to_value_wrapper(x, NSLayoutXAxisAnchor)
#define is_value_NSLayoutXAxisAnchor(x) is_value_wrapper(x, NSLayoutXAxisAnchor)
#define js_value_NSLayoutXAxisAnchor_pointer NSLayoutXAxisAnchor
#define to_value_NSLayoutXAxisAnchor_pointer NSLayoutXAxisAnchor
#define is_value_NSLayoutXAxisAnchor_pointer NSLayoutXAxisAnchor

JS_WRAP_CLASS(NSLayoutXAxisAnchor, NSLayoutAnchor);
  JS_METHOD(anchorWithOffsetToAnchor);
  JS_METHOD(constraintEqualToSystemSpacingAfterAnchorMultiplier);
  JS_METHOD(constraintGreaterThanOrEqualToSystemSpacingAfterAnchorMultiplier);
  JS_METHOD(constraintLessThanOrEqualToSystemSpacingAfterAnchorMultiplier);
JS_WRAP_CLASS_END(NSLayoutXAxisAnchor);

#endif /* NNSLayoutXAxisAnchor_h */
