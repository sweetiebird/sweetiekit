//
//  NUIStoryboard.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStoryboard_h
#define NUIStoryboard_h

#include "NNSObject.h"

#define js_value_UIStoryboard(x) js_value_wrapper(x, UIStoryboard)
#define to_value_UIStoryboard(x) to_value_wrapper(x, UIStoryboard)
#define is_value_UIStoryboard(x) is_value_wrapper(x, UIStoryboard)

JS_WRAP_CLASS(UIStoryboard, NSObject);
  JS_METHOD(instantiateViewController);
JS_WRAP_CLASS_END(UIStoryboard);

#endif /* NUIStoryboard_h */
