//
//  NUIRefreshControl.h
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
  JS_METHOD(init);
  JS_METHOD(beginRefreshing);
  JS_METHOD(endRefreshing);
  JS_PROP_READONLY(isRefreshing);
  JS_PROP(tintColor);
  JS_PROP(attributedTitle);
JS_WRAP_CLASS_END(UIRefreshControl);

#endif /* NUIRefreshControl_h */
