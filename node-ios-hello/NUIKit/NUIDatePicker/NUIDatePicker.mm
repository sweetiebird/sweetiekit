//
//  NUIDatePicker.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIDatePicker.h"

#define instancetype UIDatePicker
#define js_value_instancetype js_value_UIDatePicker

NUIDatePicker::NUIDatePicker() {}
NUIDatePicker::~NUIDatePicker() {}

JS_INIT_CLASS(UIDatePicker, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setDateAnimated);
  JS_ASSIGN_PROTO_PROP(datePickerMode);
  JS_ASSIGN_PROTO_PROP(locale);
  JS_ASSIGN_PROTO_PROP(calendar);
  JS_ASSIGN_PROTO_PROP(timeZone);
  JS_ASSIGN_PROTO_PROP(date);
  JS_ASSIGN_PROTO_PROP(minimumDate);
  JS_ASSIGN_PROTO_PROP(maximumDate);
  JS_ASSIGN_PROTO_PROP(countDownDuration);
  JS_ASSIGN_PROTO_PROP(minuteInterval);
  // static members (ctor)
  JS_INIT_CTOR(UIDatePicker, UIControl);
  // constant values (exports)

//typedef NS_ENUM(NSInteger, UIDatePickerMode) {
  JS_ASSIGN_ENUM(UIDatePickerModeTime, NSInteger); //           // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
  JS_ASSIGN_ENUM(UIDatePickerModeDate, NSInteger); //           // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
  JS_ASSIGN_ENUM(UIDatePickerModeDateAndTime, NSInteger); //    // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
  JS_ASSIGN_ENUM(UIDatePickerModeCountDownTimer, NSInteger); // // Displays hour and minute (e.g. 1 | 53)
//} __TVOS_PROHIBITED;

JS_INIT_CLASS_END(UIDatePicker, UIControl);

NAN_METHOD(NUIDatePicker::New) {
  JS_RECONSTRUCT(UIDatePicker);
  @autoreleasepool {
    UIDatePicker* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIDatePicker *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      self = [[UIDatePicker alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIDatePicker alloc] init];
    }
    if (self) {
      NUIDatePicker *wrapper = new NUIDatePicker();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIDatePicker::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIDatePicker::setDateAnimated) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_value(BOOL, animated);
    [self setDate: date animated: animated];
  }
}

NAN_GETTER(NUIDatePicker::datePickerModeGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIDatePickerMode([self datePickerMode]));
  }
}

NAN_SETTER(NUIDatePicker::datePickerModeSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIDatePickerMode, input);
    [self setDatePickerMode: input];
  }
}

#include "NNSLocale.h"

NAN_GETTER(NUIDatePicker::localeGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLocale([self locale]));
  }
}

NAN_SETTER(NUIDatePicker::localeSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSLocale, input);
    [self setLocale: input];
  }
}

#include "NNSCalendar.h"

NAN_GETTER(NUIDatePicker::calendarGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendar([self calendar]));
  }
}

NAN_SETTER(NUIDatePicker::calendarSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSCalendar, input);
    [self setCalendar: input];
  }
}

#include "NNSTimeZone.h"

NAN_GETTER(NUIDatePicker::timeZoneGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([self timeZone]));
  }
}

NAN_SETTER(NUIDatePicker::timeZoneSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSTimeZone, input);
    [self setTimeZone: input];
  }
}

NAN_GETTER(NUIDatePicker::dateGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self date]));
  }
}

NAN_SETTER(NUIDatePicker::dateSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setDate: input];
  }
}

NAN_GETTER(NUIDatePicker::minimumDateGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self minimumDate]));
  }
}

NAN_SETTER(NUIDatePicker::minimumDateSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setMinimumDate: input];
  }
}

NAN_GETTER(NUIDatePicker::maximumDateGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self maximumDate]));
  }
}

NAN_SETTER(NUIDatePicker::maximumDateSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setMaximumDate: input];
  }
}

NAN_GETTER(NUIDatePicker::countDownDurationGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self countDownDuration]));
  }
}

NAN_SETTER(NUIDatePicker::countDownDurationSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setCountDownDuration: input];
  }
}

NAN_GETTER(NUIDatePicker::minuteIntervalGetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self minuteInterval]));
  }
}

NAN_SETTER(NUIDatePicker::minuteIntervalSetter) {
  JS_UNWRAP(UIDatePicker, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMinuteInterval: input];
  }
}

