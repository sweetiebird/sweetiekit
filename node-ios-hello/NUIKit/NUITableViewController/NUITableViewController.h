//
//  NUITableViewController.h
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewController_h
#define NUITableViewController_h

#include "NUIViewController.h"

#define js_value_UITableViewController(x) js_value_wrapper(x, UITableViewController)
#define to_value_UITableViewController(x) to_value_wrapper(x, UITableViewController)
#define is_value_UITableViewController(x) is_value_wrapper(x, UITableViewController)

JS_WRAP_CLASS(UITableViewController, UIViewController);
  JS_METHOD(initWithStyle);
  JS_METHOD(initWithNibNameBundle);
  JS_METHOD(initWithCoder);
  JS_PROP(tableView);
  JS_PROP(clearsSelectionOnViewWillAppear);
  JS_PROP(refreshControl);
JS_WRAP_CLASS_END(UITableViewController);

#endif /* NUITableViewController_h */
