//
//  NCLLocationManagerDelegate.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocationManagerDelegate_h
#define NCLLocationManagerDelegate_h

#import "NNSObject.h"

#define js_value_CLLocationManagerDelegate(x) js_value_wrapper(x, CLLocationManagerDelegate)
#define to_value_CLLocationManagerDelegate(x) to_value_wrapper(x, CLLocationManagerDelegate)
#define is_value_CLLocationManagerDelegate(x) is_value_wrapper(x, CLLocationManagerDelegate)

JS_WRAP_CLASS(CLLocationManagerDelegate, NSObject);
  JS_PROP(locationManagerDidUpdateToLocationFromLocation);
  JS_PROP(locationManagerDidUpdateLocations);
  JS_PROP(locationManagerDidUpdateHeading);
  JS_PROP(locationManagerShouldDisplayHeadingCalibration);
  JS_PROP(locationManagerDidDetermineStateForRegion);
  JS_PROP(locationManagerDidRangeBeaconsInRegion);
  JS_PROP(locationManagerRangingBeaconsDidFailForRegionWithError);
  JS_PROP(locationManagerDidEnterRegion);
  JS_PROP(locationManagerDidExitRegion);
  JS_PROP(locationManagerDidFailWithError);
  JS_PROP(locationManagerMonitoringDidFailForRegionWithError);
  JS_PROP(locationManagerDidChangeAuthorizationStatus);
  JS_PROP(locationManagerDidStartMonitoringForRegion);
  JS_PROP(locationManagerDidPauseLocationUpdates);
  JS_PROP(locationManagerDidResumeLocationUpdates);
  JS_PROP(locationManagerDidFinishDeferredUpdatesWithError);
  JS_PROP(locationManagerDidVisit);
JS_WRAP_CLASS_END(CLLocationManagerDelegate);

#if __OBJC__
@interface CLLocationManagerDelegate : NSObject<CLLocationManagerDelegate>
/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
     didUpdateLocations:(NSArray<CLLocation *> * _Nonnull)locations API_AVAILABLE(ios(6.0), macos(10.9));

/*
 *  locationManager:didUpdateHeading:
 *  
 *  Discussion:
 *    Invoked when a new heading is available.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
       didUpdateHeading:(CLHeading * _Nonnull)newHeading API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManagerShouldDisplayHeadingCalibration:
 *
 *  Discussion:
 *    Invoked when a new heading is available. Return YES to display heading calibration info. The display 
 *    will remain until heading is calibrated, unless dismissed early via dismissHeadingCalibrationDisplay.
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager * _Nonnull)manager  API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didDetermineState:forRegion:
 *
 *  Discussion:
 *    Invoked when there's a state transition for a monitored region or in response to a request for state via a
 *    a call to requestStateForRegion:.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didDetermineState:(CLRegionState)state forRegion:(CLRegion * _Nonnull)region API_AVAILABLE(ios(7.0), macos(10.10)) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didRangeBeacons:inRegion:
 *
 *  Discussion:
 *    Invoked when a new set of beacons are available in the specified region.
 *    beacons is an array of CLBeacon objects.
 *    If beacons is empty, it may be assumed no beacons that match the specified region are nearby.
 *    Similarly if a specific beacon no longer appears in beacons, it may be assumed the beacon is no longer received
 *    by the device.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didRangeBeacons:(NSArray<CLBeacon *> * _Nonnull)beacons inRegion:(CLBeaconRegion * _Nonnull)region API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:rangingBeaconsDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when an error has occurred ranging beacons in a region. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  rangingBeaconsDidFailForRegion:(CLBeaconRegion * _Nonnull)region
  withError:(NSError * _Nonnull)error API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didEnterRegion:(CLRegion * _Nonnull)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didExitRegion:(CLRegion * _Nonnull)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didFailWithError:
 *  
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didFailWithError:(NSError * _Nonnull)error;

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *  
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  monitoringDidFailForRegion:(nullable CLRegion *)region
  withError:(NSError * _Nonnull)error API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didChangeAuthorizationStatus:
 *  
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_AVAILABLE(ios(4.2), macos(10.7));

/*
 *  locationManager:didStartMonitoringForRegion:
 *  
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didStartMonitoringForRegion:(CLRegion * _Nonnull)region API_AVAILABLE(ios(5.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos);

/*
 *  Discussion:
 *    Invoked when location updates are automatically paused.
 */
- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager * _Nonnull)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  Discussion:
 *    Invoked when location updates are automatically resumed.
 *
 *    In the event that your application is terminated while suspended, you will
 *    not receive this notification.
 */
- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager * _Nonnull)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didFinishDeferredUpdatesWithError:
 *
 *  Discussion:
 *    Invoked when deferred updates will no longer be delivered. Stopping
 *    location, disallowing deferred updates, and meeting a specified criterion
 *    are all possible reasons for finishing deferred updates.
 *
 *    An error will be returned if deferred updates end before the specified
 *    criteria are met (see CLError), otherwise error will be nil.
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager
  didFinishDeferredUpdatesWithError:(nullable NSError *)error API_AVAILABLE(ios(6.0), macos(10.9)) API_UNAVAILABLE(watchos, tvos);

/*
 *  locationManager:didVisit:
 *
 *  Discussion:
 *    Invoked when the CLLocationManager determines that the device has visited
 *    a location, if visit monitoring is currently started (possibly from a
 *    prior launch).
 */
- (void)locationManager:(CLLocationManager * _Nonnull)manager didVisit:(CLVisit * _Nonnull)visit API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos);

@end
#endif

#endif /* NCLLocationManagerDelegate_h */
