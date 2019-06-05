//
//  NUITabBar.h
//
//  Created by Emily Kolar on 2019-5-20.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBar_h
#define NUITabBar_h   

#include "NUIView.h"

#define js_value_UITabBar(x) js_value_wrapper(x, UITabBar)
#define to_value_UITabBar(x) to_value_wrapper(x, UITabBar)
#define is_value_UITabBar(x) is_value_wrapper(x, UITabBar)

JS_WRAP_CLASS(UITabBar, UIView);
  JS_METHOD(SetViews);
  JS_PROP(tabBar);
  JS_PROP(barTintColor);
  JS_PROP(tintColor);
  JS_PROP(unselectedItemTintColor);
JS_WRAP_CLASS_END(UITabBar);

#endif /* NUITabBar_h */
