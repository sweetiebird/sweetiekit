//
//  NUIFont.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFont_h
#define NUIFont_h    

#include "NNSObject.h"

#define js_value_UIFont(x) js_value_wrapper(x, UIFont)
#define to_value_UIFont(x) to_value_wrapper(x, UIFont)
#define is_value_UIFont(x) is_value_wrapper(x, UIFont)

JS_WRAP_CLASS(UIFont, NSObject);
  JS_METHOD(systemFont);
  JS_METHOD(boldSystemFont);
  JS_METHOD(italicSystemFont);
JS_WRAP_CLASS_END(UIFont);

#endif /* NUIFont_h */
