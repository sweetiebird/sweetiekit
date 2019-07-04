//
//  NUIFocusUpdateContext.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFocusUpdateContext_h
#define NUIFocusUpdateContext_h    

#include "NNSObject.h"

#define js_value_UIFocusUpdateContext(x) js_value_wrapper(x, UIFocusUpdateContext)
#define to_value_UIFocusUpdateContext(x) to_value_wrapper(x, UIFocusUpdateContext)
#define is_value_UIFocusUpdateContext(x) is_value_wrapper(x, UIFocusUpdateContext)

JS_WRAP_CLASS(UIFocusUpdateContext, NSObject);
  JS_PROP_READONLY(previouslyFocusedItem);
  JS_PROP_READONLY(nextFocusedItem);
  JS_PROP_READONLY(previouslyFocusedView);
  JS_PROP_READONLY(nextFocusedView);
  JS_PROP_READONLY(focusHeading);
JS_WRAP_CLASS_END(UIFocusUpdateContext);

#endif /* NUIFocusUpdateContext_h */
