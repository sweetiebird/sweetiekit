//
//  NUIDatePicker.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDatePicker_h
#define NUIDatePicker_h    

#include "NUIControl.h"

#define js_value_UIDatePicker(x) js_value_wrapper(x, UIDatePicker)
#define to_value_UIDatePicker(x) to_value_wrapper(x, UIDatePicker)
#define is_value_UIDatePicker(x) is_value_wrapper(x, UIDatePicker)

#define js_value_UIDatePickerMode(x) JS_ENUM(UIDatePickerMode, NSInteger, x)
#define to_value_UIDatePickerMode(x) TO_ENUM(UIDatePickerMode, NSInteger, x)
#define is_value_UIDatePickerMode(x) IS_ENUM(UIDatePickerMode, NSInteger, x)

JS_WRAP_CLASS(UIDatePicker, UIControl);
  JS_METHOD(setDateAnimated);
  JS_PROP(datePickerMode);
  JS_PROP(locale);
  JS_PROP(calendar);
  JS_PROP(timeZone);
  JS_PROP(date);
  JS_PROP(minimumDate);
  JS_PROP(maximumDate);
  JS_PROP(countDownDuration);
  JS_PROP(minuteInterval);
JS_WRAP_CLASS_END(UIDatePicker);

#endif /* NUIDatePicker_h */
