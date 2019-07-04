//
//  NUINavigationBar.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationBar_h
#define NUINavigationBar_h    

#include "NUIView.h"

#define js_value_UINavigationBar(x) js_value_wrapper(x, UINavigationBar)
#define to_value_UINavigationBar(x) to_value_wrapper(x, UINavigationBar)
#define is_value_UINavigationBar(x) is_value_wrapper(x, UINavigationBar)

#define UIToolbarPosition UIBarPosition
#define UIToolbarPositionAny UIBarPositionAny
#define UIToolbarPositionBottom UIBarPositionBottom
#define UIToolbarPositionTop UIBarPositionTop

JS_WRAP_CLASS(UINavigationBar, UIView);
  JS_METHOD(pushNavigationItemAnimated);
  JS_METHOD(popNavigationItemAnimated);
  JS_METHOD(setItemsAnimated);
  JS_METHOD(setBackgroundImageForBarPositionBarMetrics);
  JS_METHOD(backgroundImageForBarPositionBarMetrics);
  JS_METHOD(setBackgroundImageForBarMetrics);
  JS_METHOD(backgroundImageForBarMetrics);
  JS_METHOD(setTitleVerticalPositionAdjustmentForBarMetrics);
  JS_METHOD(titleVerticalPositionAdjustmentForBarMetrics);
  JS_PROP(barStyle);
  JS_PROP(delegate);
  JS_PROP(isTranslucent);
  JS_PROP_READONLY(topItem);
  JS_PROP_READONLY(backItem);
  JS_PROP(items);
  JS_PROP(prefersLargeTitles);
  JS_PROP(tintColor);
  JS_PROP(barTintColor);
  JS_PROP(shadowImage);
  JS_PROP(titleTextAttributes);
  JS_PROP(largeTitleTextAttributes);
  JS_PROP(backIndicatorImage);
  JS_PROP(backIndicatorTransitionMaskImage);
JS_WRAP_CLASS_END(UINavigationBar);

#endif /* NUINavigationBar_h */
