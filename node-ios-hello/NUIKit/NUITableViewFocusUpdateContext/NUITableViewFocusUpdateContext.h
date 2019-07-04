//
//  NUITableViewFocusUpdateContext.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewFocusUpdateContext_h
#define NUITableViewFocusUpdateContext_h    

#include "NUIFocusUpdateContext.h"

#define js_value_UITableViewFocusUpdateContext(x) js_value_wrapper(x, UITableViewFocusUpdateContext)
#define to_value_UITableViewFocusUpdateContext(x) to_value_wrapper(x, UITableViewFocusUpdateContext)
#define is_value_UITableViewFocusUpdateContext(x) is_value_wrapper(x, UITableViewFocusUpdateContext)

JS_WRAP_CLASS(UITableViewFocusUpdateContext, UIFocusUpdateContext);
  JS_PROP_READONLY(previouslyFocusedIndexPath);
  JS_PROP_READONLY(nextFocusedIndexPath);
JS_WRAP_CLASS_END(UITableViewFocusUpdateContext);

#endif /* NUITableViewFocusUpdateContext_h */
