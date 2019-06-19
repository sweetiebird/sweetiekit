//
//  NUIPopoverPresentationController.h
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

#define js_value_UIPopoverArrowDirection(x) JS_OPTS(UIPopoverArrowDirection, NSUInteger, x)
#define to_value_UIPopoverArrowDirection(x) TO_OPTS(UIPopoverArrowDirection, NSUInteger, x)
#define is_value_UIPopoverArrowDirection(x) IS_OPTS(UIPopoverArrowDirection, NSUInteger, x)

JS_WRAP_CLASS(UIPopoverPresentationController, UIPresentationController);
// UIPopoverPresentationController
  JS_PROP(delegate);
  JS_PROP(permittedArrowDirections);
  JS_PROP(sourceView);
  JS_PROP(sourceRect);
  JS_PROP(canOverlapSourceViewRect);
  JS_PROP(barButtonItem);
  JS_PROP_READONLY(arrowDirection);
  JS_PROP(passthroughViews);
  JS_PROP(backgroundColor);
  JS_PROP(popoverLayoutMargins);
  JS_PROP(popoverBackgroundViewClass);

JS_WRAP_CLASS_END(UIPopoverPresentationController);

#endif /* NUIPopoverPresentationController_h */
