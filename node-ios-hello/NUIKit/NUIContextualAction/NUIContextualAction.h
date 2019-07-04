//
//  NUIContextualAction.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIContextualAction_h
#define NUIContextualAction_h    

#include "NNSObject.h"

#define js_value_UIContextualAction(x) js_value_wrapper(x, UIContextualAction)
#define to_value_UIContextualAction(x) to_value_wrapper(x, UIContextualAction)
#define is_value_UIContextualAction(x) is_value_wrapper(x, UIContextualAction)

#define js_value_UIContextualActionStyle(x) JS_ENUM(UIContextualActionStyle, NSInteger, x)
#define to_value_UIContextualActionStyle(x) TO_ENUM(UIContextualActionStyle, NSInteger, x)
#define is_value_UIContextualActionStyle(x) IS_ENUM(UIContextualActionStyle, NSInteger, x)

JS_WRAP_CLASS(UIContextualAction, NSObject);
  JS_STATIC_METHOD(contextualActionWithStyleTitleHandler);
  JS_PROP_READONLY(style);
  JS_PROP_READONLY(handler);
  JS_PROP(title);
  JS_PROP(backgroundColor);
  JS_PROP(image);
JS_WRAP_CLASS_END(UIContextualAction);

#endif /* NUIContextualAction_h */
