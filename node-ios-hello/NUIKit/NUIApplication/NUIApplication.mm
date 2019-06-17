//
//  NUIApplication.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIApplication.h"

NUIApplication::NUIApplication() {}
NUIApplication::~NUIApplication() {}

JS_INIT_CLASS(UIApplication, NSObject);
  // instance members (proto)
  JS_ASSIGN_STATIC_METHOD(sharedApplication);
  JS_ASSIGN_STATIC_METHOD(registerObjectForStateRestorationRestorationIdentifier);
  JS_ASSIGN_PROTO_METHOD(beginIgnoringInteractionEvents);
  JS_ASSIGN_PROTO_METHOD(endIgnoringInteractionEvents);
  JS_ASSIGN_PROTO_METHOD(isIgnoringInteractionEvents);
  JS_ASSIGN_PROTO_METHOD(openURL);
  JS_ASSIGN_PROTO_METHOD(canOpenURL);
  JS_ASSIGN_PROTO_METHOD(openURLOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(sendEvent);
  JS_ASSIGN_PROTO_METHOD(sendActionToFromForEvent);
  JS_ASSIGN_PROTO_METHOD(supportedInterfaceOrientationsForWindow);
  JS_ASSIGN_PROTO_METHOD(beginBackgroundTaskWithExpirationHandler);
  JS_ASSIGN_PROTO_METHOD(beginBackgroundTaskWithNameExpirationHandler);
  JS_ASSIGN_PROTO_METHOD(endBackgroundTask);
  JS_ASSIGN_PROTO_METHOD(setMinimumBackgroundFetchInterval);
  JS_ASSIGN_PROTO_METHOD(registerForRemoteNotifications);
  JS_ASSIGN_PROTO_METHOD(unregisterForRemoteNotifications);
  JS_ASSIGN_PROTO_METHOD(isRegisteredForRemoteNotifications);
  JS_ASSIGN_PROTO_METHOD(registerForRemoteNotificationTypes);
  JS_ASSIGN_PROTO_METHOD(enabledRemoteNotificationTypes);
  JS_ASSIGN_PROTO_METHOD(presentLocalNotificationNow);
  JS_ASSIGN_PROTO_METHOD(scheduleLocalNotification);
  JS_ASSIGN_PROTO_METHOD(cancelLocalNotification);
  JS_ASSIGN_PROTO_METHOD(cancelAllLocalNotifications);
  JS_ASSIGN_PROTO_METHOD(registerUserNotificationSettings);
  JS_ASSIGN_PROTO_METHOD(currentUserNotificationSettings);
  JS_ASSIGN_PROTO_METHOD(beginReceivingRemoteControlEvents);
  JS_ASSIGN_PROTO_METHOD(endReceivingRemoteControlEvents);
  JS_ASSIGN_PROTO_METHOD(setNewsstandIconImage);
  JS_ASSIGN_PROTO_METHOD(setAlternateIconNameCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(extendStateRestoration);
  JS_ASSIGN_PROTO_METHOD(completeStateRestoration);
  JS_ASSIGN_PROTO_METHOD(ignoreSnapshotOnNextApplicationLaunch);
#if TODO
// UIApplicationDelegate<NSObject>
  JS_ASSIGN_PROTO_METHOD(applicationDidFinishLaunching);
  JS_ASSIGN_PROTO_METHOD(applicationWillFinishLaunchingWithOptions);
  JS_ASSIGN_PROTO_METHOD(applicationDidFinishLaunchingWithOptions);
  JS_ASSIGN_PROTO_METHOD(applicationWillFinishLaunchingWithOptions);
  JS_ASSIGN_PROTO_METHOD(applicationDidFinishLaunchingWithOptions);
  JS_ASSIGN_PROTO_METHOD(applicationDidBecomeActive);
  JS_ASSIGN_PROTO_METHOD(applicationWillResignActive);
  JS_ASSIGN_PROTO_METHOD(applicationHandleOpenURL);
  JS_ASSIGN_PROTO_METHOD(applicationOpenURLSourceApplicationAnnotation);
  JS_ASSIGN_PROTO_METHOD(applicationOpenURLOptions);
  JS_ASSIGN_PROTO_METHOD(applicationDidReceiveMemoryWarning);
  JS_ASSIGN_PROTO_METHOD(applicationWillTerminate);
  JS_ASSIGN_PROTO_METHOD(applicationSignificantTimeChange);
  JS_ASSIGN_PROTO_METHOD(applicationWillChangeStatusBarOrientationDuration);
  JS_ASSIGN_PROTO_METHOD(applicationDidChangeStatusBarOrientation);
  JS_ASSIGN_PROTO_METHOD(applicationWillChangeStatusBarFrame);
  JS_ASSIGN_PROTO_METHOD(applicationDidChangeStatusBarFrame);
  JS_ASSIGN_PROTO_METHOD(applicationDidRegisterUserNotificationSettings);
  JS_ASSIGN_PROTO_METHOD(applicationDidRegisterForRemoteNotificationsWithDeviceToken);
  JS_ASSIGN_PROTO_METHOD(applicationDidFailToRegisterForRemoteNotificationsWithError);
  JS_ASSIGN_PROTO_METHOD(applicationDidReceiveRemoteNotification);
  JS_ASSIGN_PROTO_METHOD(applicationDidReceiveLocalNotification);
  JS_ASSIGN_PROTO_METHOD(applicationHandleActionWithIdentifierForLocalNotificationCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationHandleActionWithIdentifierForRemoteNotificationWithResponseInfoCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationHandleActionWithIdentifierForRemoteNotificationCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationHandleActionWithIdentifierForLocalNotificationWithResponseInfoCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationDidReceiveRemoteNotificationFetchCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationPerformFetchWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationPerformActionForShortcutItemCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationHandleEventsForBackgroundURLSessionCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationHandleWatchKitExtensionRequestReply);
  JS_ASSIGN_PROTO_METHOD(applicationShouldRequestHealthAuthorization);
  JS_ASSIGN_PROTO_METHOD(applicationHandleIntentCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(applicationDidEnterBackground);
  JS_ASSIGN_PROTO_METHOD(applicationWillEnterForeground);
  JS_ASSIGN_PROTO_METHOD(applicationProtectedDataWillBecomeUnavailable);
  JS_ASSIGN_PROTO_METHOD(applicationProtectedDataDidBecomeAvailable);
  JS_ASSIGN_PROTO_METHOD(applicationSupportedInterfaceOrientationsForWindow);
  JS_ASSIGN_PROTO_METHOD(applicationShouldAllowExtensionPointIdentifier);
  JS_ASSIGN_PROTO_METHOD(applicationViewControllerWithRestorationIdentifierPathCoder);
  JS_ASSIGN_PROTO_METHOD(applicationShouldSaveApplicationState);
  JS_ASSIGN_PROTO_METHOD(applicationShouldRestoreApplicationState);
  JS_ASSIGN_PROTO_METHOD(applicationWillEncodeRestorableStateWithCoder);
  JS_ASSIGN_PROTO_METHOD(applicationDidDecodeRestorableStateWithCoder);
  JS_ASSIGN_PROTO_METHOD(applicationWillContinueUserActivityWithType);
  JS_ASSIGN_PROTO_METHOD(applicationContinueUserActivityRestorationHandler);
  JS_ASSIGN_PROTO_METHOD(applicationDidFailToContinueUserActivityWithTypeError);
  JS_ASSIGN_PROTO_METHOD(applicationDidUpdateUserActivity);
  JS_ASSIGN_PROTO_METHOD(applicationUserDidAcceptCloudKitShareWithMetadata);
#endif
// UIApplication
  JS_ASSIGN_PROTO_METHOD(setStatusBarHiddenAnimated);
  JS_ASSIGN_PROTO_METHOD(setStatusBarOrientationAnimated);
  JS_ASSIGN_PROTO_METHOD(setStatusBarStyleAnimated);
  JS_ASSIGN_PROTO_METHOD(setStatusBarHiddenWithAnimation);
  JS_ASSIGN_PROTO_METHOD(setKeepAliveTimeoutHandler);
  JS_ASSIGN_PROTO_METHOD(clearKeepAliveTimeout);
  JS_ASSIGN_STATIC_PROP_READONLY(sharedApplication);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(isIgnoringInteractionEvents);
  JS_ASSIGN_PROTO_PROP(isIdleTimerDisabled);
  JS_ASSIGN_PROTO_PROP_READONLY(keyWindow);
  JS_ASSIGN_PROTO_PROP_READONLY(windows);
  JS_ASSIGN_PROTO_PROP(isNetworkActivityIndicatorVisible);
  JS_ASSIGN_PROTO_PROP_READONLY(statusBarStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(isStatusBarHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(statusBarOrientation);
  JS_ASSIGN_PROTO_PROP_READONLY(statusBarOrientationAnimationDuration);
  JS_ASSIGN_PROTO_PROP_READONLY(statusBarFrame);
  JS_ASSIGN_PROTO_PROP(applicationIconBadgeNumber);
  JS_ASSIGN_PROTO_PROP(applicationSupportsShakeToEdit);
  JS_ASSIGN_PROTO_PROP_READONLY(applicationState);
  JS_ASSIGN_PROTO_PROP_READONLY(backgroundTimeRemaining);
  JS_ASSIGN_PROTO_PROP_READONLY(backgroundRefreshStatus);
  JS_ASSIGN_PROTO_PROP_READONLY(isProtectedDataAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(userInterfaceLayoutDirection);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredContentSizeCategory);
  JS_ASSIGN_PROTO_PROP_READONLY(isRegisteredForRemoteNotifications);
  JS_ASSIGN_PROTO_PROP(scheduledLocalNotifications);
  JS_ASSIGN_PROTO_PROP_READONLY(currentUserNotificationSettings);
  JS_ASSIGN_PROTO_PROP(shortcutItems);
  JS_ASSIGN_PROTO_PROP_READONLY(supportsAlternateIcons);
  JS_ASSIGN_PROTO_PROP_READONLY(alternateIconName);
#if TODO
// UIApplicationDelegate<NSObject>
  JS_ASSIGN_PROTO_PROP(window);
#endif
// UIApplication
  JS_ASSIGN_PROTO_PROP(isProximitySensingEnabled);
#if TODO
  JS_ASSIGN_PROTO_PROP(statusBarOrientation);
  JS_ASSIGN_PROTO_PROP(statusBarStyle);
  JS_ASSIGN_PROTO_PROP(isStatusBarHidden);
#endif
  // static members (ctor)
  JS_INIT_CTOR(UIApplication, NSObject);
  // constants
  
//typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskPortrait, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskLandscapeLeft, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskLandscapeRight, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskPortraitUpsideDown, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskLandscape, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskAll, NSUInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationMaskAllButUpsideDown, NSUInteger);
//} __TVOS_PROHIBITED;

// Note that UIInterfaceOrientationLandscapeLeft is equal to UIDeviceOrientationLandscapeRight (and vice versa).
// This is because rotating the device to the left requires rotating the content to the right.
//typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
  JS_ASSIGN_ENUM(UIInterfaceOrientationUnknown, NSInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationPortrait, NSInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationPortraitUpsideDown, NSInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationLandscapeLeft, NSInteger);
  JS_ASSIGN_ENUM(UIInterfaceOrientationLandscapeRight, NSInteger);
//} __TVOS_PROHIBITED;



//typedef NS_ENUM(NSInteger, UIStatusBarStyle) {
    JS_ASSIGN_ENUM(UIStatusBarStyleDefault, NSInteger); // Dark content, for use on light backgrounds
    JS_ASSIGN_ENUM(UIStatusBarStyleLightContent, NSInteger); // Light content, for use on dark backgrounds
    
    JS_ASSIGN_ENUM(UIStatusBarStyleBlackTranslucent, NSInteger);// NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 1,
    JS_ASSIGN_ENUM(UIStatusBarStyleBlackOpaque, NSInteger);//      NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 2,
//} __TVOS_PROHIBITED;


//typedef NS_ENUM(NSInteger, UIStatusBarAnimation) {
    JS_ASSIGN_ENUM(UIStatusBarAnimationNone, NSInteger);
    JS_ASSIGN_ENUM(UIStatusBarAnimationFade, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2),
    JS_ASSIGN_ENUM(UIStatusBarAnimationSlide, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2),
//} __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UIBackgroundRefreshStatus) {
    JS_ASSIGN_ENUM(UIBackgroundRefreshStatusRestricted, NSInteger); ///< unavailable on this system due to device configuration; the user cannot enable the feature
    JS_ASSIGN_ENUM(UIBackgroundRefreshStatusDenied, NSInteger);     ///< explicitly disabled by the user for this application
    JS_ASSIGN_ENUM(UIBackgroundRefreshStatusAvailable, NSInteger);   ///< enabled for this application
//} API_AVAILABLE(ios(7.0), tvos(11.0));

//typedef NS_ENUM(NSInteger, UIApplicationState) {
    JS_ASSIGN_ENUM(UIApplicationStateActive, NSInteger);
    JS_ASSIGN_ENUM(UIApplicationStateInactive, NSInteger);
    JS_ASSIGN_ENUM(UIApplicationStateBackground, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(4_0);


  // Content size category constants

  JS_ASSIGN_ENUM(UIContentSizeCategoryUnspecified, NSString); // NS_AVAILABLE_IOS(10_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryExtraSmall, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategorySmall, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryMedium, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryExtraExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryExtraExtraExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);

  // Accessibility sizes
  JS_ASSIGN_ENUM(UIContentSizeCategoryAccessibilityMedium, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryAccessibilityLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryAccessibilityExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryAccessibilityExtraExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);
  JS_ASSIGN_ENUM(UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, NSString); // NS_AVAILABLE_IOS(7_0);

  // Notification is emitted when the user has changed the preferredContentSizeCategory for the system
  JS_ASSIGN_ENUM(UIContentSizeCategoryDidChangeNotification, NSString); // NS_AVAILABLE_IOS(7_0); // userInfo dictionary will contain new value for UIContentSizeCategoryNewValueKey
  JS_ASSIGN_ENUM(UIContentSizeCategoryNewValueKey, NSString); // NS_AVAILABLE_IOS(7_0); // NSString instance with new content size category in userInfo


JS_INIT_CLASS_END(UIApplication, NSObject);

NAN_METHOD(NUIApplication::New) {
  JS_RECONSTRUCT(UIApplication);

  Local<Object> obj = info.This();

  NUIApplication *app = new NUIApplication();

  if (info[0]->IsExternal()) {
    app->SetNSObject((__bridge UIApplication *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          app->SetNSObject([UIApplication sharedApplication]);
      });
    }
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

#if 0
#include "main.h"

namespace sweetiekit {
  extern Isolate* nodeIsolate;
}
NAN_METHOD(NUIApplication::main) {
  Nan::HandleScope scope;
  
  std::string identifier("AppDelegate");
  sweetiekit::JSFunction fetchFn;
  
  __block void (^ _completion)(UIBackgroundFetchResult);
  
  __block sweetiekit::JSFunction onFetchDoneFn(sweetiekit::FromBlock("BackgroundFetchCompletionHandler", ^(JSInfo info) {
    if (_completion != nullptr) {
      _completion(UIBackgroundFetchResultNewData);
      _completion = nullptr;
    }
  }));
  
  
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  }
  if (info[0]->IsObject()) {
    auto delegateName = JS_OBJ(info[0])->Get(JS_STR("appDelegate"));
    if (delegateName->IsString()) {
      NJSStringGetUTF8String(delegateName, identifier);
    }
    auto onBackgroundFetch = JS_OBJ(info[0])->Get(JS_STR("onBackgroundFetch"));
    if (onBackgroundFetch->IsFunction()) {
      fetchFn.Reset(onBackgroundFetch);
    }
  }
  
  [AppDelegate setFetchCallback:^(void (^ _Nonnull completion)(UIBackgroundFetchResult)) {
    Nan::HandleScope handleScope;
    _completion = completion;
    [[UIApplication sharedApplication] associateValue:_completion withKey:@"sweetiekit.UIApplication._completion"];
    fetchFn.Call("AppDelegate:fetchCallback", onFetchDoneFn.GetValue());
  }];
  char* args = (char*)"node\0--jitless\0\0";
  char* args1 = (char*)args;
  std::vector<char*> arg;
  while (*args1 != '\0') {
      arg.push_back((char*)args1);
      args1 += strlen(args1) + 1;
      if (arg.size() > 100)
          __builtin_trap();
  }
  arg.push_back(nullptr);
  
  Isolate* isolate = info.GetIsolate();
  MicrotasksScope noMicrotasks(isolate, MicrotasksScope::kDoNotRunMicrotasks);
  sweetiekit::nodeIsolate = isolate;
  isolate->Exit();
//  @autoreleasepool {
//    UIApplicationMain(arg.size() - 1, &arg[0], NSStringFromClass(JSApplication.class), result);
//  }
  
}
#endif


NAN_METHOD(NUIApplication::sharedApplication) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIApplication([UIApplication sharedApplication]));
  }
}

NAN_METHOD(NUIApplication::registerObjectForStateRestorationRestorationIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIStateRestoring>*/, object);
    declare_pointer(NSString, restorationIdentifier);
    [UIApplication registerObjectForStateRestoration: object restorationIdentifier: restorationIdentifier];
  }
}

NAN_METHOD(NUIApplication::beginIgnoringInteractionEvents) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self beginIgnoringInteractionEvents];
  }
}

NAN_METHOD(NUIApplication::endIgnoringInteractionEvents) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self endIgnoringInteractionEvents];
  }
}

NAN_METHOD(NUIApplication::isIgnoringInteractionEvents) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isIgnoringInteractionEvents]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NUIApplication::openURL) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_BOOL([self openURL: url]));
  }
}

NAN_METHOD(NUIApplication::canOpenURL) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_BOOL([self canOpenURL: url]));
  }
}

NAN_METHOD(NUIApplication::openURLOptionsCompletionHandler) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_pointer(NSDictionary/* <UIApplicationOpenExternalURLOptionsKey, id>*/, options);
    declare_persistent_function(completion, @"NUIApplication::openURLOptionsCompletionHandler");
    [self openURL: url options: options completionHandler:^(BOOL success) {
      dispatch_main(^{
        get_persistent_function(self, completion, @"NUIApplication::openURLOptionsCompletionHandler");
        [completion jsFunction]->Call("NUIApplication::openURLOptionsCompletionHandler", js_value_BOOL(success));
      });
    }];
  }
}

#include "NUIEvent.h"

NAN_METHOD(NUIApplication::sendEvent) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIEvent, event);
    [self sendEvent: event];
  }
}

NAN_METHOD(NUIApplication::sendActionToFromForEvent) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(SEL, action);
    declare_nullable_value(id, target);
    declare_nullable_value(id, sender);
    declare_nullable_pointer(UIEvent, event);
    JS_SET_RETURN(js_value_BOOL([self sendAction: action to: target from: sender forEvent: event]));
    #endif
  }
}

#include "NUIWindow.h"

NAN_METHOD(NUIApplication::supportedInterfaceOrientationsForWindow) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_UIInterfaceOrientationMask([self supportedInterfaceOrientationsForWindow: window]));
  }
}

NAN_METHOD(NUIApplication::beginBackgroundTaskWithExpirationHandler) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_persistent_function(handler, @"NUIApplication::beginBackgroundTaskWithExpirationHandler");
    JS_SET_RETURN(js_value_UIBackgroundTaskIdentifier([self beginBackgroundTaskWithExpirationHandler:^{
      dispatch_main(^{
        get_persistent_function(self, handler, @"NUIApplication::beginBackgroundTaskWithExpirationHandler");
        [handler jsFunction]->Call("NUIApplication::beginBackgroundTaskWithExpirationHandler");
      });
    }]));
  }
}

NAN_METHOD(NUIApplication::beginBackgroundTaskWithNameExpirationHandler) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, taskName);
    declare_persistent_function(handler, @"NUIApplication::beginBackgroundTaskWithNameExpirationHandler");
    JS_SET_RETURN(js_value_UIBackgroundTaskIdentifier([self beginBackgroundTaskWithName: taskName expirationHandler:^{
      dispatch_main(^{
        get_persistent_function(self, handler, @"NUIApplication::beginBackgroundTaskWithNameExpirationHandler");
        [handler jsFunction]->Call("NUIApplication::beginBackgroundTaskWithNameExpirationHandler");
      });
    }]));
  }
}

NAN_METHOD(NUIApplication::endBackgroundTask) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIBackgroundTaskIdentifier, identifier);
    [self endBackgroundTask: identifier];
  }
}

NAN_METHOD(NUIApplication::setMinimumBackgroundFetchInterval) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, minimumBackgroundFetchInterval);
    [self setMinimumBackgroundFetchInterval: minimumBackgroundFetchInterval];
  }
}

NAN_METHOD(NUIApplication::registerForRemoteNotifications) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self registerForRemoteNotifications];
  }
}

NAN_METHOD(NUIApplication::unregisterForRemoteNotifications) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self unregisterForRemoteNotifications];
  }
}

NAN_METHOD(NUIApplication::isRegisteredForRemoteNotifications) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRegisteredForRemoteNotifications]));
  }
}

NAN_METHOD(NUIApplication::registerForRemoteNotificationTypes) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIRemoteNotificationType, types);
    [self registerForRemoteNotificationTypes: types];
  }
}

NAN_METHOD(NUIApplication::enabledRemoteNotificationTypes) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRemoteNotificationType([self enabledRemoteNotificationTypes]));
  }
}

#include "NUILocalNotification.h"

NAN_METHOD(NUIApplication::presentLocalNotificationNow) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UILocalNotification, notification);
    [self presentLocalNotificationNow: notification];
  }
}

NAN_METHOD(NUIApplication::scheduleLocalNotification) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UILocalNotification, notification);
    [self scheduleLocalNotification: notification];
  }
}

NAN_METHOD(NUIApplication::cancelLocalNotification) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UILocalNotification, notification);
    [self cancelLocalNotification: notification];
  }
}

NAN_METHOD(NUIApplication::cancelAllLocalNotifications) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self cancelAllLocalNotifications];
  }
}

#include "NUIUserNotificationSettings.h"

NAN_METHOD(NUIApplication::registerUserNotificationSettings) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIUserNotificationSettings, notificationSettings);
    [self registerUserNotificationSettings: notificationSettings];
  }
}

NAN_METHOD(NUIApplication::currentUserNotificationSettings) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationSettings([self currentUserNotificationSettings]));
  }
}

NAN_METHOD(NUIApplication::beginReceivingRemoteControlEvents) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self beginReceivingRemoteControlEvents];
  }
}

NAN_METHOD(NUIApplication::endReceivingRemoteControlEvents) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self endReceivingRemoteControlEvents];
  }
}

#include "NUIImage.h"

NAN_METHOD(NUIApplication::setNewsstandIconImage) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    [self setNewsstandIconImage: image];
  }
}

#include "NNSError.h"

NAN_METHOD(NUIApplication::setAlternateIconNameCompletionHandler) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, alternateIconName);
    declare_persistent_function(completionHandler, @"NUIApplication::setAlternateIconNameCompletionHandler");
    [self setAlternateIconName: alternateIconName completionHandler:^(NSError * _Nullable error) {
      dispatch_main(^{
        get_persistent_function(self, completionHandler, @"NUIApplication::setAlternateIconNameCompletionHandler");
        [completionHandler jsFunction]->Call("NUIApplication::setAlternateIconNameCompletionHandler", js_value_NSError(error));
      });
    }];
  }
}

NAN_METHOD(NUIApplication::extendStateRestoration) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self extendStateRestoration];
  }
}

NAN_METHOD(NUIApplication::completeStateRestoration) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self completeStateRestoration];
  }
}

NAN_METHOD(NUIApplication::ignoreSnapshotOnNextApplicationLaunch) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self ignoreSnapshotOnNextApplicationLaunch];
  }
}

#if TODO
NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidFinishLaunching) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationDidFinishLaunching: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillFinishLaunchingWithOptions) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSDictionary<UIApplicationLaunchOptionsKey-id>, launchOptions);
    JS_SET_RETURN(js_value_BOOL([self application: application willFinishLaunchingWithOptions: launchOptions]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidFinishLaunchingWithOptions) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSDictionary<UIApplicationLaunchOptionsKey-id>, launchOptions);
    JS_SET_RETURN(js_value_BOOL([self application: application didFinishLaunchingWithOptions: launchOptions]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillFinishLaunchingWithOptions) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSDictionary, launchOptions);
    JS_SET_RETURN(js_value_BOOL([self application: application willFinishLaunchingWithOptions: launchOptions]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidFinishLaunchingWithOptions) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSDictionary, launchOptions);
    JS_SET_RETURN(js_value_BOOL([self application: application didFinishLaunchingWithOptions: launchOptions]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidBecomeActive) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationDidBecomeActive: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillResignActive) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationWillResignActive: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleOpenURL) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_BOOL([self application: application handleOpenURL: url]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationOpenURLSourceApplicationAnnotation) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSString, sourceApplication);
    declare_value(id, annotation);
    JS_SET_RETURN(js_value_BOOL([self application: application openURL: url sourceApplication: sourceApplication annotation: annotation]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationOpenURLOptions) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, app);
    declare_pointer(NSURL, url);
    declare_pointer(NSDictionary<UIApplicationOpenURLOptionsKey-id>, options);
    JS_SET_RETURN(js_value_BOOL([self application: app openURL: url options: options]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidReceiveMemoryWarning) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationDidReceiveMemoryWarning: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillTerminate) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationWillTerminate: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationSignificantTimeChange) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationSignificantTimeChange: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillChangeStatusBarOrientationDuration) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(UIInterfaceOrientation, newStatusBarOrientation);
    declare_value(NSTimeInterval, duration);
    [self application: application willChangeStatusBarOrientation: newStatusBarOrientation duration: duration];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidChangeStatusBarOrientation) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(UIInterfaceOrientation, oldStatusBarOrientation);
    [self application: application didChangeStatusBarOrientation: oldStatusBarOrientation];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillChangeStatusBarFrame) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(CGRect, newStatusBarFrame);
    [self application: application willChangeStatusBarFrame: newStatusBarFrame];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidChangeStatusBarFrame) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(CGRect, oldStatusBarFrame);
    [self application: application didChangeStatusBarFrame: oldStatusBarFrame];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidRegisterUserNotificationSettings) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(UIUserNotificationSettings, notificationSettings);
    [self application: application didRegisterUserNotificationSettings: notificationSettings];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidRegisterForRemoteNotificationsWithDeviceToken) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSData, deviceToken);
    [self application: application didRegisterForRemoteNotificationsWithDeviceToken: deviceToken];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidFailToRegisterForRemoteNotificationsWithError) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSError, error);
    [self application: application didFailToRegisterForRemoteNotificationsWithError: error];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidReceiveRemoteNotification) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSDictionary, userInfo);
    [self application: application didReceiveRemoteNotification: userInfo];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidReceiveLocalNotification) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(UILocalNotification, notification);
    [self application: application didReceiveLocalNotification: notification];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleActionWithIdentifierForLocalNotificationCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(UILocalNotification, notification);
    declare_value(void-^-, completionHandler);
    [self application: application handleActionWithIdentifier: identifier forLocalNotification: notification completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleActionWithIdentifierForRemoteNotificationWithResponseInfoCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(NSDictionary, userInfo);
    declare_pointer(NSDictionary, responseInfo);
    declare_value(void-^-, completionHandler);
    [self application: application handleActionWithIdentifier: identifier forRemoteNotification: userInfo withResponseInfo: responseInfo completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleActionWithIdentifierForRemoteNotificationCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(NSDictionary, userInfo);
    declare_value(void-^-, completionHandler);
    [self application: application handleActionWithIdentifier: identifier forRemoteNotification: userInfo completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleActionWithIdentifierForLocalNotificationWithResponseInfoCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSString, identifier);
    declare_pointer(UILocalNotification, notification);
    declare_pointer(NSDictionary, responseInfo);
    declare_value(void-^-, completionHandler);
    [self application: application handleActionWithIdentifier: identifier forLocalNotification: notification withResponseInfo: responseInfo completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidReceiveRemoteNotificationFetchCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSDictionary, userInfo);
    declare_value(void-^-UIBackgroundFetchResult,result, completionHandler);
    [self application: application didReceiveRemoteNotification: userInfo fetchCompletionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationPerformFetchWithCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(void-^-UIBackgroundFetchResult,result, completionHandler);
    [self application: application performFetchWithCompletionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationPerformActionForShortcutItemCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(UIApplicationShortcutItem, shortcutItem);
    declare_value(void-^-BOOL,succeeded, completionHandler);
    [self application: application performActionForShortcutItem: shortcutItem completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleEventsForBackgroundURLSessionCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSString, identifier);
    declare_value(void-^-void, completionHandler);
    [self application: application handleEventsForBackgroundURLSession: identifier completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleWatchKitExtensionRequestReply) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(NSDictionary, userInfo);
    declare_value(void-^-NSDictionary-pointer,__nullable,replyInfo, reply);
    [self application: application handleWatchKitExtensionRequest: userInfo reply: reply];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationShouldRequestHealthAuthorization) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationShouldRequestHealthAuthorization: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationHandleIntentCompletionHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(INIntent, intent);
    declare_value(void-^-INIntentResponse-pointer,intentResponse, completionHandler);
    [self application: application handleIntent: intent completionHandler: completionHandler];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidEnterBackground) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationDidEnterBackground: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillEnterForeground) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationWillEnterForeground: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationProtectedDataWillBecomeUnavailable) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationProtectedDataWillBecomeUnavailable: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationProtectedDataDidBecomeAvailable) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    [self applicationProtectedDataDidBecomeAvailable: application];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationSupportedInterfaceOrientationsForWindow) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_nullable_pointer(UIWindow, window);
    JS_SET_RETURN(js_value_UIInterfaceOrientationMask([self application: application supportedInterfaceOrientationsForWindow: window]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationShouldAllowExtensionPointIdentifier) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_value(UIApplicationExtensionPointIdentifier, extensionPointIdentifier);
    JS_SET_RETURN(js_value_BOOL([self application: application shouldAllowExtensionPointIdentifier: extensionPointIdentifier]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationViewControllerWithRestorationIdentifierPathCoder) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSArray<NSString*>, identifierComponents);
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_UIViewController([self application: application viewControllerWithRestorationIdentifierPath: identifierComponents coder: coder]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationShouldSaveApplicationState) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_BOOL([self application: application shouldSaveApplicationState: coder]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationShouldRestoreApplicationState) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_BOOL([self application: application shouldRestoreApplicationState: coder]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillEncodeRestorableStateWithCoder) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSCoder, coder);
    [self application: application willEncodeRestorableStateWithCoder: coder];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidDecodeRestorableStateWithCoder) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSCoder, coder);
    [self application: application didDecodeRestorableStateWithCoder: coder];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationWillContinueUserActivityWithType) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSString, userActivityType);
    JS_SET_RETURN(js_value_BOOL([self application: application willContinueUserActivityWithType: userActivityType]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationContinueUserActivityRestorationHandler) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSUserActivity, userActivity);
    declare_value(void-^-NSArray<id<UIUserActivityRestoring>>-pointer,__nullable,restorableObjects, restorationHandler);
    JS_SET_RETURN(js_value_BOOL([self application: application continueUserActivity: userActivity restorationHandler: restorationHandler]));
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidFailToContinueUserActivityWithTypeError) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSString, userActivityType);
    declare_pointer(NSError, error);
    [self application: application didFailToContinueUserActivityWithType: userActivityType error: error];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationDidUpdateUserActivity) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(NSUserActivity, userActivity);
    [self application: application didUpdateUserActivity: userActivity];
  }
}

NAN_METHOD(NUIApplicationDelegate<NSObject>::applicationUserDidAcceptCloudKitShareWithMetadata) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIApplication, application);
    declare_pointer(CKShareMetadata, cloudKitShareMetadata);
    [self application: application userDidAcceptCloudKitShareWithMetadata: cloudKitShareMetadata];
  }
}
#endif

NAN_METHOD(NUIApplication::setStatusBarHiddenAnimated) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, hidden);
    declare_value(BOOL, animated);
    [self setStatusBarHidden: hidden animated: animated];
  }
}

NAN_METHOD(NUIApplication::setStatusBarOrientationAnimated) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, interfaceOrientation);
    declare_value(BOOL, animated);
    [self setStatusBarOrientation: interfaceOrientation animated: animated];
  }
}

NAN_METHOD(NUIApplication::setStatusBarStyleAnimated) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIStatusBarStyle, statusBarStyle);
    declare_value(BOOL, animated);
    [self setStatusBarStyle: statusBarStyle animated: animated];
  }
}

NAN_METHOD(NUIApplication::setStatusBarHiddenWithAnimation) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, hidden);
    declare_value(UIStatusBarAnimation, animation);
    [self setStatusBarHidden: hidden withAnimation: animation];
  }
}

NAN_METHOD(NUIApplication::setKeepAliveTimeoutHandler) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, timeout);
    declare_persistent_function(keepAliveHandler, @"NUIApplication::setKeepAliveTimeoutHandler");
    JS_SET_RETURN(js_value_BOOL([self setKeepAliveTimeout: timeout handler:^{
      dispatch_main(^{
        get_persistent_function(self, keepAliveHandler, @"NUIApplication::setKeepAliveTimeoutHandler");
        [keepAliveHandler jsFunction]->Call("NUIApplication::setKeepAliveTimeoutHandler");
      });
    }]));
  }
}

NAN_METHOD(NUIApplication::clearKeepAliveTimeout) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    [self clearKeepAliveTimeout];
  }
}

NAN_GETTER(NUIApplication::sharedApplicationGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIApplication([UIApplication sharedApplication]));
  }
}

NAN_GETTER(NUIApplication::delegateGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIApplicationDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUIApplication::delegateSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UIApplicationDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUIApplication::isIgnoringInteractionEventsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isIgnoringInteractionEvents]));
  }
}

NAN_GETTER(NUIApplication::isIdleTimerDisabledGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isIdleTimerDisabled]));
  }
}

NAN_SETTER(NUIApplication::isIdleTimerDisabledSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setIdleTimerDisabled: input];
  }
}

#include "NUIWindow.h"

NAN_GETTER(NUIApplication::keyWindowGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindow([self keyWindow]));
  }
}

NAN_GETTER(NUIApplication::windowsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIWindow*>([self windows]));
  }
}

NAN_GETTER(NUIApplication::isNetworkActivityIndicatorVisibleGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isNetworkActivityIndicatorVisible]));
  }
}

NAN_SETTER(NUIApplication::isNetworkActivityIndicatorVisibleSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNetworkActivityIndicatorVisible: input];
  }
}

NAN_GETTER(NUIApplication::statusBarStyleGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarStyle([self statusBarStyle]));
  }
}

NAN_GETTER(NUIApplication::isStatusBarHiddenGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isStatusBarHidden]));
  }
}

NAN_GETTER(NUIApplication::statusBarOrientationGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self statusBarOrientation]));
  }
}

NAN_GETTER(NUIApplication::statusBarOrientationAnimationDurationGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self statusBarOrientationAnimationDuration]));
  }
}

NAN_GETTER(NUIApplication::statusBarFrameGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self statusBarFrame]));
  }
}

NAN_GETTER(NUIApplication::applicationIconBadgeNumberGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self applicationIconBadgeNumber]));
  }
}

NAN_SETTER(NUIApplication::applicationIconBadgeNumberSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setApplicationIconBadgeNumber: input];
  }
}

NAN_GETTER(NUIApplication::applicationSupportsShakeToEditGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self applicationSupportsShakeToEdit]));
  }
}

NAN_SETTER(NUIApplication::applicationSupportsShakeToEditSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setApplicationSupportsShakeToEdit: input];
  }
}

NAN_GETTER(NUIApplication::applicationStateGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIApplicationState([self applicationState]));
  }
}

NAN_GETTER(NUIApplication::backgroundTimeRemainingGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self backgroundTimeRemaining]));
  }
}

NAN_GETTER(NUIApplication::backgroundRefreshStatusGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBackgroundRefreshStatus([self backgroundRefreshStatus]));
  }
}

NAN_GETTER(NUIApplication::isProtectedDataAvailableGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isProtectedDataAvailable]));
  }
}

NAN_GETTER(NUIApplication::userInterfaceLayoutDirectionGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceLayoutDirection([self userInterfaceLayoutDirection]));
  }
}

NAN_GETTER(NUIApplication::preferredContentSizeCategoryGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIContentSizeCategory([self preferredContentSizeCategory]));
  }
}

NAN_GETTER(NUIApplication::isRegisteredForRemoteNotificationsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRegisteredForRemoteNotifications]));
  }
}

NAN_GETTER(NUIApplication::scheduledLocalNotificationsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UILocalNotification*>([self scheduledLocalNotifications]));
  }
}

NAN_SETTER(NUIApplication::scheduledLocalNotificationsSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UILocalNotification*>, input);
    [self setScheduledLocalNotifications: input];
  }
}

NAN_GETTER(NUIApplication::currentUserNotificationSettingsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserNotificationSettings([self currentUserNotificationSettings]));
  }
}

NAN_GETTER(NUIApplication::shortcutItemsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIApplicationShortcutItem*>([self shortcutItems]));
  }
}

NAN_SETTER(NUIApplication::shortcutItemsSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIApplicationShortcutItem*>, input);
    [self setShortcutItems: input];
  }
}

NAN_GETTER(NUIApplication::supportsAlternateIconsGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self supportsAlternateIcons]));
  }
}

NAN_GETTER(NUIApplication::alternateIconNameGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self alternateIconName]));
  }
}

#if TODO
NAN_GETTER(NUIApplicationDelegate<NSObject>::windowGetter) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindow([self window]));
  }
}

NAN_SETTER(NUIApplicationDelegate<NSObject>::windowSetter) {
  JS_UNWRAP(UIApplicationDelegate<NSObject>, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIWindow, input);
    [self setWindow: input];
  }
}
#endif

NAN_GETTER(NUIApplication::isProximitySensingEnabledGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isProximitySensingEnabled]));
  }
}

NAN_SETTER(NUIApplication::isProximitySensingEnabledSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setProximitySensingEnabled: input];
  }
}

#if TODO
NAN_GETTER(NUIApplication::statusBarOrientationGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self statusBarOrientation]));
  }
}

NAN_SETTER(NUIApplication::statusBarOrientationSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIInterfaceOrientation, input);
    [self setStatusBarOrientation: input];
  }
}

NAN_GETTER(NUIApplication::statusBarStyleGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarStyle([self statusBarStyle]));
  }
}

NAN_SETTER(NUIApplication::statusBarStyleSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIStatusBarStyle, input);
    [self setStatusBarStyle: input];
  }
}

NAN_GETTER(NUIApplication::isStatusBarHiddenGetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isStatusBarHidden]));
  }
}

NAN_SETTER(NUIApplication::isStatusBarHiddenSetter) {
  JS_UNWRAP(UIApplication, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setStatusBarHidden: input];
  }
}
#endif

