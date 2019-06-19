//
//  NUILocalNotification.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUILocalNotification.h"

#define instancetype UILocalNotification
#define js_value_instancetype js_value_UILocalNotification

NUILocalNotification::NUILocalNotification() {}
NUILocalNotification::~NUILocalNotification() {}

JS_INIT_CLASS(UILocalNotification, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_PROP(fireDate);
  JS_ASSIGN_PROTO_PROP(timeZone);
  JS_ASSIGN_PROTO_PROP(repeatInterval);
  JS_ASSIGN_PROTO_PROP(repeatCalendar);
  JS_ASSIGN_PROTO_PROP(region);
  JS_ASSIGN_PROTO_PROP(regionTriggersOnce);
  JS_ASSIGN_PROTO_PROP(alertBody);
  JS_ASSIGN_PROTO_PROP(hasAction);
  JS_ASSIGN_PROTO_PROP(alertAction);
  JS_ASSIGN_PROTO_PROP(alertLaunchImage);
  JS_ASSIGN_PROTO_PROP(alertTitle);
  JS_ASSIGN_PROTO_PROP(soundName);
  JS_ASSIGN_PROTO_PROP(applicationIconBadgeNumber);
  JS_ASSIGN_PROTO_PROP(userInfo);
  JS_ASSIGN_PROTO_PROP(category);
  // static members (ctor)
  JS_INIT_CTOR(UILocalNotification, NSObject);
  // constant values (exports)

JS_INIT_CLASS_END(UILocalNotification, NSObject);

NAN_METHOD(NUILocalNotification::New) {
  JS_RECONSTRUCT(UILocalNotification);
  @autoreleasepool {
    UILocalNotification* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UILocalNotification *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UILocalNotification alloc] init];
    }
    if (self) {
      NUILocalNotification *wrapper = new NUILocalNotification();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UILocalNotification::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUILocalNotification::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UILocalNotification alloc] init]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUILocalNotification::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UILocalNotification, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUILocalNotification::fireDateGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self fireDate]));
  }
}

NAN_SETTER(NUILocalNotification::fireDateSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDate, input);
    [self setFireDate: input];
  }
}

#include "NNSTimeZone.h"

NAN_GETTER(NUILocalNotification::timeZoneGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeZone([self timeZone]));
  }
}

NAN_SETTER(NUILocalNotification::timeZoneSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSTimeZone, input);
    [self setTimeZone: input];
  }
}

#include "NNSCalendar.h"

NAN_GETTER(NUILocalNotification::repeatIntervalGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendarUnit([self repeatInterval]));
  }
}

NAN_SETTER(NUILocalNotification::repeatIntervalSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSCalendarUnit, input);
    [self setRepeatInterval: input];
  }
}

NAN_GETTER(NUILocalNotification::repeatCalendarGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCalendar([self repeatCalendar]));
  }
}

NAN_SETTER(NUILocalNotification::repeatCalendarSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSCalendar, input);
    [self setRepeatCalendar: input];
  }
}

#define js_value_CLRegion(x) js_value_wrapper_unknown(x, CLRegion)
#define to_value_CLRegion(x) to_value_wrapper_unknown(x, CLRegion)
#define is_value_CLRegion(x) is_value_wrapper_unknown(x, CLRegion)

NAN_GETTER(NUILocalNotification::regionGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLRegion([self region]));
  }
}

NAN_SETTER(NUILocalNotification::regionSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(CLRegion, input);
    [self setRegion: input];
  }
}

NAN_GETTER(NUILocalNotification::regionTriggersOnceGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self regionTriggersOnce]));
  }
}

NAN_SETTER(NUILocalNotification::regionTriggersOnceSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRegionTriggersOnce: input];
  }
}

NAN_GETTER(NUILocalNotification::alertBodyGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alertBody]));
  }
}

NAN_SETTER(NUILocalNotification::alertBodySetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setAlertBody: input];
  }
}

NAN_GETTER(NUILocalNotification::hasActionGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasAction]));
  }
}

NAN_SETTER(NUILocalNotification::hasActionSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHasAction: input];
  }
}

NAN_GETTER(NUILocalNotification::alertActionGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alertAction]));
  }
}

NAN_SETTER(NUILocalNotification::alertActionSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setAlertAction: input];
  }
}

NAN_GETTER(NUILocalNotification::alertLaunchImageGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alertLaunchImage]));
  }
}

NAN_SETTER(NUILocalNotification::alertLaunchImageSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setAlertLaunchImage: input];
  }
}

NAN_GETTER(NUILocalNotification::alertTitleGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alertTitle]));
  }
}

NAN_SETTER(NUILocalNotification::alertTitleSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setAlertTitle: input];
  }
}

NAN_GETTER(NUILocalNotification::soundNameGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self soundName]));
  }
}

NAN_SETTER(NUILocalNotification::soundNameSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setSoundName: input];
  }
}

NAN_GETTER(NUILocalNotification::applicationIconBadgeNumberGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self applicationIconBadgeNumber]));
  }
}

NAN_SETTER(NUILocalNotification::applicationIconBadgeNumberSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setApplicationIconBadgeNumber: input];
  }
}

NAN_GETTER(NUILocalNotification::userInfoGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self userInfo]));
  }
}

NAN_SETTER(NUILocalNotification::userInfoSetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary, input);
    [self setUserInfo: input];
  }
}

NAN_GETTER(NUILocalNotification::categoryGetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self category]));
  }
}

NAN_SETTER(NUILocalNotification::categorySetter) {
  JS_UNWRAP(UILocalNotification, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setCategory: input];
  }
}
