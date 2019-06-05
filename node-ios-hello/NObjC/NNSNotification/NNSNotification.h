//
//  NNSNotification.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSNotification_h
#define NNSNotification_h    

#include "NNSObject.h"

#define js_value_NSNotification(x) js_value_wrapper(x, NSNotification)
#define to_value_NSNotification(x) to_value_wrapper(x, NSNotification)
#define is_value_NSNotification(x) is_value_wrapper(x, NSNotification)

JS_WRAP_CLASS(NSNotification, NSObject);
  JS_METHOD(notificationWithName);
  JS_PROP(name);
  JS_PROP(object);
  JS_PROP(userInfo);
JS_WRAP_CLASS_END(NSNotification);

#endif /* NNSNotification_h */
