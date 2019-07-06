//
//  NUIAlertController.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIAlertController_h
#define NUIAlertController_h

#include "NUIViewController.h"

#define js_value_UIAlertController(x) js_value_wrapper(x, UIAlertController)
#define to_value_UIAlertController(x) to_value_wrapper(x, UIAlertController)
#define is_value_UIAlertController(x) is_value_wrapper(x, UIAlertController)

#define js_value_UIAlertControllerStyle(x) JS_ENUM(UIAlertControllerStyle, NSInteger, x)
#define to_value_UIAlertControllerStyle(x) TO_ENUM(UIAlertControllerStyle, NSInteger, x)
#define is_value_UIAlertControllerStyle(x) IS_ENUM(UIAlertControllerStyle, NSInteger, x)

JS_WRAP_CLASS(UIAlertController, UIViewController);
  JS_STATIC_METHOD(alertControllerWithTitleMessagePreferredStyle);
  JS_METHOD(addAction);
  JS_METHOD(addTextFieldWithConfigurationHandler);
  JS_PROP_READONLY(actions);
  JS_PROP(preferredAction);
  JS_PROP_READONLY(textFields);
  JS_PROP(title);
  JS_PROP(message);
  JS_PROP_READONLY(preferredStyle);
JS_WRAP_CLASS_END(UIAlertController);

#endif /* NUIAlertController_h */
