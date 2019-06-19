//
//  NUIUserNotificationSettings.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIUserNotificationSettings_h
#define NUIUserNotificationSettings_h    

#include "NNSObject.h"

#define js_value_UIUserNotificationSettings(x) js_value_wrapper(x, UIUserNotificationSettings)
#define to_value_UIUserNotificationSettings(x) to_value_wrapper(x, UIUserNotificationSettings)
#define is_value_UIUserNotificationSettings(x) is_value_wrapper(x, UIUserNotificationSettings)

#define js_value_UIUserNotificationType(x) JS_OPTS(UIUserNotificationType, NSUInteger, x)
#define to_value_UIUserNotificationType(x) TO_OPTS(UIUserNotificationType, NSUInteger, x)
#define is_value_UIUserNotificationType(x) IS_OPTS(UIUserNotificationType, NSUInteger, x)

JS_WRAP_CLASS(UIUserNotificationSettings, NSObject);
// UIUserNotificationSettings
  JS_STATIC_METHOD(settingsForTypesCategories);
#if TODO
// UIUserNotificationCategory
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(actionsForContext);
// UIMutableUserNotificationCategory
  JS_METHOD(setActionsForContext);
// UIUserNotificationAction
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
#endif
// UIUserNotificationSettings
  JS_PROP_READONLY(types);
  JS_PROP_READONLY(categories);
#if TODO
// UIUserNotificationCategory
  JS_PROP_READONLY(identifier);
// UIMutableUserNotificationCategory
  JS_PROP(identifier);
// UIUserNotificationAction
  JS_PROP_READONLY(identifier);
  JS_PROP_READONLY(title);
  JS_PROP_READONLY(behavior);
  JS_PROP_READONLY(parameters);
  JS_PROP_READONLY(activationMode);
  JS_PROP_READONLY(isAuthenticationRequired);
  JS_PROP_READONLY(isDestructive);
// UIMutableUserNotificationAction
  JS_PROP(identifier);
  JS_PROP(title);
  JS_PROP(behavior);
  JS_PROP(parameters);
  JS_PROP(activationMode);
  JS_PROP(isAuthenticationRequired);
  JS_PROP(isDestructive);
#endif

JS_WRAP_CLASS_END(UIUserNotificationSettings);

#endif /* NUIUserNotificationSettings_h */
