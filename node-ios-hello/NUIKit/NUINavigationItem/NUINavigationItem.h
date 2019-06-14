//
//  NUINavigationItem.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationItem_h
#define NUINavigationItem_h    

#include "NNSObject.h"

#define js_value_UINavigationItem(x) js_value_wrapper(x, UINavigationItem)
#define to_value_UINavigationItem(x) to_value_wrapper(x, UINavigationItem)
#define is_value_UINavigationItem(x) is_value_wrapper(x, UINavigationItem)

// UIKit constants

#define js_value_UINavigationItemLargeTitleDisplayMode(x) JS_ENUM(UINavigationItemLargeTitleDisplayMode, NSInteger, x)
#define to_value_UINavigationItemLargeTitleDisplayMode(x) TO_ENUM(UINavigationItemLargeTitleDisplayMode, NSInteger, x)
#define is_value_UINavigationItemLargeTitleDisplayMode(x) IS_ENUM(UINavigationItemLargeTitleDisplayMode, NSInteger, x)

JS_WRAP_CLASS(UINavigationItem, NSObject);
  JS_STATIC_METHOD(initWithTitle);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(setHidesBackButtonAnimated);
  JS_METHOD(setLeftBarButtonItemsAnimated);
  JS_METHOD(setRightBarButtonItemsAnimated);
  JS_METHOD(setLeftBarButtonItemAnimated);
  JS_METHOD(setRightBarButtonItemAnimated);
  JS_PROP(title);
  JS_PROP(titleView);
  JS_PROP(prompt);
  JS_PROP(backBarButtonItem);
  JS_PROP(hidesBackButton);
  JS_PROP(leftBarButtonItems);
  JS_PROP(rightBarButtonItems);
  JS_PROP(leftItemsSupplementBackButton);
  JS_PROP(leftBarButtonItem);
  JS_PROP(rightBarButtonItem);
  JS_PROP(largeTitleDisplayMode);
  JS_PROP(searchController);
  JS_PROP(hidesSearchBarWhenScrolling);
JS_WRAP_CLASS_END(UINavigationItem);

#endif /* NUINavigationItem_h */
