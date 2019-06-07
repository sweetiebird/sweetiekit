//
//  NUINavigationController.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationController_h
#define NUINavigationController_h

#include "NUIViewController.h"

#define js_value_UINavigationController(x) js_value_wrapper(x, UINavigationController)
#define to_value_UINavigationController(x) to_value_wrapper(x, UINavigationController)
#define is_value_UINavigationController(x) is_value_wrapper(x, UINavigationController)

JS_WRAP_CLASS(UINavigationController, UIViewController);
  JS_METHOD(SetViewControllers);
  JS_METHOD(PushViewController);
  JS_METHOD(PopViewController);
  JS_METHOD(PopToRootViewController);
  JS_METHOD(PopToViewController);
  
  JS_PROP_READONLY(topViewController);
  JS_PROP_READONLY(visibleViewController);
  JS_PROP(viewControllers);
  JS_PROP(navigationBarHidden);
  JS_PROP_READONLY(navigationBar);
  JS_PROP(toolbarHidden);
  JS_PROP_READONLY(toolbar);
  JS_PROP(delegate);
  JS_PROP_READONLY(interactivePopGestureRecognizer);
  JS_PROP(hidesBarsWhenKeyboardAppears);
  JS_PROP(hidesBarsOnSwipe);
  JS_PROP_READONLY(barHideOnSwipeGestureRecognizer);
  JS_PROP(hidesBarsWhenVerticallyCompact);
  JS_PROP(hidesBarsOnTap);
  JS_PROP_READONLY(barHideOnTapGestureRecognizer);

JS_WRAP_CLASS_END(UINavigationController);

#endif /* NUINavigationController_h */
