//
//  NUITableViewPlaceholder.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewPlaceholder_h
#define NUITableViewPlaceholder_h    

#include "NNSObject.h"

#define js_value_UITableViewPlaceholder(x) js_value_wrapper(x, UITableViewPlaceholder)
#define to_value_UITableViewPlaceholder(x) to_value_wrapper(x, UITableViewPlaceholder)
#define is_value_UITableViewPlaceholder(x) is_value_wrapper(x, UITableViewPlaceholder)

JS_WRAP_CLASS(UITableViewPlaceholder, NSObject);
  JS_METHOD(initWithInsertionIndexPathReuseIdentifierRowHeight);
  JS_PROP(cellUpdateHandler);
JS_WRAP_CLASS_END(UITableViewPlaceholder);

#endif /* NUITableViewPlaceholder_h */
