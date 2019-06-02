//
//  NNSMutableAttributedString.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSMutableAttributedString_h
#define NNSMutableAttributedString_h    

#include "NNSAttributedString.h"

#define js_value_NSMutableAttributedString(x) js_value_wrapper(x, NSMutableAttributedString)
#define to_value_NSMutableAttributedString(x) to_value_wrapper(x, NSMutableAttributedString)
#define is_value_NSMutableAttributedString(x) is_value_wrapper(x, NSMutableAttributedString)

JS_WRAP_CLASS(NSMutableAttributedString, NSAttributedString);
  JS_METHOD(addAttribute);
JS_WRAP_CLASS_END(NSMutableAttributedString);

#endif /* NNSMutableAttributedString_h */
