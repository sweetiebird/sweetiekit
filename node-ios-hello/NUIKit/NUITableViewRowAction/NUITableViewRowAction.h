//
//  NUITableViewRowAction.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewRowAction_h
#define NUITableViewRowAction_h    

#include "NNSObject.h"

#define js_value_UITableViewRowAction(x) js_value_wrapper(x, UITableViewRowAction)
#define to_value_UITableViewRowAction(x) to_value_wrapper(x, UITableViewRowAction)
#define is_value_UITableViewRowAction(x) is_value_wrapper(x, UITableViewRowAction)

JS_WRAP_CLASS(UITableViewRowAction, NSObject);
  JS_STATIC_METHOD(rowActionWithStyleTitleHandler);
  JS_PROP_READONLY(style);
  JS_PROP(title);
  JS_PROP(backgroundColor);
  JS_PROP(backgroundEffect);
JS_WRAP_CLASS_END(UITableViewRowAction);

#endif /* NUITableViewRowAction_h */
