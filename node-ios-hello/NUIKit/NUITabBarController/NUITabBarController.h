//
//  NUITabBarController.h
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
  JS_METHOD(setViewControllersAnimated);
  JS_PROP(viewControllers);
  JS_PROP(selectedViewController);
  JS_PROP(selectedIndex);
  JS_PROP_READONLY(moreNavigationController);
  JS_PROP(customizableViewControllers);
  JS_PROP_READONLY(tabBar);
  JS_PROP(delegate);
JS_WRAP_CLASS_END(UITabBarController);


// UIViewController (UITabBarControllerItem)
JS_EXTEND_CLASS(UIViewController, UITabBarControllerItem);
  JS_PROP(tabBarItem);
  JS_PROP(tabBarController);
JS_EXTEND_CLASS_END(UIViewController, UITabBarControllerItem);

#endif /* NUITabBarController_h */
