//
//  NUITabBarItem.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarItem_h
#define NUITabBarItem_h

#include "NNSObject.h"

#define js_value_UITabBarItem(x) js_value_wrapper(x, UITabBarItem)
#define to_value_UITabBarItem(x) to_value_wrapper(x, UITabBarItem)
#define is_value_UITabBarItem(x) is_value_wrapper(x, UITabBarItem)

#define js_value_UITabBarSystemItem(x) JS_ENUM(UITabBarSystemItem, NSInteger, x)
#define to_value_UITabBarSystemItem(x) TO_ENUM(UITabBarSystemItem, NSInteger, x)
#define is_value_UITabBarSystemItem(x) IS_ENUM(UITabBarSystemItem, NSInteger, x)

JS_WRAP_CLASS(UITabBarItem, NSObject);
  JS_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(initWithTitleImageTag);
  JS_METHOD(initWithTitleImageSelectedImage);
  JS_METHOD(initWithTabBarSystemItemTag);
  JS_METHOD(setFinishedSelectedImageWithFinishedUnselectedImage);
  JS_METHOD(finishedSelectedImage);
  JS_METHOD(finishedUnselectedImage);
  JS_METHOD(setBadgeTextAttributesForState);
  JS_METHOD(badgeTextAttributesForState);
  JS_PROP(selectedImage);
  JS_PROP(badgeValue);
  JS_PROP(titlePositionAdjustment);
  JS_PROP(badgeColor);
JS_WRAP_CLASS_END(UITabBarItem);

#endif /* NUITabBarItem_h */
