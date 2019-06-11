//
//  NWKNavigationDelegate.h
//
//  Created by Emily Kolar on 2019-6-7.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NWKNavigationDelegate_h
#define NWKNavigationDelegate_h    

#include "NNSObject.h"

#define js_value_WKNavigationDelegate(x) js_value_wrapper(x, WKNavigationDelegate)
#define to_value_WKNavigationDelegate(x) to_value_wrapper(x, WKNavigationDelegate)
#define is_value_WKNavigationDelegate(x) is_value_wrapper(x, WKNavigationDelegate)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(WKNavigationDelegate, NSObject);
  JS_PROP(didFinishNavigation);
  //JS_PROP(iosPropertyName);
  sweetiekit::JSFunction _didFinishNavigation;
JS_WRAP_CLASS_END(WKNavigationDelegate);

#endif /* NWKNavigationDelegate_h */
