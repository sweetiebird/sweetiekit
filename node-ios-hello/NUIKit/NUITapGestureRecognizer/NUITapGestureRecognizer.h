//
//  NUITapGestureRecognizer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITapGestureRecognizer_h
#define NUITapGestureRecognizer_h    

#include "NUIGestureRecognizer.h"

#define js_value_UITapGestureRecognizer(x) js_value_wrapper(x, UITapGestureRecognizer)
#define to_value_UITapGestureRecognizer(x) to_value_wrapper(x, UITapGestureRecognizer)
#define is_value_UITapGestureRecognizer(x) is_value_wrapper(x, UITapGestureRecognizer)

JS_WRAP_CLASS(UITapGestureRecognizer, UIGestureRecognizer);
JS_WRAP_CLASS_END(UITapGestureRecognizer);

#endif /* NUITapGestureRecognizer_h */
