//
//  NNSNotificationCenter.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSNotificationCenter_h
#define NNSNotificationCenter_h    

#include "NNSObject.h"

#define js_value_NSNotificationCenter(x) js_value_wrapper(x, NSNotificationCenter)
#define to_value_NSNotificationCenter(x) to_value_wrapper(x, NSNotificationCenter)
#define is_value_NSNotificationCenter(x) is_value_wrapper(x, NSNotificationCenter)

JS_WRAP_CLASS(NSNotificationCenter, NSObject);
  JS_METHOD(postNotification);
  JS_METHOD(addObserverForName);
JS_WRAP_CLASS_END(NSNotificationCenter);

#endif /* NNSNotificationCenter_h */
