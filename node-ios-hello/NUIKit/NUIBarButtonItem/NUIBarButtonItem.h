//
//  NUIToolbar.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIToolbar_h
#define NUIToolbar_h

#include "NNSObject.h"

#define js_value_UIBarButtonItem(x) js_value_wrapper(x, UIBarButtonItem)
#define to_value_UIBarButtonItem(x) to_value_wrapper(x, UIBarButtonItem)
#define is_value_UIBarButtonItem(x) is_value_wrapper(x, UIBarButtonItem)

JS_WRAP_CLASS(UIBarButtonItem, NSObject);
  JS_PROP(title);
  sweetiekit::JSFunction _callback;
JS_WRAP_CLASS_END(UIBarButtonItem);

#endif /* NUIToolbar_h */
