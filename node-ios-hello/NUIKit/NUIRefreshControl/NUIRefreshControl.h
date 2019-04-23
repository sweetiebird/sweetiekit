//
//  NUIRefreshControl.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/23/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIRefreshControl_h
#define NUIRefreshControl_h

#include "NUIControl.h"

JS_WRAP_CLASS(UIRefreshControl, UIControl);
  static NAN_METHOD(Alloc);
  static NAN_METHOD(AddTargetFor);
  static NAN_METHOD(EndRefreshing);
JS_WRAP_CLASS_END(UIRefreshControl);

#endif /* NUIRefreshControl_h */
