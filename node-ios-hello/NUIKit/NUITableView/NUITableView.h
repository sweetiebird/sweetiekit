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
