//
//  NNSAttributedString.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSAttributedString_h
#define NNSAttributedString_h    

#include "NNSObject.h"

#define js_value_NSAttributedString(x) js_value_wrapper(x, NSAttributedString)
#define to_value_NSAttributedString(x) to_value_wrapper(x, NSAttributedString)
#define is_value_NSAttributedString(x) is_value_wrapper(x, NSAttributedString)

JS_WRAP_CLASS(NSAttributedString, NSObject);
JS_WRAP_CLASS_END(NSAttributedString);

#endif /* NNSAttributedString_h */
