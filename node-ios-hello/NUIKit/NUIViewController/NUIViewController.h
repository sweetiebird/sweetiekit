//
//  NUIViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#include "NUIResponder.h"

// UIKit enums
#define js_value_UIModalPresentationStyle(x) JS_ENUM(UIModalPresentationStyle, NSInteger, x)
#define to_value_UIModalPresentationStyle(x) TO_ENUM(UIModalPresentationStyle, NSInteger, x)
#define is_value_UIModalPresentationStyle(x) IS_ENUM(UIModalPresentationStyle, NSInteger, x)

#define js_value_UIViewController(x) js_value_wrapper(x, UIViewController)
#define to_value_UIViewController(x) to_value_wrapper(x, UIViewController)
#define is_value_UIViewController(x) is_value_wrapper(x, UIViewController)

JS_WRAP_CLASS(UIViewController, UIResponder);
  JS_PROP(View);
  JS_METHOD(PresentViewController);
  JS_METHOD(DismissViewController);
  JS_PROP(TransitioningDelegate);
  JS_PROP(ModalPresentationStyle);
  JS_PROP(ToolbarItems);
  JS_PROP(TabBarItem);
  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
  JS_PROP(navigationController);
  JS_PROP(navigationItem);
  JS_PROP(modalPresentationStyle);
  JS_PROP(popoverPresentationController);
  JS_PROP(preferredContentSize);
JS_WRAP_CLASS_END(UIViewController);

#endif /* NUIViewController_h */
