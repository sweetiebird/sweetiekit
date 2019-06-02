//
//  NUITabBarController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarController_h
#define NUITabBarController_h

#include "NUIViewController.h"

#define js_value_UITabBarController(x) js_value_wrapper(x, UITabBarController)
#define to_value_UITabBarController(x) to_value_wrapper(x, UITabBarController)
#define is_value_UITabBarController(x) is_value_wrapper(x, UITabBarController)

JS_WRAP_CLASS(UITabBarController, UIViewController);
  JS_METHOD(setViewControllers);
  JS_PROP(tabBar);
JS_WRAP_CLASS_END(UITabBarController);

#endif /* NUITabBarController_h */
