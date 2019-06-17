//
//  NNSCalendar.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSCalendar.h"

#define instancetype NSCalendar
#define js_value_instancetype js_value_NSCalendar

NNSCalendar::NNSCalendar() {}
NNSCalendar::~NNSCalendar() {}

JS_INIT_CLASS(NSCalendar, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(calendarWithIdentifier);
  JS_ASSIGN_STATIC_METHOD(initWithCalendarIdentifier);
  JS_ASSIGN_PROTO_METHOD(minimumRangeOfUnit);
  JS_ASSIGN_PROTO_METHOD(maximumRangeOfUnit);
  JS_ASSIGN_PROTO_METHOD(rangeOfUnitInUnitForDate);
  JS_ASSIGN_PROTO_METHOD(ordinalityOfUnitInUnitForDate);
  JS_ASSIGN_PROTO_METHOD(rangeOfUnitStartDateIntervalForDate);
  JS_ASSIGN_PROTO_METHOD(dateFromComponents);
  JS_ASSIGN_PROTO_METHOD(componentsFromDate);
  JS_ASSIGN_PROTO_METHOD(dateByAddingComponentsToDateOptions);
  JS_ASSIGN_PROTO_METHOD(componentsFromDateToDateOptions);
  JS_ASSIGN_PROTO_METHOD(getEraYearMonthDayFromDate);
  JS_ASSIGN_PROTO_METHOD(getEraYearForWeekOfYearWeekOfYearWeekdayFromDate);
  JS_ASSIGN_PROTO_METHOD(getHourMinuteSecondNanosecondFromDate);
  JS_ASSIGN_PROTO_METHOD(componentFromDate);
  JS_ASSIGN_PROTO_METHOD(dateWithEraYearMonthDayHourMinuteSecondNanosecond);
  JS_ASSIGN_PROTO_METHOD(dateWithEraYearForWeekOfYearWeekOfYearWeekdayHourMinuteSecondNanosecond);
  JS_ASSIGN_PROTO_METHOD(startOfDayForDate);
  JS_ASSIGN_PROTO_METHOD(componentsInTimeZoneFromDate);
  JS_ASSIGN_PROTO_METHOD(compareDateToDateToUnitGranularity);
  JS_ASSIGN_PROTO_METHOD(isDateEqualToDateToUnitGranularity);
  JS_ASSIGN_PROTO_METHOD(isDateInSameDayAsDate);
  JS_ASSIGN_PROTO_METHOD(isDateInToday);
  JS_ASSIGN_PROTO_METHOD(isDateInYesterday);
  JS_ASSIGN_PROTO_METHOD(isDateInTomorrow);
  JS_ASSIGN_PROTO_METHOD(isDateInWeekend);
  JS_ASSIGN_PROTO_METHOD(rangeOfWeekendStartDateIntervalContainingDate);
  JS_ASSIGN_PROTO_METHOD(nextWeekendStartDateIntervalOptionsAfterDate);
  JS_ASSIGN_PROTO_METHOD(componentsFromDateComponentsToDateComponentsOptions);
  JS_ASSIGN_PROTO_METHOD(dateByAddingUnitValueToDateOptions);
  JS_ASSIGN_PROTO_METHOD(enumerateDatesStartingAfterDateMatchingComponentsOptionsUsingBlock);
  JS_ASSIGN_PROTO_METHOD(nextDateAfterDateMatchingComponentsOptions);
  JS_ASSIGN_PROTO_METHOD(nextDateAfterDateMatchingUnitValueOptions);
  JS_ASSIGN_PROTO_METHOD(nextDateAfterDateMatchingHourMinuteSecondOptions);
  JS_ASSIGN_PROTO_METHOD(dateBySettingUnitValueOfDateOptions);
  JS_ASSIGN_PROTO_METHOD(dateBySettingHourMinuteSecondOfDateOptions);
  JS_ASSIGN_PROTO_METHOD(dateMatchesComponents);
  JS_ASSIGN_STATIC_PROP_READONLY(currentCalendar);
  JS_ASSIGN_STATIC_PROP_READONLY(autoupdatingCurrentCalendar);
  JS_ASSIGN_PROTO_PROP_READONLY(calendarIdentifier);
  JS_ASSIGN_PROTO_PROP(locale);
  JS_ASSIGN_PROTO_PROP(timeZone);
  JS_ASSIGN_PROTO_PROP(firstWeekday);
  JS_ASSIGN_PROTO_PROP(minimumDaysInFirstWeek);
  JS_ASSIGN_PROTO_PROP_READONLY(eraSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(longEraSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(monthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortMonthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(veryShortMonthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(standaloneMonthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortStandaloneMonthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(veryShortStandaloneMonthSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(weekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortWeekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(veryShortWeekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(standaloneWeekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortStandaloneWeekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(veryShortStandaloneWeekdaySymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(quarterSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortQuarterSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(standaloneQuarterSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(shortStandaloneQuarterSymbols);
  JS_ASSIGN_PROTO_PROP_READONLY(AMSymbol);
  JS_ASSIGN_PROTO_PROP_READONLY(PMSymbol);

  // static members (ctor)
  JS_INIT_CTOR(NSCalendar, NSObject);
  // constant values (exports)
  
//typedef NS_OPTIONS(NSUInteger, NSCalendarUnit) {
  JS_ASSIGN_ENUM(NSCalendarUnitEra, NSUInteger); //                = kCFCalendarUnitEra,
  JS_ASSIGN_ENUM(NSCalendarUnitYear, NSUInteger); //               = kCFCalendarUnitYear,
  JS_ASSIGN_ENUM(NSCalendarUnitMonth, NSUInteger); //              = kCFCalendarUnitMonth,
  JS_ASSIGN_ENUM(NSCalendarUnitDay, NSUInteger); //                = kCFCalendarUnitDay,
  JS_ASSIGN_ENUM(NSCalendarUnitHour, NSUInteger); //               = kCFCalendarUnitHour,
  JS_ASSIGN_ENUM(NSCalendarUnitMinute, NSUInteger); //             = kCFCalendarUnitMinute,
  JS_ASSIGN_ENUM(NSCalendarUnitSecond, NSUInteger); //             = kCFCalendarUnitSecond,
  JS_ASSIGN_ENUM(NSCalendarUnitWeekday, NSUInteger); //            = kCFCalendarUnitWeekday,
  JS_ASSIGN_ENUM(NSCalendarUnitWeekdayOrdinal, NSUInteger); //     = kCFCalendarUnitWeekdayOrdinal,
  JS_ASSIGN_ENUM(NSCalendarUnitQuarter, NSUInteger); //            API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0)) = kCFCalendarUnitQuarter,
  JS_ASSIGN_ENUM(NSCalendarUnitWeekOfMonth, NSUInteger); //        API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)) = kCFCalendarUnitWeekOfMonth,
  JS_ASSIGN_ENUM(NSCalendarUnitWeekOfYear, NSUInteger); //         API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)) = kCFCalendarUnitWeekOfYear,
  JS_ASSIGN_ENUM(NSCalendarUnitYearForWeekOfYear, NSUInteger); //  API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)) = kCFCalendarUnitYearForWeekOfYear,
  JS_ASSIGN_ENUM(NSCalendarUnitNanosecond, NSUInteger); //         API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)) = (1 << 15),
  JS_ASSIGN_ENUM(NSCalendarUnitCalendar, NSUInteger); //           API_AVAILABLE(macos(10.7), ios(4.0), watchos(2.0), tvos(9.0)) = (1 << 20),
  JS_ASSIGN_ENUM(NSCalendarUnitTimeZone, NSUInteger); //           API_AVAILABLE(macos(10.7), ios(4.0), watchos(2.0), tvos(9.0)) = (1 << 21),
//};
    
//typedef NS_OPTIONS(NSUInteger, NSCalendarOptions) {
  JS_ASSIGN_ENUM(NSCalendarWrapComponents, NSUInteger); //  = (1UL << 0), // option for arithmetic operations that do calendar addition

  JS_ASSIGN_ENUM(NSCalendarMatchStrictly, NSUInteger); //     API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 1),
  JS_ASSIGN_ENUM(NSCalendarSearchBackwards, NSUInteger); //   API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 2),
    
  JS_ASSIGN_ENUM(NSCalendarMatchPreviousTimePreservingSmallerUnits, NSUInteger); //  API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 8),
  JS_ASSIGN_ENUM(NSCalendarMatchNextTimePreservingSmallerUnits, NSUInteger); //      API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 9),
  JS_ASSIGN_ENUM(NSCalendarMatchNextTime, NSUInteger); //                            API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 10),
    
  JS_ASSIGN_ENUM(NSCalendarMatchFirst, NSUInteger); //   API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 12),
  JS_ASSIGN_ENUM(NSCalendarMatchLast, NSUInteger); //    API_AVAILABLE(macos(10.9), ios(7.0), watchos(2.0), tvos(9.0)) = (1ULL << 13)
//};


//typedef NSString * NSCalendarIdentifier NS_EXTENSIBLE_STRING_ENUM;

  JS_ASSIGN_ENUM(NSCalendarIdentifierGregorian, NSString); //  API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0)); // the common calendar in Europe, the Western Hemisphere, and elsewhere
  JS_ASSIGN_ENUM(NSCalendarIdentifierBuddhist, NSString); //            API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierChinese, NSString); //             API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierCoptic, NSString); //              API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierEthiopicAmeteMihret, NSString); // API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierEthiopicAmeteAlem, NSString); //   API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierHebrew, NSString); //              API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierISO8601, NSString); //             API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierIndian, NSString); //              API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierIslamic, NSString); //             API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierIslamicCivil, NSString); //        API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierJapanese, NSString); //            API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierPersian, NSString); //             API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
  JS_ASSIGN_ENUM(NSCalendarIdentifierRepublicOfChina, NSString); //     API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
// A simple tabular Islamic calendar using the astronomical/Thursday epoch of CE 622 July 15
  JS_ASSIGN_ENUM(NSCalendarIdentifierIslamicTabular, NSString); //      API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));
// The Islamic Umm al-Qura calendar used in Saudi Arabia. This is based on astronomical calculation, instead of tabular behavior.
  JS_ASSIGN_ENUM(NSCalendarIdentifierIslamicUmmAlQura, NSString); //    API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));


/*
 These constants are used to indicate how items in a request are ordered, from the first one given in a method invocation or function call to the last (that is, left to right in code).
 
 Given the function:
   NSComparisonResult f(int a, int b)
 
 If:
    a < b   then return NSOrderedAscending. The left operand is smaller than the right operand.
    a > b   then return NSOrderedDescending. The left operand is greater than the right operand.
    a == b  then return NSOrderedSame. The operands are equal.
*/
//typedef NS_CLOSED_ENUM(NSInteger, NSComparisonResult) {
  JS_ASSIGN_ENUM(NSOrderedAscending, NSInteger); // = -1L,
  JS_ASSIGN_ENUM(NSOrderedSame, NSInteger);
  JS_ASSIGN_ENUM(NSOrderedDescending, NSInteger);
//};

JS_INIT_CLASS_END(NSCalendar, NSObject);

NAN_METHOD(NNSCalendar::New) {
  JS_RECONSTRUCT(NSCalendar);
  @autoreleasepool {
    NSCalendar* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSCalendar *)(info[0].As<External>()->Value());
    }
    if (self) {
      NNSCalendar *wrapper = new NNSCalendar();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSCalendar::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSCalendar::calendarWithIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarIdentifier, calendarIdentifierConstant);
    JS_SET_RETURN(js_value_NSCalendar([NSCalendar calendarWithIdentifier: calendarIdentifierConstant]));
  }
}

NAN_METHOD(NNSCalendar::initWithCalendarIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarIdentifier, ident);
    JS_SET_RETURN(js_value_id([[NSCalendar alloc] initWithCalendarIdentifier: ident]));
  }
}

NAN_METHOD(NNSCalendar::minimumRangeOfUnit) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    JS_SET_RETURN(js_value_NSRange([self minimumRangeOfUnit: unit]));
  }
}

NAN_METHOD(NNSCalendar::maximumRangeOfUnit) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    JS_SET_RETURN(js_value_NSRange([self maximumRangeOfUnit: unit]));
  }
}

NAN_METHOD(NNSCalendar::rangeOfUnitInUnitForDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, smaller);
    declare_value(NSCalendarUnit, larger);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSRange([self rangeOfUnit: smaller inUnit: larger forDate: date]));
  }
}

NAN_METHOD(NNSCalendar::ordinalityOfUnitInUnitForDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, smaller);
    declare_value(NSCalendarUnit, larger);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSUInteger([self ordinalityOfUnit: smaller inUnit: larger forDate: date]));
  }
}

NAN_METHOD(NNSCalendar::rangeOfUnitStartDateIntervalForDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(NSCalendarUnit, unit);
    declare_value(NSDate-pointer-_Nullable-pointer-_Nullable, datep);
    declare_nullable_pointer(NSTimeInterval, tip);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self rangeOfUnit: unit startDate: datep interval: tip forDate: date]));
    #endif
  }
}

#include "NNSDateComponents.h"

NAN_METHOD(NNSCalendar::dateFromComponents) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDateComponents, comps);
    JS_SET_RETURN(js_value_NSDate([self dateFromComponents: comps]));
  }
}

NAN_METHOD(NNSCalendar::componentsFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unitFlags);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSDateComponents([self components: unitFlags fromDate: date]));
  }
}

NAN_METHOD(NNSCalendar::dateByAddingComponentsToDateOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDateComponents, comps);
    declare_pointer(NSDate, date);
    declare_value(NSCalendarOptions, opts);
    JS_SET_RETURN(js_value_NSDate([self dateByAddingComponents: comps toDate: date options: opts]));
  }
}

NAN_METHOD(NNSCalendar::componentsFromDateToDateOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unitFlags);
    declare_pointer(NSDate, startingDate);
    declare_pointer(NSDate, resultDate);
    declare_value(NSCalendarOptions, opts);
    JS_SET_RETURN(js_value_NSDateComponents([self components: unitFlags fromDate: startingDate toDate: resultDate options: opts]));
  }
}

NAN_METHOD(NNSCalendar::getEraYearMonthDayFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(out-nullable-NSInteger, eraValuePointer);
    declare_pointer(out-nullable-NSInteger, yearValuePointer);
    declare_pointer(out-nullable-NSInteger, monthValuePointer);
    declare_pointer(out-nullable-NSInteger, dayValuePointer);
    declare_pointer(NSDate, date);
    [self getEra: eraValuePointer year: yearValuePointer month: monthValuePointer day: dayValuePointer fromDate: date];
    #endif
  }
}

NAN_METHOD(NNSCalendar::getEraYearForWeekOfYearWeekOfYearWeekdayFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(out-nullable-NSInteger, eraValuePointer);
    declare_pointer(out-nullable-NSInteger, yearValuePointer);
    declare_pointer(out-nullable-NSInteger, weekValuePointer);
    declare_pointer(out-nullable-NSInteger, weekdayValuePointer);
    declare_pointer(NSDate, date);
    [self getEra: eraValuePointer yearForWeekOfYear: yearValuePointer weekOfYear: weekValuePointer weekday: weekdayValuePointer fromDate: date];
    #endif
  }
}

NAN_METHOD(NNSCalendar::getHourMinuteSecondNanosecondFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(out-nullable-NSInteger, hourValuePointer);
    declare_pointer(out-nullable-NSInteger, minuteValuePointer);
    declare_pointer(out-nullable-NSInteger, secondValuePointer);
    declare_pointer(out-nullable-NSInteger, nanosecondValuePointer);
    declare_pointer(NSDate, date);
    [self getHour: hourValuePointer minute: minuteValuePointer second: secondValuePointer nanosecond: nanosecondValuePointer fromDate: date];
    #endif
  }
}

NAN_METHOD(NNSCalendar::componentFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSInteger([self component: unit fromDate: date]));
  }
}

NAN_METHOD(NNSCalendar::dateWithEraYearMonthDayHourMinuteSecondNanosecond) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, eraValue);
    declare_value(NSInteger, yearValue);
    declare_value(NSInteger, monthValue);
    declare_value(NSInteger, dayValue);
    declare_value(NSInteger, hourValue);
    declare_value(NSInteger, minuteValue);
    declare_value(NSInteger, secondValue);
    declare_value(NSInteger, nanosecondValue);
    JS_SET_RETURN(js_value_NSDate([self dateWithEra: eraValue year: yearValue month: monthValue day: dayValue hour: hourValue minute: minuteValue second: secondValue nanosecond: nanosecondValue]));
  }
}

NAN_METHOD(NNSCalendar::dateWithEraYearForWeekOfYearWeekOfYearWeekdayHourMinuteSecondNanosecond) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, eraValue);
    declare_value(NSInteger, yearValue);
    declare_value(NSInteger, weekValue);
    declare_value(NSInteger, weekdayValue);
    declare_value(NSInteger, hourValue);
    declare_value(NSInteger, minuteValue);
    declare_value(NSInteger, secondValue);
    declare_value(NSInteger, nanosecondValue);
    JS_SET_RETURN(js_value_NSDate([self dateWithEra: eraValue yearForWeekOfYear: yearValue weekOfYear: weekValue weekday: weekdayValue hour: hourValue minute: minuteValue second: secondValue nanosecond: nanosecondValue]));
  }
}

NAN_METHOD(NNSCalendar::startOfDayForDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSDate([self startOfDayForDate: date]));
  }
}

#include "NNSTimeZone.h"

NAN_METHOD(NNSCalendar::componentsInTimeZoneFromDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSTimeZone, timezone);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_NSDateComponents([self componentsInTimeZone: timezone fromDate: date]));
  }
}

NAN_METHOD(NNSCalendar::compareDateToDateToUnitGranularity) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date1);
    declare_pointer(NSDate, date2);
    declare_value(NSCalendarUnit, unit);
    JS_SET_RETURN(js_value_NSComparisonResult([self compareDate: date1 toDate: date2 toUnitGranularity: unit]));
  }
}

NAN_METHOD(NNSCalendar::isDateEqualToDateToUnitGranularity) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date1);
    declare_pointer(NSDate, date2);
    declare_value(NSCalendarUnit, unit);
    JS_SET_RETURN(js_value_BOOL([self isDate: date1 equalToDate: date2 toUnitGranularity: unit]));
  }
}

NAN_METHOD(NNSCalendar::isDateInSameDayAsDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date1);
    declare_pointer(NSDate, date2);
    JS_SET_RETURN(js_value_BOOL([self isDate: date1 inSameDayAsDate: date2]));
  }
}

NAN_METHOD(NNSCalendar::isDateInToday) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self isDateInToday: date]));
  }
}

NAN_METHOD(NNSCalendar::isDateInYesterday) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self isDateInYesterday: date]));
  }
}

NAN_METHOD(NNSCalendar::isDateInTomorrow) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self isDateInTomorrow: date]));
  }
}

NAN_METHOD(NNSCalendar::isDateInWeekend) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self isDateInWeekend: date]));
  }
}

NAN_METHOD(NNSCalendar::rangeOfWeekendStartDateIntervalContainingDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(out-NSDate-pointer-_Nullable-pointer-_Nullable, datep);
    declare_pointer(out-nullable-NSTimeInterval, tip);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self rangeOfWeekendStartDate: datep interval: tip containingDate: date]));
    #endif
  }
}

NAN_METHOD(NNSCalendar::nextWeekendStartDateIntervalOptionsAfterDate) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(out-NSDate-pointer-_Nullable-pointer-_Nullable, datep);
    declare_pointer(out-nullable-NSTimeInterval, tip);
    declare_value(NSCalendarOptions, options);
    declare_pointer(NSDate, date);
    JS_SET_RETURN(js_value_BOOL([self nextWeekendStartDate: datep interval: tip options: options afterDate: date]));
    #endif
  }
}

NAN_METHOD(NNSCalendar::componentsFromDateComponentsToDateComponentsOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unitFlags);
    declare_pointer(NSDateComponents, startingDateComp);
    declare_pointer(NSDateComponents, resultDateComp);
    declare_value(NSCalendarOptions, options);
    JS_SET_RETURN(js_value_NSDateComponents([self components: unitFlags fromDateComponents: startingDateComp toDateComponents: resultDateComp options: options]));
  }
}

NAN_METHOD(NNSCalendar::dateByAddingUnitValueToDateOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    declare_value(NSInteger, value);
    declare_pointer(NSDate, date);
    declare_value(NSCalendarOptions, options);
    JS_SET_RETURN(js_value_NSDate([self dateByAddingUnit: unit value: value toDate: date options: options]));
  }
}

NAN_METHOD(NNSCalendar::enumerateDatesStartingAfterDateMatchingComponentsOptionsUsingBlock) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSDate, start);
    declare_pointer(NSDateComponents, comps);
    declare_value(NSCalendarOptions, opts);
    declare_value(void-NS_NOESCAPE,^-NSDate-pointer,_Nullable,date,BOOL,exactMatch,BOOL-pointer,stop, block);
    [self enumerateDatesStartingAfterDate: start matchingComponents: comps options: opts usingBlock: block];
    #endif
  }
}

NAN_METHOD(NNSCalendar::nextDateAfterDateMatchingComponentsOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_pointer(NSDateComponents, comps);
    declare_value(NSCalendarOptions, options);
    JS_SET_RETURN(js_value_NSDate([self nextDateAfterDate: date matchingComponents: comps options: options]));
  }
}

NAN_METHOD(NNSCalendar::nextDateAfterDateMatchingUnitValueOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_value(NSCalendarUnit, unit);
    declare_value(NSInteger, value);
    declare_value(NSCalendarOptions, options);
    JS_SET_RETURN(js_value_NSDate([self nextDateAfterDate: date matchingUnit: unit value: value options: options]));
  }
}

NAN_METHOD(NNSCalendar::nextDateAfterDateMatchingHourMinuteSecondOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_value(NSInteger, hourValue);
    declare_value(NSInteger, minuteValue);
    declare_value(NSInteger, secondValue);
    declare_value(NSCalendarOptions, options);
    JS_SET_RETURN(js_value_NSDate([self nextDateAfterDate: date matchingHour: hourValue minute: minuteValue second: secondValue options: options]));
  }
}

NAN_METHOD(NNSCalendar::dateBySettingUnitValueOfDateOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSCalendarUnit, unit);
    declare_value(NSInteger, v);
    declare_pointer(NSDate, date);
    declare_value(NSCalendarOptions, opts);
    JS_SET_RETURN(js_value_NSDate([self dateBySettingUnit: unit value: v ofDate: date options: opts]));
  }
}

NAN_METHOD(NNSCalendar::dateBySettingHourMinuteSecondOfDateOptions) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, h);
    declare_value(NSInteger, m);
    declare_value(NSInteger, s);
    declare_pointer(NSDate, date);
    declare_value(NSCalendarOptions, opts);
    JS_SET_RETURN(js_value_NSDate([self dateBySettingHour: h minute: m second: s ofDate: date options: opts]));
  }
}

NAN_METHOD(NNSCalendar::dateMatchesComponents) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, date);
    declare_pointer(NSDateComponents, components);
    JS_SET_RETURN(js_value_BOOL([self date: date matchesComponents: components]));
  }
}

NAN_GETTER(NNSCalendar::currentCalendarGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendar([NSCalendar currentCalendar]));
  }
}

NAN_GETTER(NNSCalendar::autoupdatingCurrentCalendarGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendar([NSCalendar autoupdatingCurrentCalendar]));
  }
}

NAN_GETTER(NNSCalendar::calendarIdentifierGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendarIdentifier([self calendarIdentifier]));
  }
}

#include "NNSLocale.h"

NAN_GETTER(NNSCalendar::localeGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLocale([self locale]));
  }
}

NAN_SETTER(NNSCalendar::localeSetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSLocale, input);
    [self setLocale: input];
  }
}

NAN_GETTER(NNSCalendar::timeZoneGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([self timeZone]));
  }
}

NAN_SETTER(NNSCalendar::timeZoneSetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSTimeZone, input);
    [self setTimeZone: input];
  }
}

NAN_GETTER(NNSCalendar::firstWeekdayGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self firstWeekday]));
  }
}

NAN_SETTER(NNSCalendar::firstWeekdaySetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setFirstWeekday: input];
  }
}

NAN_GETTER(NNSCalendar::minimumDaysInFirstWeekGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self minimumDaysInFirstWeek]));
  }
}

NAN_SETTER(NNSCalendar::minimumDaysInFirstWeekSetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setMinimumDaysInFirstWeek: input];
  }
}

NAN_GETTER(NNSCalendar::eraSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self eraSymbols]));
  }
}

NAN_GETTER(NNSCalendar::longEraSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self longEraSymbols]));
  }
}

NAN_GETTER(NNSCalendar::monthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self monthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortMonthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortMonthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::veryShortMonthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self veryShortMonthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::standaloneMonthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self standaloneMonthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortStandaloneMonthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortStandaloneMonthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::veryShortStandaloneMonthSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self veryShortStandaloneMonthSymbols]));
  }
}

NAN_GETTER(NNSCalendar::weekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self weekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortWeekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortWeekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::veryShortWeekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self veryShortWeekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::standaloneWeekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self standaloneWeekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortStandaloneWeekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortStandaloneWeekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::veryShortStandaloneWeekdaySymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self veryShortStandaloneWeekdaySymbols]));
  }
}

NAN_GETTER(NNSCalendar::quarterSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self quarterSymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortQuarterSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortQuarterSymbols]));
  }
}

NAN_GETTER(NNSCalendar::standaloneQuarterSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self standaloneQuarterSymbols]));
  }
}

NAN_GETTER(NNSCalendar::shortStandaloneQuarterSymbolsGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self shortStandaloneQuarterSymbols]));
  }
}

NAN_GETTER(NNSCalendar::AMSymbolGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self AMSymbol]));
  }
}

NAN_GETTER(NNSCalendar::PMSymbolGetter) {
  JS_UNWRAP(NSCalendar, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self PMSymbol]));
  }
}

