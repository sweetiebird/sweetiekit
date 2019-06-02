//
//  NUIImagePickerController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerController_h
#define NUIImagePickerController_h

#include "NUINavigationController.h"

#define js_value_UIImagePickerController(x) js_value_wrapper(x, UIImagePickerController)
#define to_value_UIImagePickerController(x) to_value_wrapper(x, UIImagePickerController)
#define is_value_UIImagePickerController(x) is_value_wrapper(x, UIImagePickerController)

JS_WRAP_CLASS(UIImagePickerController, UINavigationController);
  JS_PROP(delegate);
JS_WRAP_CLASS_END(UIImagePickerController);

#endif /* NUIImagePickerController_h */
