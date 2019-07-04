//
//  NUITableViewHeaderFooterView.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewHeaderFooterView_h
#define NUITableViewHeaderFooterView_h    

#include "NUIView.h"

#define js_value_UITableViewHeaderFooterView(x) js_value_wrapper(x, UITableViewHeaderFooterView)
#define to_value_UITableViewHeaderFooterView(x) to_value_wrapper(x, UITableViewHeaderFooterView)
#define is_value_UITableViewHeaderFooterView(x) is_value_wrapper(x, UITableViewHeaderFooterView)

JS_WRAP_CLASS(UITableViewHeaderFooterView, UIView);
  JS_METHOD(initWithReuseIdentifier);
  JS_METHOD(initWithCoder);
  JS_METHOD(prepareForReuse);
  JS_PROP_READONLY(textLabel);
  JS_PROP_READONLY(detailTextLabel);
  JS_PROP_READONLY(contentView);
  JS_PROP(backgroundView);
  JS_PROP_READONLY(reuseIdentifier);
JS_WRAP_CLASS_END(UITableViewHeaderFooterView);

#endif /* NUITableViewHeaderFooterView_h */
