//
//  NUIPopoverPresentationController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverPresentationController_h
#define NUIPopoverPresentationController_h    

#include "NUIPresentationController.h"

#define js_value_UIPopoverPresentationController(x) js_value_wrapper(x, UIPopoverPresentationController)
#define to_value_UIPopoverPresentationController(x) to_value_wrapper(x, UIPopoverPresentationController)
#define is_value_UIPopoverPresentationController(x) is_value_wrapper(x, UIPopoverPresentationController)

JS_WRAP_CLASS(UIPopoverPresentationController, UIPresentationController);
  JS_PROP(permittedArrowDirections);
  JS_PROP(sourceView);
  JS_PROP(sourceRect);
JS_WRAP_CLASS_END(UIPopoverPresentationController);

#endif /* NUIPopoverPresentationController_h */
