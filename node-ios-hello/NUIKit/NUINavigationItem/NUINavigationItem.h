//
//  NUINavigationItem.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationItem_h
#define NUINavigationItem_h    

#include "NNSObject.h"

#define js_value_UINavigationItem(x) js_value_wrapper(x, UINavigationItem)
#define to_value_UINavigationItem(x) to_value_wrapper(x, UINavigationItem)
#define is_value_UINavigationItem(x) is_value_wrapper(x, UINavigationItem)

JS_WRAP_CLASS(UINavigationItem, NSObject);
  JS_METHOD(initWithTitle);
  
  JS_PROP(title);
  JS_PROP(backBarButtonItem);
  JS_PROP(titleView);
  JS_PROP(prompt);
JS_WRAP_CLASS_END(UINavigationItem);

#endif /* NUINavigationItem_h */
