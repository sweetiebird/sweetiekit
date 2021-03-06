//
//  NUIAlertAction.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIAlertAction_h
#define NUIAlertAction_h

#include "NNSObject.h"

#define js_value_UIAlertAction(x) js_value_wrapper(x, UIAlertAction)
#define to_value_UIAlertAction(x) to_value_wrapper(x, UIAlertAction)
#define is_value_UIAlertAction(x) is_value_wrapper(x, UIAlertAction)

#define js_value_UIAlertActionStyle(x) JS_ENUM(UIAlertActionStyle, NSInteger, x)
#define to_value_UIAlertActionStyle(x) TO_ENUM(UIAlertActionStyle, NSInteger, x)
#define is_value_UIAlertActionStyle(x) IS_ENUM(UIAlertActionStyle, NSInteger, x)

JS_WRAP_CLASS(UIAlertAction, NSObject);
  JS_STATIC_METHOD(actionWithTitleStyleHandler);
  JS_PROP_READONLY(title);
  JS_PROP_READONLY(style);
  JS_PROP(isEnabled);
JS_WRAP_CLASS_END(UIAlertAction);

#endif /* NUIAlertAction_h */
