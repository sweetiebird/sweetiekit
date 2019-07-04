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

#define js_value_UINavigationControllerOperation(x) JS_ENUM(UINavigationControllerOperation, NSInteger, x)
#define to_value_UINavigationControllerOperation(x) TO_ENUM(UINavigationControllerOperation, NSInteger, x)
#define is_value_UINavigationControllerOperation(x) IS_ENUM(UINavigationControllerOperation, NSInteger, x)

JS_WRAP_CLASS(UINavigationController, UIViewController);
  JS_METHOD(initWithNavigationBarClassToolbarClass);
  JS_METHOD(initWithRootViewController);
  JS_METHOD(pushViewControllerAnimated);
  JS_METHOD(popViewControllerAnimated);
  JS_METHOD(popToViewControllerAnimated);
  JS_METHOD(popToRootViewControllerAnimated);
  JS_METHOD(setViewControllersAnimated);
  JS_METHOD(setNavigationBarHiddenAnimated);
  JS_METHOD(setToolbarHiddenAnimated);
  JS_METHOD(showViewControllerSender);
  JS_PROP_READONLY(topViewController);
  JS_PROP_READONLY(visibleViewController);
  JS_PROP(viewControllers);
  JS_PROP(isNavigationBarHidden);
  JS_PROP_READONLY(navigationBar);
  JS_PROP(isToolbarHidden);
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

// UIViewController (UINavigationControllerItem)
JS_EXTEND_CLASS(UIViewController, UINavigationControllerItem);
  JS_METHOD(setToolbarItemsAnimated);
JS_EXTEND_CLASS_END(UIViewController, UINavigationControllerItem);

// UIViewController (UINavigationControllerContextualToolbarItems)
JS_EXTEND_CLASS(UIViewController, UINavigationControllerContextualToolbarItems);
  JS_PROP_READONLY(navigationItem);
  JS_PROP(hidesBottomBarWhenPushed);
  JS_PROP_READONLY(navigationController);
  JS_PROP(toolbarItems);
JS_EXTEND_CLASS_END(UIViewController, UINavigationControllerContextualToolbarItems);

#endif /* NUINavigationController_h */
