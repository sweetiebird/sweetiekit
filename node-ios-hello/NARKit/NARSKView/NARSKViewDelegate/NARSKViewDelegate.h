//
//  NARSKViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKViewDelegate_h
#define NARSKViewDelegate_h

#include "NNSObject.h"

#define js_value_ARSKViewDelegate(x) js_value_wrapper(x, ARSKViewDelegate)
#define to_value_ARSKViewDelegate(x) to_value_wrapper(x, ARSKViewDelegate)
#define is_value_ARSKViewDelegate(x) is_value_wrapper(x, ARSKViewDelegate)

JS_WRAP_CLASS(ARSKViewDelegate, NSObject);
  sweetiekit::JSFunction _nodeForAnchor;
JS_WRAP_CLASS_END(ARSKViewDelegate);

#endif /* NARSKViewDelegate_h */
