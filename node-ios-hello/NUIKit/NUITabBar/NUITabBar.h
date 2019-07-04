//
//  NUITabBar.h
//
//  Created by Emily Kolar on 2019-5-20.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBar_h
#define NUITabBar_h   

#include "NUIView.h"

#define js_value_UITabBar(x) js_value_wrapper(x, UITabBar)
#define to_value_UITabBar(x) to_value_wrapper(x, UITabBar)
#define is_value_UITabBar(x) is_value_wrapper(x, UITabBar)

#define js_value_UITabBarItemPositioning(x) JS_ENUM(UITabBarItemPositioning, NSInteger, x)
#define to_value_UITabBarItemPositioning(x) TO_ENUM(UITabBarItemPositioning, NSInteger, x)
#define is_value_UITabBarItemPositioning(x) IS_ENUM(UITabBarItemPositioning, NSInteger, x)

JS_WRAP_CLASS(UITabBar, UIView);
  JS_METHOD(setItemsAnimated);
  JS_METHOD(beginCustomizingItems);
  JS_METHOD(endCustomizingAnimated);
  JS_METHOD(isCustomizing);
  JS_PROP(delegate);
  JS_PROP(items);
  JS_PROP(selectedItem);
  JS_PROP_READONLY(isCustomizing);
  JS_PROP(tintColor);
  JS_PROP(barTintColor);
  JS_PROP(unselectedItemTintColor);
  JS_PROP(selectedImageTintColor);
  JS_PROP(backgroundImage);
  JS_PROP(selectionIndicatorImage);
  JS_PROP(shadowImage);
  JS_PROP(itemPositioning);
  JS_PROP(itemWidth);
  JS_PROP(itemSpacing);
  JS_PROP(barStyle);
  JS_PROP(isTranslucent);
JS_WRAP_CLASS_END(UITabBar);

#endif /* NUITabBar_h */
