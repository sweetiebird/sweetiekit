//
//  NUITableViewDropPlaceholder.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDropPlaceholder_h
#define NUITableViewDropPlaceholder_h    

#include "NUITableViewPlaceholder.h"

#define js_value_UITableViewDropPlaceholder(x) js_value_wrapper(x, UITableViewDropPlaceholder)
#define to_value_UITableViewDropPlaceholder(x) to_value_wrapper(x, UITableViewDropPlaceholder)
#define is_value_UITableViewDropPlaceholder(x) is_value_wrapper(x, UITableViewDropPlaceholder)

JS_WRAP_CLASS(UITableViewDropPlaceholder, UITableViewPlaceholder);
  JS_PROP(previewParametersProvider);
JS_WRAP_CLASS_END(UITableViewDropPlaceholder);

#endif /* NUITableViewDropPlaceholder_h */
