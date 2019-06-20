//
//  NUIPress.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPress_h
#define NUIPress_h    

#include "NNSObject.h"

#define js_value_UIPress(x) js_value_wrapper(x, UIPress)
#define to_value_UIPress(x) to_value_wrapper(x, UIPress)
#define is_value_UIPress(x) is_value_wrapper(x, UIPress)

// NS_ENUM_AVAILABLE_IOS(9_0)
#define js_value_UIPressPhase(x) JS_ENUM(UIPressPhase, NSInteger, x)
#define to_value_UIPressPhase(x) TO_ENUM(UIPressPhase, NSInteger, x)
#define is_value_UIPressPhase(x) IS_ENUM(UIPressPhase, NSInteger, x)

// NS_ENUM_AVAILABLE_IOS(9_0)
#define js_value_UIPressType(x) JS_ENUM(UIPressType, NSInteger, x)
#define to_value_UIPressType(x) TO_ENUM(UIPressType, NSInteger, x)
#define is_value_UIPressType(x) IS_ENUM(UIPressType, NSInteger, x)

JS_WRAP_CLASS(UIPress, NSObject);
  JS_PROP_READONLY(timestamp);
  JS_PROP_READONLY(phase);
  JS_PROP_READONLY(type);
  JS_PROP_READONLY(window);
  JS_PROP_READONLY(responder);
  JS_PROP_READONLY(gestureRecognizers);
  JS_PROP_READONLY(force);
JS_WRAP_CLASS_END(UIPress);

#endif /* NUIPress_h */
