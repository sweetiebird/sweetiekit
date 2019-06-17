//
//  NNSDateComponents.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSDateComponents_h
#define NNSDateComponents_h    

#include "NNSObject.h"

#define js_value_NSDateComponents(x) js_value_wrapper(x, NSDateComponents)
#define to_value_NSDateComponents(x) to_value_wrapper(x, NSDateComponents)
#define is_value_NSDateComponents(x) is_value_wrapper(x, NSDateComponents)

JS_WRAP_CLASS(NSDateComponents, NSObject);
  JS_METHOD(week);
  JS_METHOD(setWeek);
  JS_METHOD(setValueForComponent);
  JS_METHOD(valueForComponent);
  JS_METHOD(isValidDateInCalendar);
  JS_PROP(calendar);
  JS_PROP(timeZone);
  JS_PROP(era);
  JS_PROP(year);
  JS_PROP(month);
  JS_PROP(day);
  JS_PROP(hour);
  JS_PROP(minute);
  JS_PROP(second);
  JS_PROP(nanosecond);
  JS_PROP(weekday);
  JS_PROP(weekdayOrdinal);
  JS_PROP(quarter);
  JS_PROP(weekOfMonth);
  JS_PROP(weekOfYear);
  JS_PROP(yearForWeekOfYear);
  JS_PROP(isLeapMonth);
  JS_PROP_READONLY(date);
  JS_PROP_READONLY(isValidDate);

JS_WRAP_CLASS_END(NSDateComponents);

#endif /* NNSDateComponents_h */
