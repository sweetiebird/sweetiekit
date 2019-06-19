//
//  NNSLocale.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSLocale.h"

#define instancetype NSLocale
#define js_value_instancetype js_value_NSLocale

NNSLocale::NNSLocale() {}
NNSLocale::~NNSLocale() {}

JS_INIT_CLASS(NSLocale, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(localeWithLocaleIdentifier);
  JS_ASSIGN_STATIC_METHOD(componentsFromLocaleIdentifier);
  JS_ASSIGN_STATIC_METHOD(localeIdentifierFromComponents);
  JS_ASSIGN_STATIC_METHOD(canonicalLocaleIdentifierFromString);
  JS_ASSIGN_STATIC_METHOD(canonicalLanguageIdentifierFromString);
  JS_ASSIGN_STATIC_METHOD(localeIdentifierFromWindowsLocaleCode);
  JS_ASSIGN_STATIC_METHOD(windowsLocaleCodeFromLocaleIdentifier);
  JS_ASSIGN_STATIC_METHOD(characterDirectionForLanguage);
  JS_ASSIGN_STATIC_METHOD(lineDirectionForLanguage);
  JS_ASSIGN_PROTO_METHOD(objectForKey);
  JS_ASSIGN_PROTO_METHOD(displayNameForKeyValue);
  JS_ASSIGN_PROTO_METHOD(initWithLocaleIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(localizedStringForLocaleIdentifier);
  JS_ASSIGN_PROTO_METHOD(localizedStringForLanguageCode);
  JS_ASSIGN_PROTO_METHOD(localizedStringForCountryCode);
  JS_ASSIGN_PROTO_METHOD(localizedStringForScriptCode);
  JS_ASSIGN_PROTO_METHOD(localizedStringForVariantCode);
  JS_ASSIGN_PROTO_METHOD(localizedStringForCalendarIdentifier);
  JS_ASSIGN_PROTO_METHOD(localizedStringForCollationIdentifier);
  JS_ASSIGN_PROTO_METHOD(localizedStringForCurrencyCode);
  JS_ASSIGN_PROTO_METHOD(localizedStringForCollatorIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(localeIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(languageCode);
  JS_ASSIGN_PROTO_PROP_READONLY(countryCode);
  JS_ASSIGN_PROTO_PROP_READONLY(scriptCode);
  JS_ASSIGN_PROTO_PROP_READONLY(variantCode);
  JS_ASSIGN_PROTO_PROP_READONLY(exemplarCharacterSet);
  JS_ASSIGN_PROTO_PROP_READONLY(calendarIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(collationIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(usesMetricSystem);
  JS_ASSIGN_PROTO_PROP_READONLY(decimalSeparator);
  JS_ASSIGN_PROTO_PROP_READONLY(groupingSeparator);
  JS_ASSIGN_PROTO_PROP_READONLY(currencySymbol);
  JS_ASSIGN_PROTO_PROP_READONLY(currencyCode);
  JS_ASSIGN_PROTO_PROP_READONLY(collatorIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(quotationBeginDelimiter);
  JS_ASSIGN_PROTO_PROP_READONLY(quotationEndDelimiter);
  JS_ASSIGN_PROTO_PROP_READONLY(alternateQuotationBeginDelimiter);
  JS_ASSIGN_PROTO_PROP_READONLY(alternateQuotationEndDelimiter);
  JS_ASSIGN_STATIC_PROP_READONLY(autoupdatingCurrentLocale);
  JS_ASSIGN_STATIC_PROP_READONLY(currentLocale);
  JS_ASSIGN_STATIC_PROP_READONLY(systemLocale);
  JS_ASSIGN_STATIC_PROP_READONLY(availableLocaleIdentifiers);
  JS_ASSIGN_STATIC_PROP_READONLY(ISOLanguageCodes);
  JS_ASSIGN_STATIC_PROP_READONLY(ISOCountryCodes);
  JS_ASSIGN_STATIC_PROP_READONLY(ISOCurrencyCodes);
  JS_ASSIGN_STATIC_PROP_READONLY(commonISOCurrencyCodes);
  JS_ASSIGN_STATIC_PROP_READONLY(preferredLanguages);

  // static members (ctor)
  JS_INIT_CTOR(NSLocale, NSObject);
  // constant values (exports)
  

//typedef NS_ENUM(NSUInteger, NSLocaleLanguageDirection) {
  JS_ASSIGN_ENUM(NSLocaleLanguageDirectionUnknown, NSUInteger); // = CFLocaleLanguageDirectionUnknown,
  JS_ASSIGN_ENUM(NSLocaleLanguageDirectionLeftToRight, NSUInteger); // = CFLocaleLanguageDirectionLeftToRight,
  JS_ASSIGN_ENUM(NSLocaleLanguageDirectionRightToLeft, NSUInteger); // = CFLocaleLanguageDirectionRightToLeft,
  JS_ASSIGN_ENUM(NSLocaleLanguageDirectionTopToBottom, NSUInteger); // = CFLocaleLanguageDirectionTopToBottom,
  JS_ASSIGN_ENUM(NSLocaleLanguageDirectionBottomToTop, NSUInteger); // = CFLocaleLanguageDirectionBottomToTop
//};

JS_INIT_CLASS_END(NSLocale, NSObject);

NAN_METHOD(NNSLocale::New) {
  JS_RECONSTRUCT(NSLocale);
  @autoreleasepool {
    NSLocale* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSLocale *)(info[0].As<External>()->Value());
    }
    if (self) {
      NNSLocale *wrapper = new NNSLocale();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSLocale::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSLocale::localeWithLocaleIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, ident);
    JS_SET_RETURN(js_value_instancetype([NSLocale localeWithLocaleIdentifier: ident]));
  }
}

NAN_METHOD(NNSLocale::componentsFromLocaleIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSString*>*/([NSLocale componentsFromLocaleIdentifier: string]));
  }
}

NAN_METHOD(NNSLocale::localeIdentifierFromComponents) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, NSString*>*/, dict);
    JS_SET_RETURN(js_value_NSString([NSLocale localeIdentifierFromComponents: dict]));
  }
}

NAN_METHOD(NNSLocale::canonicalLocaleIdentifierFromString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_NSString([NSLocale canonicalLocaleIdentifierFromString: string]));
  }
}

NAN_METHOD(NNSLocale::canonicalLanguageIdentifierFromString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_NSString([NSLocale canonicalLanguageIdentifierFromString: string]));
  }
}

NAN_METHOD(NNSLocale::localeIdentifierFromWindowsLocaleCode) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, lcid);
    JS_SET_RETURN(js_value_NSString([NSLocale localeIdentifierFromWindowsLocaleCode: lcid]));
  }
}

NAN_METHOD(NNSLocale::windowsLocaleCodeFromLocaleIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, localeIdentifier);
    JS_SET_RETURN(js_value_uint32_t([NSLocale windowsLocaleCodeFromLocaleIdentifier: localeIdentifier]));
  }
}

NAN_METHOD(NNSLocale::characterDirectionForLanguage) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, isoLangCode);
    JS_SET_RETURN(js_value_NSLocaleLanguageDirection([NSLocale characterDirectionForLanguage: isoLangCode]));
  }
}

NAN_METHOD(NNSLocale::lineDirectionForLanguage) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, isoLangCode);
    JS_SET_RETURN(js_value_NSLocaleLanguageDirection([NSLocale lineDirectionForLanguage: isoLangCode]));
  }
}

NAN_METHOD(NNSLocale::objectForKey) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSLocaleKey, key);
    JS_SET_RETURN(js_value_id([self objectForKey: key]));
  }
}

NAN_METHOD(NNSLocale::displayNameForKeyValue) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSLocaleKey, key);
    declare_value(id, value);
    JS_SET_RETURN(js_value_NSString([self displayNameForKey: key value: value]));
  }
}

NAN_METHOD(NNSLocale::initWithLocaleIdentifier) {
  JS_UNWRAP_OR_ALLOC(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([self initWithLocaleIdentifier: string]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NNSLocale::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForLocaleIdentifier) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, localeIdentifier);
    JS_SET_RETURN(js_value_NSString([self localizedStringForLocaleIdentifier: localeIdentifier]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForLanguageCode) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, languageCode);
    JS_SET_RETURN(js_value_NSString([self localizedStringForLanguageCode: languageCode]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForCountryCode) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, countryCode);
    JS_SET_RETURN(js_value_NSString([self localizedStringForCountryCode: countryCode]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForScriptCode) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, scriptCode);
    JS_SET_RETURN(js_value_NSString([self localizedStringForScriptCode: scriptCode]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForVariantCode) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, variantCode);
    JS_SET_RETURN(js_value_NSString([self localizedStringForVariantCode: variantCode]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForCalendarIdentifier) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, calendarIdentifier);
    JS_SET_RETURN(js_value_NSString([self localizedStringForCalendarIdentifier: calendarIdentifier]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForCollationIdentifier) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, collationIdentifier);
    JS_SET_RETURN(js_value_NSString([self localizedStringForCollationIdentifier: collationIdentifier]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForCurrencyCode) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, currencyCode);
    JS_SET_RETURN(js_value_NSString([self localizedStringForCurrencyCode: currencyCode]));
  }
}

NAN_METHOD(NNSLocale::localizedStringForCollatorIdentifier) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, collatorIdentifier);
    JS_SET_RETURN(js_value_NSString([self localizedStringForCollatorIdentifier: collatorIdentifier]));
  }
}

NAN_GETTER(NNSLocale::localeIdentifierGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self localeIdentifier]));
  }
}

NAN_GETTER(NNSLocale::languageCodeGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self languageCode]));
  }
}

NAN_GETTER(NNSLocale::countryCodeGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self countryCode]));
  }
}

NAN_GETTER(NNSLocale::scriptCodeGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self scriptCode]));
  }
}

NAN_GETTER(NNSLocale::variantCodeGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self variantCode]));
  }
}

#include "NNSCharacterSet.h"

NAN_GETTER(NNSLocale::exemplarCharacterSetGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([self exemplarCharacterSet]));
  }
}

NAN_GETTER(NNSLocale::calendarIdentifierGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self calendarIdentifier]));
  }
}

NAN_GETTER(NNSLocale::collationIdentifierGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self collationIdentifier]));
  }
}

NAN_GETTER(NNSLocale::usesMetricSystemGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesMetricSystem]));
  }
}

NAN_GETTER(NNSLocale::decimalSeparatorGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self decimalSeparator]));
  }
}

NAN_GETTER(NNSLocale::groupingSeparatorGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self groupingSeparator]));
  }
}

NAN_GETTER(NNSLocale::currencySymbolGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self currencySymbol]));
  }
}

NAN_GETTER(NNSLocale::currencyCodeGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self currencyCode]));
  }
}

NAN_GETTER(NNSLocale::collatorIdentifierGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self collatorIdentifier]));
  }
}

NAN_GETTER(NNSLocale::quotationBeginDelimiterGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self quotationBeginDelimiter]));
  }
}

NAN_GETTER(NNSLocale::quotationEndDelimiterGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self quotationEndDelimiter]));
  }
}

NAN_GETTER(NNSLocale::alternateQuotationBeginDelimiterGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alternateQuotationBeginDelimiter]));
  }
}

NAN_GETTER(NNSLocale::alternateQuotationEndDelimiterGetter) {
  JS_UNWRAP(NSLocale, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alternateQuotationEndDelimiter]));
  }
}

NAN_GETTER(NNSLocale::autoupdatingCurrentLocaleGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLocale([NSLocale autoupdatingCurrentLocale]));
  }
}

NAN_GETTER(NNSLocale::currentLocaleGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLocale([NSLocale currentLocale]));
  }
}

NAN_GETTER(NNSLocale::systemLocaleGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSLocale([NSLocale systemLocale]));
  }
}

NAN_GETTER(NNSLocale::availableLocaleIdentifiersGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale availableLocaleIdentifiers]));
  }
}

NAN_GETTER(NNSLocale::ISOLanguageCodesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale ISOLanguageCodes]));
  }
}

NAN_GETTER(NNSLocale::ISOCountryCodesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale ISOCountryCodes]));
  }
}

NAN_GETTER(NNSLocale::ISOCurrencyCodesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale ISOCurrencyCodes]));
  }
}

NAN_GETTER(NNSLocale::commonISOCurrencyCodesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale commonISOCurrencyCodes]));
  }
}

NAN_GETTER(NNSLocale::preferredLanguagesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSLocale preferredLanguages]));
  }
}
