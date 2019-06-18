//
//  NUITableView.h
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableView_h
#define NUITableView_h

#include "NUIScrollView.h"

#define js_value_UITableView(x) js_value_wrapper(x, UITableView)
#define to_value_UITableView(x) to_value_wrapper(x, UITableView)
#define is_value_UITableView(x) is_value_wrapper(x, UITableView)

#define js_value_UITableViewStyle(x) JS_ENUM(UITableViewStyle, NSInteger, x)
#define to_value_UITableViewStyle(x) TO_ENUM(UITableViewStyle, NSInteger, x)
#define is_value_UITableViewStyle(x) IS_ENUM(UITableViewStyle, NSInteger, x)

#define js_value_UITableViewScrollPosition(x) JS_ENUM(UITableViewScrollPosition, NSInteger, x)
#define to_value_UITableViewScrollPosition(x) TO_ENUM(UITableViewScrollPosition, NSInteger, x)
#define is_value_UITableViewScrollPosition(x) IS_ENUM(UITableViewScrollPosition, NSInteger, x)

#define js_value_UITableViewRowAnimation(x) JS_ENUM(UITableViewRowAnimation, NSInteger, x)
#define to_value_UITableViewRowAnimation(x) TO_ENUM(UITableViewRowAnimation, NSInteger, x)
#define is_value_UITableViewRowAnimation(x) IS_ENUM(UITableViewRowAnimation, NSInteger, x)

#define js_value_UITableViewRowActionStyle(x) JS_ENUM(UITableViewRowActionStyle, NSInteger, x)
#define to_value_UITableViewRowActionStyle(x) TO_ENUM(UITableViewRowActionStyle, NSInteger, x)
#define is_value_UITableViewRowActionStyle(x) IS_ENUM(UITableViewRowActionStyle, NSInteger, x)

#define js_value_UITableViewSeparatorInsetReference(x) JS_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)
#define to_value_UITableViewSeparatorInsetReference(x) TO_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)
#define is_value_UITableViewSeparatorInsetReference(x) IS_ENUM(UITableViewSeparatorInsetReference, NSInteger, x)

#define js_value_UITableViewDropIntent(x) JS_ENUM(UITableViewDropIntent, NSInteger, x)
#define to_value_UITableViewDropIntent(x) TO_ENUM(UITableViewDropIntent, NSInteger, x)
#define is_value_UITableViewDropIntent(x) IS_ENUM(UITableViewDropIntent, NSInteger, x)

JS_WRAP_CLASS(UITableView, UIScrollView);
  JS_METHOD(DequeueReusableCell);
  JS_METHOD(DequeueReusableCellWithIdentifierForIndexPath);
  JS_PROP(DataSource);
  JS_PROP(RowHeight);
  JS_PROP(EstimatedRowHeight);
  JS_PROP(RefreshControl);
  JS_PROP(separatorStyle);
  JS_METHOD(CellForRowAt);
  JS_METHOD(ReloadData);
  JS_METHOD(ScrollToRowAt);

  Nan::Persistent<Value> _dataSource;
JS_WRAP_CLASS_END(UITableView);

#endif /* NUITableView_h */
