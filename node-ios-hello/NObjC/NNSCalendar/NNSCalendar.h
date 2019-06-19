//
//  NNSCalendar.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSCalendar_h
#define NNSCalendar_h    

#include "NNSObject.h"

#define js_value_NSCalendar(x) js_value_wrapper(x, NSCalendar)
#define to_value_NSCalendar(x) to_value_wrapper(x, NSCalendar)
#define is_value_NSCalendar(x) is_value_wrapper(x, NSCalendar)

#define js_value_NSCalendarUnit(x) JS_OPTS(NSCalendarUnit, NSUInteger, x)
#define to_value_NSCalendarUnit(x) TO_OPTS(NSCalendarUnit, NSUInteger, x)
#define is_value_NSCalendarUnit(x) IS_OPTS(NSCalendarUnit, NSUInteger, x)

#define js_value_NSCalendarOptions(x) JS_OPTS(NSCalendarOptions, NSUInteger, x)
#define to_value_NSCalendarOptions(x) TO_OPTS(NSCalendarOptions, NSUInteger, x)
#define is_value_NSCalendarOptions(x) IS_OPTS(NSCalendarOptions, NSUInteger, x)

#define js_value_NSCalendarIdentifier(x) JS_ENUM(NSCalendarIdentifier, NSString, x)
#define to_value_NSCalendarIdentifier(x) TO_ENUM(NSCalendarIdentifier, NSString, x)
#define is_value_NSCalendarIdentifier(x) IS_ENUM(NSCalendarIdentifier, NSString, x)

#define js_value_NSComparisonResult(x) JS_OPTS(NSComparisonResult, NSInteger, x)
#define to_value_NSComparisonResult(x) TO_OPTS(NSComparisonResult, NSInteger, x)
#define is_value_NSComparisonResult(x) IS_OPTS(NSComparisonResult, NSInteger, x)

JS_WRAP_CLASS(NSCalendar, NSObject);
  JS_STATIC_METHOD(calendarWithIdentifier);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCalendarIdentifier);
  JS_METHOD(minimumRangeOfUnit);
  JS_METHOD(maximumRangeOfUnit);
  JS_METHOD(rangeOfUnitInUnitForDate);
  JS_METHOD(ordinalityOfUnitInUnitForDate);
  JS_METHOD(rangeOfUnitStartDateIntervalForDate);
  JS_METHOD(dateFromComponents);
  JS_METHOD(componentsFromDate);
  JS_METHOD(dateByAddingComponentsToDateOptions);
  JS_METHOD(componentsFromDateToDateOptions);
  JS_METHOD(getEraYearMonthDayFromDate);
  JS_METHOD(getEraYearForWeekOfYearWeekOfYearWeekdayFromDate);
  JS_METHOD(getHourMinuteSecondNanosecondFromDate);
  JS_METHOD(componentFromDate);
  JS_METHOD(dateWithEraYearMonthDayHourMinuteSecondNanosecond);
  JS_METHOD(dateWithEraYearForWeekOfYearWeekOfYearWeekdayHourMinuteSecondNanosecond);
  JS_METHOD(startOfDayForDate);
  JS_METHOD(componentsInTimeZoneFromDate);
  JS_METHOD(compareDateToDateToUnitGranularity);
  JS_METHOD(isDateEqualToDateToUnitGranularity);
  JS_METHOD(isDateInSameDayAsDate);
  JS_METHOD(isDateInToday);
  JS_METHOD(isDateInYesterday);
  JS_METHOD(isDateInTomorrow);
  JS_METHOD(isDateInWeekend);
  JS_METHOD(rangeOfWeekendStartDateIntervalContainingDate);
  JS_METHOD(nextWeekendStartDateIntervalOptionsAfterDate);
  JS_METHOD(componentsFromDateComponentsToDateComponentsOptions);
  JS_METHOD(dateByAddingUnitValueToDateOptions);
  JS_METHOD(enumerateDatesStartingAfterDateMatchingComponentsOptionsUsingBlock);
  JS_METHOD(nextDateAfterDateMatchingComponentsOptions);
  JS_METHOD(nextDateAfterDateMatchingUnitValueOptions);
  JS_METHOD(nextDateAfterDateMatchingHourMinuteSecondOptions);
  JS_METHOD(dateBySettingUnitValueOfDateOptions);
  JS_METHOD(dateBySettingHourMinuteSecondOfDateOptions);
  JS_METHOD(dateMatchesComponents);
  JS_STATIC_PROP_READONLY(currentCalendar);
  JS_STATIC_PROP_READONLY(autoupdatingCurrentCalendar);
  JS_PROP_READONLY(calendarIdentifier);
  JS_PROP(locale);
  JS_PROP(timeZone);
  JS_PROP(firstWeekday);
  JS_PROP(minimumDaysInFirstWeek);
  JS_PROP_READONLY(eraSymbols);
  JS_PROP_READONLY(longEraSymbols);
  JS_PROP_READONLY(monthSymbols);
  JS_PROP_READONLY(shortMonthSymbols);
  JS_PROP_READONLY(veryShortMonthSymbols);
  JS_PROP_READONLY(standaloneMonthSymbols);
  JS_PROP_READONLY(shortStandaloneMonthSymbols);
  JS_PROP_READONLY(veryShortStandaloneMonthSymbols);
  JS_PROP_READONLY(weekdaySymbols);
  JS_PROP_READONLY(shortWeekdaySymbols);
  JS_PROP_READONLY(veryShortWeekdaySymbols);
  JS_PROP_READONLY(standaloneWeekdaySymbols);
  JS_PROP_READONLY(shortStandaloneWeekdaySymbols);
  JS_PROP_READONLY(veryShortStandaloneWeekdaySymbols);
  JS_PROP_READONLY(quarterSymbols);
  JS_PROP_READONLY(shortQuarterSymbols);
  JS_PROP_READONLY(standaloneQuarterSymbols);
  JS_PROP_READONLY(shortStandaloneQuarterSymbols);
  JS_PROP_READONLY(AMSymbol);
  JS_PROP_READONLY(PMSymbol);
JS_WRAP_CLASS_END(NSCalendar);

#endif /* NNSCalendar_h */
