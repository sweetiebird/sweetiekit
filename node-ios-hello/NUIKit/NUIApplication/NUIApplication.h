//
//  NUIApplication.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIApplication_h
#define NUIApplication_h

#include "NNSObject.h"

#define js_value_UIApplication(x) js_value_wrapper(x, UIApplication)
#define to_value_UIApplication(x) to_value_wrapper(x, UIApplication)
#define is_value_UIApplication(x) is_value_wrapper(x, UIApplication)

#define js_value_UIApplicationOpenExternalURLOptionsKey(x) JS_ENUM(UIApplicationOpenExternalURLOptionsKey, NSString, x)
#define to_value_UIApplicationOpenExternalURLOptionsKey(x) TO_ENUM(UIApplicationOpenExternalURLOptionsKey, NSString, x)
#define is_value_UIApplicationOpenExternalURLOptionsKey(x) IS_ENUM(UIApplicationOpenExternalURLOptionsKey, NSString, x)

#define js_value_UIInterfaceOrientationMask(x) JS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define to_value_UIInterfaceOrientationMask(x) TO_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define is_value_UIInterfaceOrientationMask(x) IS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)

#define js_value_UIBackgroundTaskIdentifier(x) JS_ENUM(UIBackgroundTaskIdentifier, NSUInteger, x)
#define to_value_UIBackgroundTaskIdentifier(x) TO_ENUM(UIBackgroundTaskIdentifier, NSUInteger, x)
#define is_value_UIBackgroundTaskIdentifier(x) IS_ENUM(UIBackgroundTaskIdentifier, NSUInteger, x)

#define js_value_UIRemoteNotificationType(x) JS_OPTS(UIRemoteNotificationType, NSUInteger, x)
#define to_value_UIRemoteNotificationType(x) TO_OPTS(UIRemoteNotificationType, NSUInteger, x)
#define is_value_UIRemoteNotificationType(x) IS_OPTS(UIRemoteNotificationType, NSUInteger, x)

#define js_value_UIInterfaceOrientationMask(x) JS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define to_value_UIInterfaceOrientationMask(x) TO_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define is_value_UIInterfaceOrientationMask(x) IS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)

#define js_value_UIInterfaceOrientation(x) JS_ENUM(UIInterfaceOrientation, NSInteger, x)
#define to_value_UIInterfaceOrientation(x) TO_ENUM(UIInterfaceOrientation, NSInteger, x)
#define is_value_UIInterfaceOrientation(x) IS_ENUM(UIInterfaceOrientation, NSInteger, x)

#define js_value_UIStatusBarStyle(x) JS_ENUM(UIStatusBarStyle, NSInteger, x)
#define to_value_UIStatusBarStyle(x) TO_ENUM(UIStatusBarStyle, NSInteger, x)
#define is_value_UIStatusBarStyle(x) IS_ENUM(UIStatusBarStyle, NSInteger, x)

#define js_value_UIStatusBarAnimation(x) JS_ENUM(UIStatusBarAnimation, NSInteger, x)
#define to_value_UIStatusBarAnimation(x) TO_ENUM(UIStatusBarAnimation, NSInteger, x)
#define is_value_UIStatusBarAnimation(x) IS_ENUM(UIStatusBarAnimation, NSInteger, x)

#define js_value_UIBackgroundRefreshStatus(x) JS_ENUM(UIBackgroundRefreshStatus, NSInteger, x)
#define to_value_UIBackgroundRefreshStatus(x) TO_ENUM(UIBackgroundRefreshStatus, NSInteger, x)
#define is_value_UIBackgroundRefreshStatus(x) IS_ENUM(UIBackgroundRefreshStatus, NSInteger, x)

#define js_value_UIApplicationState(x) JS_ENUM(UIApplicationState, NSInteger, x)
#define to_value_UIApplicationState(x) TO_ENUM(UIApplicationState, NSInteger, x)
#define is_value_UIApplicationState(x) IS_ENUM(UIApplicationState, NSInteger, x)

#define js_value_UIContentSizeCategory(x) JS_ENUM(UIContentSizeCategory, NSString, x)
#define to_value_UIContentSizeCategory(x) TO_ENUM(UIContentSizeCategory, NSString, x)
#define is_value_UIContentSizeCategory(x) IS_ENUM(UIContentSizeCategory, NSString, x)

JS_WRAP_CLASS(UIApplication, NSObject);
  JS_STATIC_METHOD(sharedApplication);
  JS_STATIC_METHOD(registerObjectForStateRestorationRestorationIdentifier);
  JS_METHOD(beginIgnoringInteractionEvents);
  JS_METHOD(endIgnoringInteractionEvents);
  JS_METHOD(isIgnoringInteractionEvents);
  JS_METHOD(openURL);
  JS_METHOD(canOpenURL);
  JS_METHOD(openURLOptionsCompletionHandler);
  JS_METHOD(sendEvent);
  JS_METHOD(sendActionToFromForEvent);
  JS_METHOD(supportedInterfaceOrientationsForWindow);
  JS_METHOD(beginBackgroundTaskWithExpirationHandler);
  JS_METHOD(beginBackgroundTaskWithNameExpirationHandler);
  JS_METHOD(endBackgroundTask);
  JS_METHOD(setMinimumBackgroundFetchInterval);
  JS_METHOD(registerForRemoteNotifications);
  JS_METHOD(unregisterForRemoteNotifications);
  JS_METHOD(isRegisteredForRemoteNotifications);
  JS_METHOD(registerForRemoteNotificationTypes);
  JS_METHOD(enabledRemoteNotificationTypes);
  JS_METHOD(presentLocalNotificationNow);
  JS_METHOD(scheduleLocalNotification);
  JS_METHOD(cancelLocalNotification);
  JS_METHOD(cancelAllLocalNotifications);
  JS_METHOD(registerUserNotificationSettings);
  JS_METHOD(currentUserNotificationSettings);
  JS_METHOD(beginReceivingRemoteControlEvents);
  JS_METHOD(endReceivingRemoteControlEvents);
  JS_METHOD(setNewsstandIconImage);
  JS_METHOD(setAlternateIconNameCompletionHandler);
  JS_METHOD(extendStateRestoration);
  JS_METHOD(completeStateRestoration);
  JS_METHOD(ignoreSnapshotOnNextApplicationLaunch);
#if TODO
// UIApplicationDelegate<NSObject>
  JS_METHOD(applicationDidFinishLaunching);
  JS_METHOD(applicationWillFinishLaunchingWithOptions);
  JS_METHOD(applicationDidFinishLaunchingWithOptions);
  JS_METHOD(applicationWillFinishLaunchingWithOptions);
  JS_METHOD(applicationDidFinishLaunchingWithOptions);
  JS_METHOD(applicationDidBecomeActive);
  JS_METHOD(applicationWillResignActive);
  JS_METHOD(applicationHandleOpenURL);
  JS_METHOD(applicationOpenURLSourceApplicationAnnotation);
  JS_METHOD(applicationOpenURLOptions);
  JS_METHOD(applicationDidReceiveMemoryWarning);
  JS_METHOD(applicationWillTerminate);
  JS_METHOD(applicationSignificantTimeChange);
  JS_METHOD(applicationWillChangeStatusBarOrientationDuration);
  JS_METHOD(applicationDidChangeStatusBarOrientation);
  JS_METHOD(applicationWillChangeStatusBarFrame);
  JS_METHOD(applicationDidChangeStatusBarFrame);
  JS_METHOD(applicationDidRegisterUserNotificationSettings);
  JS_METHOD(applicationDidRegisterForRemoteNotificationsWithDeviceToken);
  JS_METHOD(applicationDidFailToRegisterForRemoteNotificationsWithError);
  JS_METHOD(applicationDidReceiveRemoteNotification);
  JS_METHOD(applicationDidReceiveLocalNotification);
  JS_METHOD(applicationHandleActionWithIdentifierForLocalNotificationCompletionHandler);
  JS_METHOD(applicationHandleActionWithIdentifierForRemoteNotificationWithResponseInfoCompletionHandler);
  JS_METHOD(applicationHandleActionWithIdentifierForRemoteNotificationCompletionHandler);
  JS_METHOD(applicationHandleActionWithIdentifierForLocalNotificationWithResponseInfoCompletionHandler);
  JS_METHOD(applicationDidReceiveRemoteNotificationFetchCompletionHandler);
  JS_METHOD(applicationPerformFetchWithCompletionHandler);
  JS_METHOD(applicationPerformActionForShortcutItemCompletionHandler);
  JS_METHOD(applicationHandleEventsForBackgroundURLSessionCompletionHandler);
  JS_METHOD(applicationHandleWatchKitExtensionRequestReply);
  JS_METHOD(applicationShouldRequestHealthAuthorization);
  JS_METHOD(applicationHandleIntentCompletionHandler);
  JS_METHOD(applicationDidEnterBackground);
  JS_METHOD(applicationWillEnterForeground);
  JS_METHOD(applicationProtectedDataWillBecomeUnavailable);
  JS_METHOD(applicationProtectedDataDidBecomeAvailable);
  JS_METHOD(applicationSupportedInterfaceOrientationsForWindow);
  JS_METHOD(applicationShouldAllowExtensionPointIdentifier);
  JS_METHOD(applicationViewControllerWithRestorationIdentifierPathCoder);
  JS_METHOD(applicationShouldSaveApplicationState);
  JS_METHOD(applicationShouldRestoreApplicationState);
  JS_METHOD(applicationWillEncodeRestorableStateWithCoder);
  JS_METHOD(applicationDidDecodeRestorableStateWithCoder);
  JS_METHOD(applicationWillContinueUserActivityWithType);
  JS_METHOD(applicationContinueUserActivityRestorationHandler);
  JS_METHOD(applicationDidFailToContinueUserActivityWithTypeError);
  JS_METHOD(applicationDidUpdateUserActivity);
  JS_METHOD(applicationUserDidAcceptCloudKitShareWithMetadata);
#endif
// UIApplication
  JS_METHOD(setStatusBarHiddenAnimated);
  JS_METHOD(setStatusBarOrientationAnimated);
  JS_METHOD(setStatusBarStyleAnimated);
  JS_METHOD(setStatusBarHiddenWithAnimation);
  JS_METHOD(setKeepAliveTimeoutHandler);
  JS_METHOD(clearKeepAliveTimeout);
  JS_STATIC_PROP_READONLY(sharedApplication);
  JS_PROP(delegate);
  JS_PROP_READONLY(isIgnoringInteractionEvents);
  JS_PROP(isIdleTimerDisabled);
  JS_PROP_READONLY(keyWindow);
  JS_PROP_READONLY(windows);
  JS_PROP(isNetworkActivityIndicatorVisible);
  JS_PROP_READONLY(statusBarStyle);
  JS_PROP_READONLY(isStatusBarHidden);
  JS_PROP_READONLY(statusBarOrientation);
  JS_PROP_READONLY(statusBarOrientationAnimationDuration);
  JS_PROP_READONLY(statusBarFrame);
  JS_PROP(applicationIconBadgeNumber);
  JS_PROP(applicationSupportsShakeToEdit);
  JS_PROP_READONLY(applicationState);
  JS_PROP_READONLY(backgroundTimeRemaining);
  JS_PROP_READONLY(backgroundRefreshStatus);
  JS_PROP_READONLY(isProtectedDataAvailable);
  JS_PROP_READONLY(userInterfaceLayoutDirection);
  JS_PROP_READONLY(preferredContentSizeCategory);
  JS_PROP_READONLY(isRegisteredForRemoteNotifications);
  JS_PROP(scheduledLocalNotifications);
  JS_PROP_READONLY(currentUserNotificationSettings);
  JS_PROP(shortcutItems);
  JS_PROP_READONLY(supportsAlternateIcons);
  JS_PROP_READONLY(alternateIconName);
#if TODO
// UIApplicationDelegate<NSObject>
  JS_PROP(window);
#endif
// UIApplication
  JS_PROP(isProximitySensingEnabled);
#if TODO
  JS_PROP(statusBarOrientation);
  JS_PROP(statusBarStyle);
  JS_PROP(isStatusBarHidden);
#endif
JS_WRAP_CLASS_END(UIApplication);


#endif /* NUIApplication_h */
