//
//  NUIPopoverPresentationControllerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverPresentationControllerDelegate_h
#define NUIPopoverPresentationControllerDelegate_h    

#include "NNSObject.h"

#define js_value_UIPopoverPresentationControllerDelegate(x) js_value_wrapper(x, UIPopoverPresentationControllerDelegate)
#define to_value_UIPopoverPresentationControllerDelegate(x) to_value_wrapper(x, UIPopoverPresentationControllerDelegate)
#define is_value_UIPopoverPresentationControllerDelegate(x) is_value_wrapper(x, UIPopoverPresentationControllerDelegate)

JS_WRAP_CLASS(UIPopoverPresentationControllerDelegate, NSObject);
  JS_PROP(adaptivePresentationStyle);

  sweetiekit::JSFunction _adaptivePresentationStyle;
JS_WRAP_CLASS_END(UIPopoverPresentationControllerDelegate);

#endif /* NUIPopoverPresentationControllerDelegate_h */
