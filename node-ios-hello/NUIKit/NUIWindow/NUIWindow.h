//
//  NUIWindow.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIWindow_h
#define NUIWindow_h

#include "NNSObject.h"

#define js_value_UIWindow(x) js_value_wrapper(x, UIWindow)
#define to_value_UIWindow(x) to_value_wrapper(x, UIWindow)
#define is_value_UIWindow(x) is_value_wrapper(x, UIWindow)

JS_WRAP_CLASS(UIWindow, NSObject);
  JS_METHOD(SetRootViewController);
  JS_METHOD(MakeKeyAndVisible);
  JS_PROP(rootViewController);
JS_WRAP_CLASS_END(UIWindow);

#endif /* NUIWindow_h */
