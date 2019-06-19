//
//  NCLLocationManagerDelegate.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLLocationManagerDelegate.h"

NCLLocationManagerDelegate::NCLLocationManagerDelegate () {}
NCLLocationManagerDelegate::~NCLLocationManagerDelegate () {}

JS_INIT_CLASS(CLLocationManagerDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(locationManagerDidUpdateToLocationFromLocation);
  JS_ASSIGN_PROTO_PROP(locationManagerDidUpdateLocations);
  JS_ASSIGN_PROTO_PROP(locationManagerDidUpdateHeading);
  JS_ASSIGN_PROTO_PROP(locationManagerShouldDisplayHeadingCalibration);
  JS_ASSIGN_PROTO_PROP(locationManagerDidDetermineStateForRegion);
  JS_ASSIGN_PROTO_PROP(locationManagerDidRangeBeaconsInRegion);
  JS_ASSIGN_PROTO_PROP(locationManagerRangingBeaconsDidFailForRegionWithError);
  JS_ASSIGN_PROTO_PROP(locationManagerDidEnterRegion);
  JS_ASSIGN_PROTO_PROP(locationManagerDidExitRegion);
  JS_ASSIGN_PROTO_PROP(locationManagerDidFailWithError);
  JS_ASSIGN_PROTO_PROP(locationManagerMonitoringDidFailForRegionWithError);
  JS_ASSIGN_PROTO_PROP(locationManagerDidChangeAuthorizationStatus);
  JS_ASSIGN_PROTO_PROP(locationManagerDidStartMonitoringForRegion);
  JS_ASSIGN_PROTO_PROP(locationManagerDidPauseLocationUpdates);
  JS_ASSIGN_PROTO_PROP(locationManagerDidResumeLocationUpdates);
  JS_ASSIGN_PROTO_PROP(locationManagerDidFinishDeferredUpdatesWithError);
  JS_ASSIGN_PROTO_PROP(locationManagerDidVisit);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLLocationManagerDelegate, NSObject);
JS_INIT_CLASS_END(CLLocationManagerDelegate, NSObject);

NAN_METHOD(NCLLocationManagerDelegate::New) {
  JS_RECONSTRUCT(CLLocationManagerDelegate);
  @autoreleasepool {
    CLLocationManagerDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLLocationManagerDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLLocationManagerDelegate alloc] init];
    }
    if (self) {
      NCLLocationManagerDelegate *wrapper = new NCLLocationManagerDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLLocationManagerDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidUpdateToLocationFromLocation);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidUpdateLocations);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidUpdateHeading);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerShouldDisplayHeadingCalibration);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidDetermineStateForRegion);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidRangeBeaconsInRegion);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerRangingBeaconsDidFailForRegionWithError);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidEnterRegion);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidExitRegion);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidFailWithError);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerMonitoringDidFailForRegionWithError);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidChangeAuthorizationStatus);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidStartMonitoringForRegion);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidPauseLocationUpdates);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidResumeLocationUpdates);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidFinishDeferredUpdatesWithError);
DELEGATE_PROP(CLLocationManagerDelegate, locationManagerDidVisit);

#include "NCLLocationManager.h"
#include "NCLHeading.h"
#include "NCLRegion.h"
#include "NCLBeaconRegion.h"
#include "NNSError.h"
#include "NCLVisit.h"

@implementation CLLocationManagerDelegate

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
- (void)locationManager:(CLLocationManager *)manager
   didUpdateLocations:(NSArray<CLLocation *> *)locations API_AVAILABLE(ios(6.0), macos(10.9))
{
  call_delegate(noop(), locationManagerDidUpdateLocations,
    js_value_CLLocationManager(manager),
    js_value_NSArray(locations));
}

/*
 *  locationManager:didUpdateHeading:
 *  
 *  Discussion:
 *    Invoked when a new heading is available.
 */
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidUpdateHeading,
    js_value_CLLocationManager(manager),
    js_value_CLHeading(newHeading));
}

/*
 *  locationManagerShouldDisplayHeadingCalibration:
 *
 *  Discussion:
 *    Invoked when a new heading is available. Return YES to display heading calibration info. The display 
 *    will remain until heading is calibrated, unless dismissed early via dismissHeadingCalibrationDisplay.
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager  API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  __block BOOL result = YES;
  call_delegate(result = to_value_BOOL(JS_RESULT),
    locationManagerShouldDisplayHeadingCalibration,
    js_value_CLLocationManager(manager));
  return result;
}

/*
 *  locationManager:didDetermineState:forRegion:
 *
 *  Discussion:
 *    Invoked when there's a state transition for a monitored region or in response to a request for state via a
 *    a call to requestStateForRegion:.
 */
- (void)locationManager:(CLLocationManager *)manager
  didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region API_AVAILABLE(ios(7.0), macos(10.10)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidDetermineStateForRegion,
    js_value_CLLocationManager(manager),
    js_value_CLRegionState(state),
    js_value_CLRegion(region));
}

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
- (void)locationManager:(CLLocationManager *)manager
  didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidRangeBeaconsInRegion,
    js_value_CLLocationManager(manager),
    js_value_NSArray(beacons),
    js_value_CLBeaconRegion(region));
}

/*
 *  locationManager:rangingBeaconsDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when an error has occurred ranging beacons in a region. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
  rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region
  withError:(NSError *)error API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerRangingBeaconsDidFailForRegionWithError,
    js_value_CLLocationManager(manager),
    js_value_CLBeaconRegion(region),
    js_value_NSError(error));
}

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
  didEnterRegion:(CLRegion *)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidEnterRegion,
    js_value_CLLocationManager(manager),
    js_value_CLBeaconRegion(region));
}

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
  didExitRegion:(CLRegion *)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidExitRegion,
    js_value_CLLocationManager(manager),
    js_value_CLBeaconRegion(region));
}

/*
 *  locationManager:didFailWithError:
 *  
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
  didFailWithError:(NSError *)error
{
  call_delegate(noop(), locationManagerDidFailWithError,
    js_value_CLLocationManager(manager),
    js_value_NSError(error));
}

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *  
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
  monitoringDidFailForRegion:(nullable CLRegion *)region
  withError:(NSError *)error API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerMonitoringDidFailForRegionWithError,
    js_value_CLLocationManager(manager),
    js_value_CLBeaconRegion(region),
    js_value_NSError(error));
}

/*
 *  locationManager:didChangeAuthorizationStatus:
 *  
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_AVAILABLE(ios(4.2), macos(10.7))
{
  call_delegate(noop(), locationManagerDidChangeAuthorizationStatus,
    js_value_CLLocationManager(manager),
    js_value_CLAuthorizationStatus(status));
}

/*
 *  locationManager:didStartMonitoringForRegion:
 *  
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
- (void)locationManager:(CLLocationManager *)manager
  didStartMonitoringForRegion:(CLRegion *)region API_AVAILABLE(ios(5.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidStartMonitoringForRegion,
    js_value_CLLocationManager(manager),
    js_value_CLBeaconRegion(region));
}

/*
 *  Discussion:
 *    Invoked when location updates are automatically paused.
 */
- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidPauseLocationUpdates,
    js_value_CLLocationManager(manager));
}

/*
 *  Discussion:
 *    Invoked when location updates are automatically resumed.
 *
 *    In the event that your application is terminated while suspended, you will
 *    not receive this notification.
 */
- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidResumeLocationUpdates,
    js_value_CLLocationManager(manager));
}

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
- (void)locationManager:(CLLocationManager *)manager
  didFinishDeferredUpdatesWithError:(nullable NSError *)error API_AVAILABLE(ios(6.0), macos(10.9)) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidFinishDeferredUpdatesWithError,
    js_value_CLLocationManager(manager),
    js_value_NSError(error));
}

/*
 *  locationManager:didVisit:
 *
 *  Discussion:
 *    Invoked when the CLLocationManager determines that the device has visited
 *    a location, if visit monitoring is currently started (possibly from a
 *    prior launch).
 */
- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
  call_delegate(noop(), locationManagerDidVisit,
    js_value_CLLocationManager(manager),
    js_value_CLVisit(visit));
}

@end
