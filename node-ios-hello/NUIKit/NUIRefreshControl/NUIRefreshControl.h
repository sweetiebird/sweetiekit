//
//  NUIRefreshControl.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIRefreshControl_h
#define NUIRefreshControl_h

#include "NUIControl.h"

#define js_value_UIRefreshControl(x) js_value_wrapper(x, UIRefreshControl)
#define to_value_UIRefreshControl(x) to_value_wrapper(x, UIRefreshControl)
#define is_value_UIRefreshControl(x) is_value_wrapper(x, UIRefreshControl)

JS_WRAP_CLASS(UIRefreshControl, UIControl);
  JS_METHOD(Alloc);
  JS_METHOD(AddTargetFor);
  JS_METHOD(EndRefreshing);
JS_WRAP_CLASS_END(UIRefreshControl);

#endif /* NUIRefreshControl_h */
