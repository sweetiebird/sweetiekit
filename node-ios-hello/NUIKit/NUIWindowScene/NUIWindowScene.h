//
//  NUIWindowScene.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIWindowScene_h
#define NUIWindowScene_h    

#include "NUIScene.h"

#define js_value_UIWindowScene(x) js_value_wrapper(x, UIWindowScene)
#define to_value_UIWindowScene(x) to_value_wrapper(x, UIWindowScene)
#define is_value_UIWindowScene(x) is_value_wrapper(x, UIWindowScene)

JS_WRAP_CLASS(UIWindowScene, UIScene);
  JS_PROP_READONLY(screen);
  JS_PROP_READONLY(interfaceOrientation);
  JS_PROP_READONLY(coordinateSpace);
  JS_PROP_READONLY(traitCollection);
  JS_PROP_READONLY(windows);
JS_WRAP_CLASS_END(UIWindowScene);

#endif /* NUIWindowScene_h */
