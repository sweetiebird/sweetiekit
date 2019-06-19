//
//  NNSLocale.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLocale_h
#define NNSLocale_h    

#include "NNSObject.h"

#define js_value_NSLocale(x) js_value_wrapper(x, NSLocale)
#define to_value_NSLocale(x) to_value_wrapper(x, NSLocale)
#define is_value_NSLocale(x) is_value_wrapper(x, NSLocale)

#define js_value_NSLocaleKey(x) JS_ENUM(NSLocaleKey, NSString, x)
#define to_value_NSLocaleKey(x) TO_ENUM(NSLocaleKey, NSString, x)
#define is_value_NSLocaleKey(x) IS_ENUM(NSLocaleKey, NSString, x)

#define js_value_NSLocaleLanguageDirection(x) JS_ENUM(NSLocaleLanguageDirection, NSUInteger, x)
#define to_value_NSLocaleLanguageDirection(x) TO_ENUM(NSLocaleLanguageDirection, NSUInteger, x)
#define is_value_NSLocaleLanguageDirection(x) IS_ENUM(NSLocaleLanguageDirection, NSUInteger, x)

JS_WRAP_CLASS(NSLocale, NSObject);
  JS_STATIC_METHOD(localeWithLocaleIdentifier);
  JS_STATIC_METHOD(componentsFromLocaleIdentifier);
  JS_STATIC_METHOD(localeIdentifierFromComponents);
  JS_STATIC_METHOD(canonicalLocaleIdentifierFromString);
  JS_STATIC_METHOD(canonicalLanguageIdentifierFromString);
  JS_STATIC_METHOD(localeIdentifierFromWindowsLocaleCode);
  JS_STATIC_METHOD(windowsLocaleCodeFromLocaleIdentifier);
  JS_STATIC_METHOD(characterDirectionForLanguage);
  JS_STATIC_METHOD(lineDirectionForLanguage);
  JS_METHOD(objectForKey);
  JS_METHOD(displayNameForKeyValue);
  JS_METHOD(initWithLocaleIdentifier);
  JS_METHOD(initWithCoder);
  JS_METHOD(localizedStringForLocaleIdentifier);
  JS_METHOD(localizedStringForLanguageCode);
  JS_METHOD(localizedStringForCountryCode);
  JS_METHOD(localizedStringForScriptCode);
  JS_METHOD(localizedStringForVariantCode);
  JS_METHOD(localizedStringForCalendarIdentifier);
  JS_METHOD(localizedStringForCollationIdentifier);
  JS_METHOD(localizedStringForCurrencyCode);
  JS_METHOD(localizedStringForCollatorIdentifier);
  JS_PROP_READONLY(localeIdentifier);
  JS_PROP_READONLY(languageCode);
  JS_PROP_READONLY(countryCode);
  JS_PROP_READONLY(scriptCode);
  JS_PROP_READONLY(variantCode);
  JS_PROP_READONLY(exemplarCharacterSet);
  JS_PROP_READONLY(calendarIdentifier);
  JS_PROP_READONLY(collationIdentifier);
  JS_PROP_READONLY(usesMetricSystem);
  JS_PROP_READONLY(decimalSeparator);
  JS_PROP_READONLY(groupingSeparator);
  JS_PROP_READONLY(currencySymbol);
  JS_PROP_READONLY(currencyCode);
  JS_PROP_READONLY(collatorIdentifier);
  JS_PROP_READONLY(quotationBeginDelimiter);
  JS_PROP_READONLY(quotationEndDelimiter);
  JS_PROP_READONLY(alternateQuotationBeginDelimiter);
  JS_PROP_READONLY(alternateQuotationEndDelimiter);
  JS_STATIC_PROP_READONLY(autoupdatingCurrentLocale);
  JS_STATIC_PROP_READONLY(currentLocale);
  JS_STATIC_PROP_READONLY(systemLocale);
  JS_STATIC_PROP_READONLY(availableLocaleIdentifiers);
  JS_STATIC_PROP_READONLY(ISOLanguageCodes);
  JS_STATIC_PROP_READONLY(ISOCountryCodes);
  JS_STATIC_PROP_READONLY(ISOCurrencyCodes);
  JS_STATIC_PROP_READONLY(commonISOCurrencyCodes);
  JS_STATIC_PROP_READONLY(preferredLanguages);
JS_WRAP_CLASS_END(NSLocale);

#endif /* NNSLocale_h */
