//
//  NNSDateComponents.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSDateComponents.h"

#define instancetype NSDateComponents
#define js_value_instancetype js_value_NSDateComponents

NNSDateComponents::NNSDateComponents() {}
NNSDateComponents::~NNSDateComponents() {}

JS_INIT_CLASS(NSDateComponents, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(week);
  JS_ASSIGN_PROTO_METHOD(setWeek);
  JS_ASSIGN_PROTO_METHOD(setValueForComponent);
  JS_ASSIGN_PROTO_METHOD(valueForComponent);
  JS_ASSIGN_PROTO_METHOD(isValidDateInCalendar);
  JS_ASSIGN_PROTO_PROP(calendar);
  JS_ASSIGN_PROTO_PROP(timeZone);
  JS_ASSIGN_PROTO_PROP(era);
  JS_ASSIGN_PROTO_PROP(year);
  JS_ASSIGN_PROTO_PROP(month);
  JS_ASSIGN_PROTO_PROP(day);
  JS_ASSIGN_PROTO_PROP(hour);
  JS_ASSIGN_PROTO_PROP(minute);
  JS_ASSIGN_PROTO_PROP(second);
  JS_ASSIGN_PROTO_PROP(nanosecond);
  JS_ASSIGN_PROTO_PROP(weekday);
  JS_ASSIGN_PROTO_PROP(weekdayOrdinal);
  JS_ASSIGN_PROTO_PROP(quarter);
  JS_ASSIGN_PROTO_PROP(weekOfMonth);
  JS_ASSIGN_PROTO_PROP(weekOfYear);
  JS_ASSIGN_PROTO_PROP(yearForWeekOfYear);
  JS_ASSIGN_PROTO_PROP(isLeapMonth);
  JS_ASSIGN_PROTO_PROP_READONLY(date);
  JS_ASSIGN_PROTO_PROP_READONLY(isValidDate);

  // static members (ctor)
  JS_INIT_CTOR(NSDateComponents, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSDateComponents, NSObject);

NAN_METHOD(NNSDateComponents::New) {
  JS_RECONSTRUCT(NSDateComponents);
  @autoreleasepool {
    NSDateComponents* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSDateComponents *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSDateComponents alloc] init];
    }
    if (self) {
      NNSDateComponents *wrapper = new NNSDateComponents();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSDateComponents::New: invalid arguments");
    }
  }
}

#include "NNSCalendar.h"

NAN_METHOD(NNSDateComponents::week) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self week]));
  }
}

NAN_METHOD(NNSDateComponents::setWeek) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, v);
    [self setWeek: v];
  }
}

NAN_METHOD(NNSDateComponents::setValueForComponent) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, value);
    declare_value(NSCalendarUnit, unit);
    [self setValue: value forComponent: unit];
  }
}

NAN_METHOD(NNSDateComponents::valueForComponent) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    JS_SET_RETURN(js_value_NSInteger([self valueForComponent: unit]));
  }
}

NAN_METHOD(NNSDateComponents::isValidDateInCalendar) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCalendar, calendar);
    JS_SET_RETURN(js_value_BOOL([self isValidDateInCalendar: calendar]));
  }
}

NAN_GETTER(NNSDateComponents::calendarGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendar([self calendar]));
  }
}

NAN_SETTER(NNSDateComponents::calendarSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSCalendar, input);
    [self setCalendar: input];
  }
}

#include "NNSTimeZone.h"

NAN_GETTER(NNSDateComponents::timeZoneGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([self timeZone]));
  }
}

NAN_SETTER(NNSDateComponents::timeZoneSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSTimeZone, input);
    [self setTimeZone: input];
  }
}

NAN_GETTER(NNSDateComponents::eraGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self era]));
  }
}

NAN_SETTER(NNSDateComponents::eraSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setEra: input];
  }
}

NAN_GETTER(NNSDateComponents::yearGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self year]));
  }
}

NAN_SETTER(NNSDateComponents::yearSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setYear: input];
  }
}

NAN_GETTER(NNSDateComponents::monthGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self month]));
  }
}

NAN_SETTER(NNSDateComponents::monthSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMonth: input];
  }
}

NAN_GETTER(NNSDateComponents::dayGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self day]));
  }
}

NAN_SETTER(NNSDateComponents::daySetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setDay: input];
  }
}

NAN_GETTER(NNSDateComponents::hourGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self hour]));
  }
}

NAN_SETTER(NNSDateComponents::hourSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setHour: input];
  }
}

NAN_GETTER(NNSDateComponents::minuteGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self minute]));
  }
}

NAN_SETTER(NNSDateComponents::minuteSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setMinute: input];
  }
}

NAN_GETTER(NNSDateComponents::secondGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self second]));
  }
}

NAN_SETTER(NNSDateComponents::secondSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setSecond: input];
  }
}

NAN_GETTER(NNSDateComponents::nanosecondGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self nanosecond]));
  }
}

NAN_SETTER(NNSDateComponents::nanosecondSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setNanosecond: input];
  }
}

NAN_GETTER(NNSDateComponents::weekdayGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self weekday]));
  }
}

NAN_SETTER(NNSDateComponents::weekdaySetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setWeekday: input];
  }
}

NAN_GETTER(NNSDateComponents::weekdayOrdinalGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self weekdayOrdinal]));
  }
}

NAN_SETTER(NNSDateComponents::weekdayOrdinalSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setWeekdayOrdinal: input];
  }
}

NAN_GETTER(NNSDateComponents::quarterGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self quarter]));
  }
}

NAN_SETTER(NNSDateComponents::quarterSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setQuarter: input];
  }
}

NAN_GETTER(NNSDateComponents::weekOfMonthGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self weekOfMonth]));
  }
}

NAN_SETTER(NNSDateComponents::weekOfMonthSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setWeekOfMonth: input];
  }
}

NAN_GETTER(NNSDateComponents::weekOfYearGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self weekOfYear]));
  }
}

NAN_SETTER(NNSDateComponents::weekOfYearSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setWeekOfYear: input];
  }
}

NAN_GETTER(NNSDateComponents::yearForWeekOfYearGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self yearForWeekOfYear]));
  }
}

NAN_SETTER(NNSDateComponents::yearForWeekOfYearSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setYearForWeekOfYear: input];
  }
}

NAN_GETTER(NNSDateComponents::isLeapMonthGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLeapMonth]));
  }
}

NAN_SETTER(NNSDateComponents::isLeapMonthSetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLeapMonth: input];
  }
}

NAN_GETTER(NNSDateComponents::dateGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self date]));
  }
}

NAN_GETTER(NNSDateComponents::isValidDateGetter) {
  JS_UNWRAP(NSDateComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isValidDate]));
  }
}
