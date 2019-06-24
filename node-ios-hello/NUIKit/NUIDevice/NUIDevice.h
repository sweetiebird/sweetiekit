//
//  NUIDevice.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDevice_h
#define NUIDevice_h    

#include "NNSObject.h"

#define js_value_UIDevice(x) js_value_wrapper(x, UIDevice)
#define to_value_UIDevice(x) to_value_wrapper(x, UIDevice)
#define is_value_UIDevice(x) is_value_wrapper(x, UIDevice)

#define js_value_UIDeviceOrientation(x) JS_ENUM(UIDeviceOrientation, NSInteger, x)
#define to_value_UIDeviceOrientation(x) TO_ENUM(UIDeviceOrientation, NSInteger, x)
#define is_value_UIDeviceOrientation(x) IS_ENUM(UIDeviceOrientation, NSInteger, x)

#define js_value_UIDeviceBatteryState(x) JS_ENUM(UIDeviceBatteryState, NSInteger, x)
#define to_value_UIDeviceBatteryState(x) TO_ENUM(UIDeviceBatteryState, NSInteger, x)
#define is_value_UIDeviceBatteryState(x) IS_ENUM(UIDeviceBatteryState, NSInteger, x)

#define js_value_UIUserInterfaceIdiom(x) JS_ENUM(UIUserInterfaceIdiom, NSInteger, x)
#define to_value_UIUserInterfaceIdiom(x) TO_ENUM(UIUserInterfaceIdiom, NSInteger, x)
#define is_value_UIUserInterfaceIdiom(x) IS_ENUM(UIUserInterfaceIdiom, NSInteger, x)


JS_WRAP_CLASS(UIDevice, NSObject);
  // global functions
  JS_METHOD(UIDeviceOrientationIsPortrait);
  JS_METHOD(UIDeviceOrientationIsLandscape);
  JS_METHOD(UIDeviceOrientationIsFlat);
  JS_METHOD(UIDeviceOrientationIsValidInterfaceOrientation);

// UIDevice
  JS_STATIC_METHOD(currentDevice);
  JS_METHOD(beginGeneratingDeviceOrientationNotifications);
  JS_METHOD(endGeneratingDeviceOrientationNotifications);
  JS_METHOD(playInputClick);
  JS_STATIC_PROP_READONLY(currentDevice);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(model);
  JS_PROP_READONLY(localizedModel);
  JS_PROP_READONLY(systemName);
  JS_PROP_READONLY(systemVersion);
  JS_PROP_READONLY(orientation);
  JS_PROP_READONLY(identifierForVendor);
  JS_PROP_READONLY(isGeneratingDeviceOrientationNotifications);
  JS_PROP(isBatteryMonitoringEnabled);
  JS_PROP_READONLY(batteryState);
  JS_PROP_READONLY(batteryLevel);
  JS_PROP(isProximityMonitoringEnabled);
  JS_PROP_READONLY(proximityState);
  JS_PROP_READONLY(isMultitaskingSupported);
  JS_PROP_READONLY(userInterfaceIdiom);
#if TODO
// UIInputViewAudioFeedback
  JS_PROP_READONLY(enableInputClicksWhenVisible);
#endif

JS_WRAP_CLASS_END(UIDevice);

#endif /* NUIDevice_h */
