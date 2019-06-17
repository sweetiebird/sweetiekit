//
//  NUIUserNotificationSettings.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIUserNotificationSettings.h"

#define instancetype UIUserNotificationSettings
#define js_value_instancetype js_value_UIUserNotificationSettings

NUIUserNotificationSettings::NUIUserNotificationSettings() {}
NUIUserNotificationSettings::~NUIUserNotificationSettings() {}

JS_INIT_CLASS(UIUserNotificationSettings, NSObject);
  // instance members (proto)
// UIUserNotificationSettings
  JS_ASSIGN_STATIC_METHOD(settingsForTypesCategories);
#if TODO
// UIUserNotificationCategory
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(actionsForContext);
// UIMutableUserNotificationCategory
  JS_ASSIGN_PROTO_METHOD(setActionsForContext);
// UIUserNotificationAction
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
#endif
// UIUserNotificationSettings
  JS_ASSIGN_PROTO_PROP_READONLY(types);
  JS_ASSIGN_PROTO_PROP_READONLY(categories);
#if TODO
// UIUserNotificationCategory
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
// UIMutableUserNotificationCategory
  JS_ASSIGN_PROTO_PROP(identifier);
// UIUserNotificationAction
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP_READONLY(title);
  JS_ASSIGN_PROTO_PROP_READONLY(behavior);
  JS_ASSIGN_PROTO_PROP_READONLY(parameters);
  JS_ASSIGN_PROTO_PROP_READONLY(activationMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isAuthenticationRequired);
  JS_ASSIGN_PROTO_PROP_READONLY(isDestructive);
// UIMutableUserNotificationAction
  JS_ASSIGN_PROTO_PROP(identifier);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(behavior);
  JS_ASSIGN_PROTO_PROP(parameters);
  JS_ASSIGN_PROTO_PROP(activationMode);
  JS_ASSIGN_PROTO_PROP(isAuthenticationRequired);
  JS_ASSIGN_PROTO_PROP(isDestructive);
#endif

  // static members (ctor)
  JS_INIT_CTOR(UIUserNotificationSettings, NSObject);
  // constant values (exports)
  

//typedef NS_OPTIONS(NSUInteger, UIUserNotificationType) {
    JS_ASSIGN_ENUM(UIUserNotificationTypeNone, NSUInteger); //    = 0,      // the application may not present any UI upon a notification being received
    JS_ASSIGN_ENUM(UIUserNotificationTypeBadge, NSUInteger); //   = 1 << 0, // the application may badge its icon upon a notification being received
    JS_ASSIGN_ENUM(UIUserNotificationTypeSound, NSUInteger); //   = 1 << 1, // the application may play a sound upon a notification being received
    JS_ASSIGN_ENUM(UIUserNotificationTypeAlert, NSUInteger); //   = 1 << 2, // the application may display an alert upon a notification being received
//} NS_ENUM_DEPRECATED_IOS(8_0, 10_0, "Use UserNotifications Framework's UNAuthorizationOptions") __TVOS_PROHIBITED;
  
  
JS_INIT_CLASS_END(UIUserNotificationSettings, NSObject);

NAN_METHOD(NUIUserNotificationSettings::New) {
  JS_RECONSTRUCT(UIUserNotificationSettings);
  @autoreleasepool {
    UIUserNotificationSettings* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIUserNotificationSettings *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UIUserNotificationSettings alloc] init];
    }
    if (self) {
      NUIUserNotificationSettings *wrapper = new NUIUserNotificationSettings();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIUserNotificationSettings::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIUserNotificationSettings::settingsForTypesCategories) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserNotificationType, types);
    declare_nullable_pointer(NSSet/* <UIUserNotificationCategory*>*/, categories);
    JS_SET_RETURN(js_value_instancetype([UIUserNotificationSettings settingsForTypes: types categories: categories]));
  }
}

#if TODO

NAN_METHOD(NUIUserNotificationCategory::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIUserNotificationCategory alloc] init]));
  }
}

NAN_METHOD(NUIUserNotificationCategory::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([[UIUserNotificationCategory alloc] initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUIUserNotificationCategory::actionsForContext) {
  JS_UNWRAP(UIUserNotificationCategory, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIUserNotificationActionContext, context);
    JS_SET_RETURN(js_value_NSArray<UIUserNotificationAction*>([self actionsForContext: context]));
  }
}

NAN_METHOD(NUIMutableUserNotificationCategory::setActionsForContext) {
  JS_UNWRAP(UIMutableUserNotificationCategory, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UIUserNotificationAction*>, actions);
    declare_value(UIUserNotificationActionContext, context);
    [self setActions: actions forContext: context];
  }
}

NAN_METHOD(NUIUserNotificationAction::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[UIUserNotificationAction alloc] init]));
  }
}

NAN_METHOD(NUIUserNotificationAction::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([[UIUserNotificationAction alloc] initWithCoder: aDecoder]));
  }
}
#endif

NAN_GETTER(NUIUserNotificationSettings::typesGetter) {
  JS_UNWRAP(UIUserNotificationSettings, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationType([self types]));
  }
}

NAN_GETTER(NUIUserNotificationSettings::categoriesGetter) {
  JS_UNWRAP(UIUserNotificationSettings, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <UIUserNotificationCategory*>*/([self categories]));
  }
}

#if TODO

NAN_GETTER(NUIUserNotificationCategory::identifierGetter) {
  JS_UNWRAP(UIUserNotificationCategory, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_GETTER(NUIMutableUserNotificationCategory::identifierGetter) {
  JS_UNWRAP(UIMutableUserNotificationCategory, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_SETTER(NUIMutableUserNotificationCategory::identifierSetter) {
  JS_UNWRAP(UIMutableUserNotificationCategory, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setIdentifier: input];
  }
}

NAN_GETTER(NUIUserNotificationAction::identifierGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_GETTER(NUIUserNotificationAction::titleGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_GETTER(NUIUserNotificationAction::behaviorGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationActionBehavior([self behavior]));
  }
}

NAN_GETTER(NUIUserNotificationAction::parametersGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self parameters]));
  }
}

NAN_GETTER(NUIUserNotificationAction::activationModeGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationActivationMode([self activationMode]));
  }
}

NAN_GETTER(NUIUserNotificationAction::isAuthenticationRequiredGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAuthenticationRequired]));
  }
}

NAN_GETTER(NUIUserNotificationAction::isDestructiveGetter) {
  JS_UNWRAP(UIUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDestructive]));
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::identifierGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::identifierSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setIdentifier: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::titleGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::titleSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::behaviorGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationActionBehavior([self behavior]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::behaviorSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIUserNotificationActionBehavior, input);
    [self setBehavior: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::parametersGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary([self parameters]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::parametersSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSDictionary, input);
    [self setParameters: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::activationModeGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationActivationMode([self activationMode]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::activationModeSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIUserNotificationActivationMode, input);
    [self setActivationMode: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::isAuthenticationRequiredGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAuthenticationRequired]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::isAuthenticationRequiredSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAuthenticationRequired: input];
  }
}

NAN_GETTER(NUIMutableUserNotificationAction::isDestructiveGetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDestructive]));
  }
}

NAN_SETTER(NUIMutableUserNotificationAction::isDestructiveSetter) {
  JS_UNWRAP(UIMutableUserNotificationAction, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDestructive: input];
  }
}
#endif
