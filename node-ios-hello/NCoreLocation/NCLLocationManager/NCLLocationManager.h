//
//  NCLLocationManager.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocationManager_h
#define NCLLocationManager_h

#import "NNSObject.h"

#define js_value_CLLocationManager(x) js_value_wrapper(x, CLLocationManager)
#define to_value_CLLocationManager(x) to_value_wrapper(x, CLLocationManager)
#define is_value_CLLocationManager(x) is_value_wrapper(x, CLLocationManager)

/*
 *  CLDeviceOrientation
 *  
 *  Discussion:
 *      Specifies a physical device orientation, equivalent to UIDeviceOrientation.
 *      
 */

#define js_value_CLDeviceOrientation(x) JS_ENUM(CLDeviceOrientation, int, x)
#define to_value_CLDeviceOrientation(x) TO_ENUM(CLDeviceOrientation, int, x)
#define is_value_CLDeviceOrientation(x) IS_ENUM(CLDeviceOrientation, int, x)

/*
 *  CLAuthorizationStatus
 *  
 *  Discussion:
 *      Represents the current authorization state of the application.
 *      
 */
#define js_value_CLAuthorizationStatus(x) JS_ENUM(CLAuthorizationStatus, int, x)
#define to_value_CLAuthorizationStatus(x) TO_ENUM(CLAuthorizationStatus, int, x)
#define is_value_CLAuthorizationStatus(x) IS_ENUM(CLAuthorizationStatus, int, x)

/*
 *  CLActivityType
 *
 *  Discussion:
 *    Enumerates the different possible activity types. This currently
 *    affects behavior such as the determination of when location updates
 *    may be automatically paused.
 */
#define js_value_CLActivityType(x) JS_ENUM(CLActivityType, NSInteger, x)
#define to_value_CLActivityType(x) TO_ENUM(CLActivityType, NSInteger, x)
#define is_value_CLActivityType(x) IS_ENUM(CLActivityType, NSInteger, x)

JS_WRAP_CLASS(CLLocationManager, NSObject);
  JS_STATIC_METHOD(locationServicesEnabled);
  JS_STATIC_METHOD(headingAvailable);
  JS_STATIC_METHOD(significantLocationChangeMonitoringAvailable);
  JS_STATIC_METHOD(isMonitoringAvailableForClass);
  JS_STATIC_METHOD(regionMonitoringAvailable);
  JS_STATIC_METHOD(regionMonitoringEnabled);
  JS_STATIC_METHOD(isRangingAvailable);
  JS_STATIC_METHOD(authorizationStatus);
  JS_STATIC_METHOD(deferredLocationUpdatesAvailable);
  JS_METHOD(requestWhenInUseAuthorization);
  JS_METHOD(requestAlwaysAuthorization);
  JS_METHOD(startUpdatingLocation);
  JS_METHOD(stopUpdatingLocation);
  JS_METHOD(requestLocation);
  JS_METHOD(startUpdatingHeading);
  JS_METHOD(stopUpdatingHeading);
  JS_METHOD(dismissHeadingCalibrationDisplay);
  JS_METHOD(startMonitoringSignificantLocationChanges);
  JS_METHOD(stopMonitoringSignificantLocationChanges);
  JS_METHOD(startMonitoringForRegionDesiredAccuracy);
  JS_METHOD(stopMonitoringForRegion);
  JS_METHOD(startMonitoringForRegion);
  JS_METHOD(requestStateForRegion);
  JS_METHOD(startRangingBeaconsInRegion);
  JS_METHOD(stopRangingBeaconsInRegion);
  JS_METHOD(allowDeferredLocationUpdatesUntilTraveledTimeout);
  JS_METHOD(disallowDeferredLocationUpdates);
  JS_PROP(delegate);
  JS_PROP_READONLY(locationServicesEnabled);
  JS_PROP(purpose);
  JS_PROP(activityType);
  JS_PROP(distanceFilter);
  JS_PROP(desiredAccuracy);
  JS_PROP(pausesLocationUpdatesAutomatically);
  JS_PROP(allowsBackgroundLocationUpdates);
  JS_PROP(showsBackgroundLocationIndicator);
  JS_PROP_READONLY(location);
  JS_PROP_READONLY(headingAvailable);
  JS_PROP(headingFilter);
  JS_PROP(headingOrientation);
  JS_PROP_READONLY(heading);
  JS_PROP_READONLY(maximumRegionMonitoringDistance);
  JS_PROP_READONLY(monitoredRegions);
  JS_PROP_READONLY(rangedRegions);
JS_WRAP_CLASS_END(CLLocationManager);

#endif /* NCLLocationManager_h */
