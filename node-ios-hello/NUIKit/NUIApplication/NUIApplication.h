//
//  NUIApplication.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIApplication_h
#define NUIApplication_h

#include "NNSObject.h"

#define js_value_UIApplication(x) js_value_wrapper(x, UIApplication)
#define to_value_UIApplication(x) to_value_wrapper(x, UIApplication)
#define is_value_UIApplication(x) is_value_wrapper(x, UIApplication)

JS_WRAP_CLASS(UIApplication, NSObject);
  JS_PROP(KeyWindow);
  JS_METHOD(Main);
  JS_PROP(statusBarOrientation);

private:
  static UIWindow* tmp_UIWindow;
JS_WRAP_CLASS_END(UIApplication);


#endif /* NUIApplication_h */
