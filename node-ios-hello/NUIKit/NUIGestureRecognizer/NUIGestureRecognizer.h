//
//  NUIGestureRecognizer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIGestureRecognizer_h
#define NUIGestureRecognizer_h    

#include "NNSObject.h"

#define js_value_UIGestureRecognizer(x) js_value_wrapper(x, UIGestureRecognizer)
#define to_value_UIGestureRecognizer(x) to_value_wrapper(x, UIGestureRecognizer)
#define is_value_UIGestureRecognizer(x) is_value_wrapper(x, UIGestureRecognizer)

JS_WRAP_CLASS(UIGestureRecognizer, NSObject);
  JS_METHOD(addTarget);
JS_WRAP_CLASS_END(UIGestureRecognizer);

#endif /* NUIGestureRecognizer_h */
