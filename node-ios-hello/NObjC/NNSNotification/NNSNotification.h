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

#define js_value_NSNotificationName(x) JS_ENUM(NSNotificationName, NSString, x)
#define to_value_NSNotificationName(x) TO_ENUM(NSNotificationName, NSString, x)
#define is_value_NSNotificationName(x) IS_ENUM(NSNotificationName, NSString, x)

JS_WRAP_CLASS(NSNotification, NSObject);
  JS_STATIC_METHOD(notificationWithNameObject);
  JS_STATIC_METHOD(notificationWithNameObjectUserInfo);
  JS_METHOD(initWithNameObjectUserInfo);
  JS_METHOD(initWithCoder);
  JS_METHOD(init);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(object);
  JS_PROP_READONLY(userInfo);
JS_WRAP_CLASS_END(NSNotification);

#endif /* NNSNotification_h */
