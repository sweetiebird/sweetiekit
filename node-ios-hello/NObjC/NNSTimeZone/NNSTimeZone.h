//
//  NNSTimeZone.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSTimeZone_h
#define NNSTimeZone_h    

#include "NNSObject.h"

#define js_value_NSTimeZone(x) js_value_wrapper(x, NSTimeZone)
#define to_value_NSTimeZone(x) to_value_wrapper(x, NSTimeZone)
#define is_value_NSTimeZone(x) is_value_wrapper(x, NSTimeZone)

#define js_value_NSTimeZoneNameStyle(x) JS_ENUM(NSTimeZoneNameStyle, NSInteger, x)
#define to_value_NSTimeZoneNameStyle(x) TO_ENUM(NSTimeZoneNameStyle, NSInteger, x)
#define is_value_NSTimeZoneNameStyle(x) IS_ENUM(NSTimeZoneNameStyle, NSInteger, x)

JS_WRAP_CLASS(NSTimeZone, NSObject);
  JS_STATIC_METHOD(resetSystemTimeZone);
  JS_STATIC_METHOD(abbreviationDictionary);
  JS_STATIC_METHOD(timeZoneWithName);
  JS_STATIC_METHOD(timeZoneWithNameData);
  JS_STATIC_METHOD(timeZoneForSecondsFromGMT);
  JS_STATIC_METHOD(timeZoneWithAbbreviation);
  JS_METHOD(secondsFromGMTForDate);
  JS_METHOD(abbreviationForDate);
  JS_METHOD(isDaylightSavingTimeForDate);
  JS_METHOD(daylightSavingTimeOffsetForDate);
  JS_METHOD(nextDaylightSavingTimeTransitionAfterDate);
  JS_METHOD(isEqualToTimeZone);
  JS_METHOD(localizedNameLocale);
  JS_STATIC_METHOD(initWithName);
  JS_STATIC_METHOD(initWithNameData);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(data);
  JS_STATIC_PROP_READONLY(systemTimeZone);
  JS_STATIC_PROP(defaultTimeZone);
  JS_STATIC_PROP_READONLY(localTimeZone);
  JS_STATIC_PROP_READONLY(knownTimeZoneNames);
  JS_STATIC_PROP(abbreviationDictionary);
  JS_STATIC_PROP_READONLY(timeZoneDataVersion);
  JS_PROP_READONLY(secondsFromGMT);
  JS_PROP_READONLY(abbreviation);
  JS_PROP_READONLY(isDaylightSavingTime);
  JS_PROP_READONLY(daylightSavingTimeOffset);
  JS_PROP_READONLY(nextDaylightSavingTimeTransition);
  JS_PROP_READONLY(description);
JS_WRAP_CLASS_END(NSTimeZone);

#endif /* NNSTimeZone_h */
