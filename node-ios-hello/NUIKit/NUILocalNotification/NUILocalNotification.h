//
//  NUILocalNotification.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILocalNotification_h
#define NUILocalNotification_h    

#include "NNSObject.h"

#define js_value_UILocalNotification(x) js_value_wrapper(x, UILocalNotification)
#define to_value_UILocalNotification(x) to_value_wrapper(x, UILocalNotification)
#define is_value_UILocalNotification(x) is_value_wrapper(x, UILocalNotification)

JS_WRAP_CLASS(UILocalNotification, NSObject);
  JS_STATIC_METHOD(init);
  JS_STATIC_METHOD(initWithCoder);
  JS_PROP(fireDate);
  JS_PROP(timeZone);
  JS_PROP(repeatInterval);
  JS_PROP(repeatCalendar);
  JS_PROP(region);
  JS_PROP(regionTriggersOnce);
  JS_PROP(alertBody);
  JS_PROP(hasAction);
  JS_PROP(alertAction);
  JS_PROP(alertLaunchImage);
  JS_PROP(alertTitle);
  JS_PROP(soundName);
  JS_PROP(applicationIconBadgeNumber);
  JS_PROP(userInfo);
  JS_PROP(category);
JS_WRAP_CLASS_END(UILocalNotification);

#endif /* NUILocalNotification_h */
