//
//  NNSTimeZone.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSTimeZone.h"

#define instancetype NSTimeZone
#define js_value_instancetype js_value_NSTimeZone

NNSTimeZone::NNSTimeZone() {}
NNSTimeZone::~NNSTimeZone() {}

JS_INIT_CLASS(NSTimeZone, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(resetSystemTimeZone);
  JS_ASSIGN_STATIC_METHOD(abbreviationDictionary);
  JS_ASSIGN_STATIC_METHOD(timeZoneWithName);
  JS_ASSIGN_STATIC_METHOD(timeZoneWithNameData);
  JS_ASSIGN_STATIC_METHOD(timeZoneForSecondsFromGMT);
  JS_ASSIGN_STATIC_METHOD(timeZoneWithAbbreviation);
  JS_ASSIGN_PROTO_METHOD(secondsFromGMTForDate);
  JS_ASSIGN_PROTO_METHOD(abbreviationForDate);
  JS_ASSIGN_PROTO_METHOD(isDaylightSavingTimeForDate);
  JS_ASSIGN_PROTO_METHOD(daylightSavingTimeOffsetForDate);
  JS_ASSIGN_PROTO_METHOD(nextDaylightSavingTimeTransitionAfterDate);
  JS_ASSIGN_PROTO_METHOD(isEqualToTimeZone);
  JS_ASSIGN_PROTO_METHOD(localizedNameLocale);
  JS_ASSIGN_STATIC_METHOD(initWithName);
  JS_ASSIGN_STATIC_METHOD(initWithNameData);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(data);
  JS_ASSIGN_STATIC_PROP_READONLY(systemTimeZone);
  JS_ASSIGN_STATIC_PROP(defaultTimeZone);
  JS_ASSIGN_STATIC_PROP_READONLY(localTimeZone);
  JS_ASSIGN_STATIC_PROP_READONLY(knownTimeZoneNames);
  JS_ASSIGN_STATIC_PROP(abbreviationDictionary);
  JS_ASSIGN_STATIC_PROP_READONLY(timeZoneDataVersion);
  JS_ASSIGN_PROTO_PROP_READONLY(secondsFromGMT);
  JS_ASSIGN_PROTO_PROP_READONLY(abbreviation);
  JS_ASSIGN_PROTO_PROP_READONLY(isDaylightSavingTime);
  JS_ASSIGN_PROTO_PROP_READONLY(daylightSavingTimeOffset);
  JS_ASSIGN_PROTO_PROP_READONLY(nextDaylightSavingTimeTransition);
  JS_ASSIGN_PROTO_PROP_READONLY(description);

  // static members (ctor)
  JS_INIT_CTOR(NSTimeZone, NSObject);
  // constant values (exports)

//typedef NS_ENUM(NSInteger, NSTimeZoneNameStyle) {
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleStandard, NSInteger);    // Central Standard Time
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleShortStandard, NSInteger);  // CST
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleDaylightSaving, NSInteger);  // Central Daylight Time
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleShortDaylightSaving, NSInteger);  // CDT
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleGeneric, NSInteger);    // Central Time
  JS_ASSIGN_ENUM(NSTimeZoneNameStyleShortGeneric, NSInteger);    // CT
//};
  
JS_INIT_CLASS_END(NSTimeZone, NSObject);

NAN_METHOD(NNSTimeZone::New) {
  JS_RECONSTRUCT(NSTimeZone);
  @autoreleasepool {
    NSTimeZone* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSTimeZone *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSTimeZone alloc] init];
    }
    if (self) {
      NNSTimeZone *wrapper = new NNSTimeZone();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSTimeZone::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSTimeZone::resetSystemTimeZone) {
  declare_autoreleasepool {
    [NSTimeZone resetSystemTimeZone];
  }
}

NAN_METHOD(NNSTimeZone::abbreviationDictionary) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSString*>*/([NSTimeZone abbreviationDictionary]));
  }
}

NAN_METHOD(NNSTimeZone::timeZoneWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, tzName);
    JS_SET_RETURN(js_value_instancetype([NSTimeZone timeZoneWithName: tzName]));
  }
}

NAN_METHOD(NNSTimeZone::timeZoneWithNameData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, tzName);
    declare_nullable_pointer(NSData, aData);
    JS_SET_RETURN(js_value_instancetype([NSTimeZone timeZoneWithName: tzName data: aData]));
  }
}

NAN_METHOD(NNSTimeZone::timeZoneForSecondsFromGMT) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, seconds);
    JS_SET_RETURN(js_value_instancetype([NSTimeZone timeZoneForSecondsFromGMT: seconds]));
  }
}

NAN_METHOD(NNSTimeZone::timeZoneWithAbbreviation) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, abbreviation);
    JS_SET_RETURN(js_value_instancetype([NSTimeZone timeZoneWithAbbreviation: abbreviation]));
  }
}

NAN_METHOD(NNSTimeZone::secondsFromGMTForDate) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, aDate);
    JS_SET_RETURN(js_value_NSInteger([self secondsFromGMTForDate: aDate]));
  }
}

NAN_METHOD(NNSTimeZone::abbreviationForDate) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, aDate);
    JS_SET_RETURN(js_value_NSString([self abbreviationForDate: aDate]));
  }
}

NAN_METHOD(NNSTimeZone::isDaylightSavingTimeForDate) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, aDate);
    JS_SET_RETURN(js_value_BOOL([self isDaylightSavingTimeForDate: aDate]));
  }
}

NAN_METHOD(NNSTimeZone::daylightSavingTimeOffsetForDate) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, aDate);
    JS_SET_RETURN(js_value_NSTimeInterval([self daylightSavingTimeOffsetForDate: aDate]));
  }
}

NAN_METHOD(NNSTimeZone::nextDaylightSavingTimeTransitionAfterDate) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, aDate);
    JS_SET_RETURN(js_value_NSDate([self nextDaylightSavingTimeTransitionAfterDate: aDate]));
  }
}

NAN_METHOD(NNSTimeZone::isEqualToTimeZone) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSTimeZone, aTimeZone);
    JS_SET_RETURN(js_value_BOOL([self isEqualToTimeZone: aTimeZone]));
  }
}

#include "NNSLocale.h"

NAN_METHOD(NNSTimeZone::localizedNameLocale) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeZoneNameStyle, style);
    declare_nullable_pointer(NSLocale, locale);
    JS_SET_RETURN(js_value_NSString([self localizedName: style locale: locale]));
  }
}

NAN_METHOD(NNSTimeZone::initWithName) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, tzName);
    JS_SET_RETURN(js_value_instancetype([[NSTimeZone alloc] initWithName: tzName]));
  }
}

NAN_METHOD(NNSTimeZone::initWithNameData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, tzName);
    declare_nullable_pointer(NSData, aData);
    JS_SET_RETURN(js_value_instancetype([[NSTimeZone alloc] initWithName: tzName data: aData]));
  }
}

NAN_GETTER(NNSTimeZone::nameGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NNSTimeZone::dataGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

NAN_GETTER(NNSTimeZone::systemTimeZoneGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([NSTimeZone systemTimeZone]));
  }
}

NAN_GETTER(NNSTimeZone::defaultTimeZoneGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([NSTimeZone defaultTimeZone]));
  }
}

NAN_SETTER(NNSTimeZone::defaultTimeZoneSetter) {
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSTimeZone, input);
    [NSTimeZone setDefaultTimeZone: input];
  }
}

NAN_GETTER(NNSTimeZone::localTimeZoneGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([NSTimeZone localTimeZone]));
  }
}

NAN_GETTER(NNSTimeZone::knownTimeZoneNamesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSTimeZone knownTimeZoneNames]));
  }
}

NAN_GETTER(NNSTimeZone::abbreviationDictionaryGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, NSString*>*/([NSTimeZone abbreviationDictionary]));
  }
}

NAN_SETTER(NNSTimeZone::abbreviationDictionarySetter) {
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary/* <NSString*, NSString*>*/, input);
    [NSTimeZone setAbbreviationDictionary: input];
  }
}

NAN_GETTER(NNSTimeZone::timeZoneDataVersionGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([NSTimeZone timeZoneDataVersion]));
  }
}

NAN_GETTER(NNSTimeZone::secondsFromGMTGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self secondsFromGMT]));
  }
}

NAN_GETTER(NNSTimeZone::abbreviationGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self abbreviation]));
  }
}

NAN_GETTER(NNSTimeZone::isDaylightSavingTimeGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDaylightSavingTime]));
  }
}

NAN_GETTER(NNSTimeZone::daylightSavingTimeOffsetGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self daylightSavingTimeOffset]));
  }
}

NAN_GETTER(NNSTimeZone::nextDaylightSavingTimeTransitionGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self nextDaylightSavingTimeTransition]));
  }
}

NAN_GETTER(NNSTimeZone::descriptionGetter) {
  JS_UNWRAP(NSTimeZone, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self description]));
  }
}

