//
//  NNSLayoutDimension.h
//
//  Created by Shawn Presser on 6/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutDimension_h
#define NNSLayoutDimension_h    

#include "NNSLayoutAnchor.h"

#define js_value_NSLayoutDimension(x) js_value_wrapper(x, NSLayoutDimension)
#define to_value_NSLayoutDimension(x) to_value_wrapper(x, NSLayoutDimension)
#define is_value_NSLayoutDimension(x) is_value_wrapper(x, NSLayoutDimension)

JS_WRAP_CLASS(NSLayoutDimension, NSLayoutAnchor);
  JS_METHOD(constraintEqualToConstant);
  JS_METHOD(constraintGreaterThanOrEqualToConstant);
  JS_METHOD(constraintLessThanOrEqualToConstant);
  JS_METHOD(constraintEqualToAnchorMultiplier);
  JS_METHOD(constraintGreaterThanOrEqualToAnchorMultiplier);
  JS_METHOD(constraintLessThanOrEqualToAnchorMultiplier);
  JS_METHOD(constraintEqualToAnchorMultiplierConstant);
  JS_METHOD(constraintGreaterThanOrEqualToAnchorMultiplierConstant);
  JS_METHOD(constraintLessThanOrEqualToAnchorMultiplierConstant);
JS_WRAP_CLASS_END(NSLayoutDimension);

#endif /* NNSLayoutDimension_h */
