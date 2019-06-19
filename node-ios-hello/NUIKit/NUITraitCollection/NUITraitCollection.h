//
//  NUITraitCollection.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITraitCollection_h
#define NUITraitCollection_h    

#include "NNSObject.h"

#define js_value_UITraitCollection(x) js_value_wrapper(x, UITraitCollection)
#define to_value_UITraitCollection(x) to_value_wrapper(x, UITraitCollection)
#define is_value_UITraitCollection(x) is_value_wrapper(x, UITraitCollection)

#define js_value_UIDeviceOrientation(x) JS_ENUM(UIDeviceOrientation, NSInteger, x)
#define to_value_UIDeviceOrientation(x) TO_ENUM(UIDeviceOrientation, NSInteger, x)
#define is_value_UIDeviceOrientation(x) IS_ENUM(UIDeviceOrientation, NSInteger, x)

#define js_value_UIDeviceBatteryState(x) JS_ENUM(UIDeviceBatteryState, NSInteger, x)
#define to_value_UIDeviceBatteryState(x) TO_ENUM(UIDeviceBatteryState, NSInteger, x)
#define is_value_UIDeviceBatteryState(x) IS_ENUM(UIDeviceBatteryState, NSInteger, x)

#define js_value_UIUserInterfaceIdiom(x) JS_ENUM(UIUserInterfaceIdiom, NSInteger, x)
#define to_value_UIUserInterfaceIdiom(x) TO_ENUM(UIUserInterfaceIdiom, NSInteger, x)
#define is_value_UIUserInterfaceIdiom(x) IS_ENUM(UIUserInterfaceIdiom, NSInteger, x)

JS_WRAP_CLASS(UITraitCollection, NSObject);
  JS_STATIC_METHOD(traitCollectionWithTraitsFromCollections);
  JS_STATIC_METHOD(traitCollectionWithUserInterfaceIdiom);
  JS_STATIC_METHOD(traitCollectionWithUserInterfaceStyle);
  JS_STATIC_METHOD(traitCollectionWithLayoutDirection);
  JS_STATIC_METHOD(traitCollectionWithDisplayScale);
  JS_STATIC_METHOD(traitCollectionWithHorizontalSizeClass);
  JS_STATIC_METHOD(traitCollectionWithVerticalSizeClass);
  JS_STATIC_METHOD(traitCollectionWithForceTouchCapability);
  JS_STATIC_METHOD(traitCollectionWithPreferredContentSizeCategory);
  JS_STATIC_METHOD(traitCollectionWithDisplayGamut);
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithCoder);
  JS_METHOD(containsTraitsInCollection);
  JS_PROP_READONLY(userInterfaceIdiom);
  JS_PROP_READONLY(userInterfaceStyle);
  JS_PROP_READONLY(layoutDirection);
  JS_PROP_READONLY(displayScale);
  JS_PROP_READONLY(horizontalSizeClass);
  JS_PROP_READONLY(verticalSizeClass);
  JS_PROP_READONLY(forceTouchCapability);
  JS_PROP_READONLY(preferredContentSizeCategory);
  JS_PROP_READONLY(displayGamut);
#if TODO
// UITraitEnvironment
  JS_METHOD(traitCollectionDidChange);
  JS_PROP_READONLY(traitCollection);
#endif

JS_WRAP_CLASS_END(UITraitCollection);

#endif /* NUITraitCollection_h */
