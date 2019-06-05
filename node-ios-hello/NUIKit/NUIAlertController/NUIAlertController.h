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

JS_WRAP_CLASS(UIAlertController, UIViewController);
  JS_METHOD(AddAction);
JS_WRAP_CLASS_END(UIAlertController);

#endif /* NUIAlertController_h */
