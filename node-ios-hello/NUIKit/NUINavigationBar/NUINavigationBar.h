//
//  NUINavigationBar.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationBar_h
#define NUINavigationBar_h    

#include "NUIView.h"

#define js_value_UINavigationBar(x) js_value_wrapper(x, UINavigationBar)
#define to_value_UINavigationBar(x) to_value_wrapper(x, UINavigationBar)
#define is_value_UINavigationBar(x) is_value_wrapper(x, UINavigationBar)

JS_WRAP_CLASS(UINavigationBar, UIView);
  JS_METHOD(setBackgroundImageForBarMetrics);
  JS_PROP(barStyle);
  JS_PROP(backItem);
  JS_PROP(barTintColor);
  JS_PROP(tintColor);
  JS_PROP(shadowImage);
//  JS_PROP(isTranslucent);
JS_WRAP_CLASS_END(UINavigationBar);

#endif /* NUINavigationBar_h */
