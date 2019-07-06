//
//  NUIWindow.h
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIWindow_h
#define NUIWindow_h

#include "NUIView.h"

#define js_value_UIWindow(x) js_value_wrapper(x, UIWindow)
#define to_value_UIWindow(x) to_value_wrapper(x, UIWindow)
#define is_value_UIWindow(x) is_value_wrapper(x, UIWindow)

#define js_value_UIWindowLevel(x) JS_ENUM(UIWindowLevel, CGFloat, x)
#define to_value_UIWindowLevel(x) TO_ENUM(UIWindowLevel, CGFloat, x)
#define is_value_UIWindowLevel(x) IS_ENUM(UIWindowLevel, CGFloat, x)

JS_WRAP_CLASS(UIWindow, UIView);
  JS_METHOD(becomeKeyWindow);
  JS_METHOD(resignKeyWindow);
  JS_METHOD(makeKeyWindow);
  JS_METHOD(makeKeyAndVisible);
  JS_METHOD(sendEvent);
  JS_METHOD(convertPointToWindow);
  JS_METHOD(convertPointFromWindow);
  JS_METHOD(convertRectToWindow);
  JS_METHOD(convertRectFromWindow);
  JS_PROP(screen);
  JS_PROP(windowLevel);
  JS_PROP_READONLY(isKeyWindow);
  JS_PROP(rootViewController);
JS_WRAP_CLASS_END(UIWindow);

#endif /* NUIWindow_h */
