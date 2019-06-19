//
//  NCLLocationManager.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"

NCLLocationManager::NCLLocationManager () {}
NCLLocationManager::~NCLLocationManager () {}

JS_INIT_CLASS(CLLocationManager, NSObject);
  JS_ASSIGN_STATIC_METHOD(locationServicesEnabled);
  JS_ASSIGN_STATIC_METHOD(headingAvailable);
  JS_ASSIGN_STATIC_METHOD(significantLocationChangeMonitoringAvailable);
  JS_ASSIGN_STATIC_METHOD(isMonitoringAvailableForClass);
  JS_ASSIGN_STATIC_METHOD(regionMonitoringAvailable);
  JS_ASSIGN_STATIC_METHOD(regionMonitoringEnabled);
  JS_ASSIGN_STATIC_METHOD(isRangingAvailable);
  JS_ASSIGN_STATIC_METHOD(authorizationStatus);
  JS_ASSIGN_STATIC_METHOD(deferredLocationUpdatesAvailable);
  JS_ASSIGN_PROTO_METHOD(requestWhenInUseAuthorization);
  JS_ASSIGN_PROTO_METHOD(requestAlwaysAuthorization);
  JS_ASSIGN_PROTO_METHOD(startUpdatingLocation);
  JS_ASSIGN_PROTO_METHOD(stopUpdatingLocation);
  JS_ASSIGN_PROTO_METHOD(requestLocation);
  JS_ASSIGN_PROTO_METHOD(startUpdatingHeading);
  JS_ASSIGN_PROTO_METHOD(stopUpdatingHeading);
  JS_ASSIGN_PROTO_METHOD(dismissHeadingCalibrationDisplay);
  JS_ASSIGN_PROTO_METHOD(startMonitoringSignificantLocationChanges);
  JS_ASSIGN_PROTO_METHOD(stopMonitoringSignificantLocationChanges);
  JS_ASSIGN_PROTO_METHOD(startMonitoringForRegionDesiredAccuracy);
  JS_ASSIGN_PROTO_METHOD(stopMonitoringForRegion);
  JS_ASSIGN_PROTO_METHOD(startMonitoringForRegion);
  JS_ASSIGN_PROTO_METHOD(requestStateForRegion);
  JS_ASSIGN_PROTO_METHOD(startRangingBeaconsInRegion);
  JS_ASSIGN_PROTO_METHOD(stopRangingBeaconsInRegion);
  JS_ASSIGN_PROTO_METHOD(allowDeferredLocationUpdatesUntilTraveledTimeout);
  JS_ASSIGN_PROTO_METHOD(disallowDeferredLocationUpdates);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(locationServicesEnabled);
  JS_ASSIGN_PROTO_PROP(purpose);
  JS_ASSIGN_PROTO_PROP(activityType);
  JS_ASSIGN_PROTO_PROP(distanceFilter);
  JS_ASSIGN_PROTO_PROP(desiredAccuracy);
  JS_ASSIGN_PROTO_PROP(pausesLocationUpdatesAutomatically);
  JS_ASSIGN_PROTO_PROP(allowsBackgroundLocationUpdates);
  JS_ASSIGN_PROTO_PROP(showsBackgroundLocationIndicator);
  JS_ASSIGN_PROTO_PROP_READONLY(location);
  JS_ASSIGN_PROTO_PROP_READONLY(headingAvailable);
  JS_ASSIGN_PROTO_PROP(headingFilter);
  JS_ASSIGN_PROTO_PROP(headingOrientation);
  JS_ASSIGN_PROTO_PROP_READONLY(heading);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumRegionMonitoringDistance);
  JS_ASSIGN_PROTO_PROP_READONLY(monitoredRegions);
  JS_ASSIGN_PROTO_PROP_READONLY(rangedRegions);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLLocationManager, NSObject);
  // constants (exports)

  //typedef NS_ENUM(int, CLDeviceOrientation) {
    JS_ASSIGN_ENUM(CLDeviceOrientationUnknown, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationPortrait, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationPortraitUpsideDown, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationLandscapeLeft, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationLandscapeRight, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationFaceUp, int);
    JS_ASSIGN_ENUM(CLDeviceOrientationFaceDown, int);
  //};

  //typedef NS_ENUM(int, CLAuthorizationStatus) {
    // User has not yet made a choice with regards to this application
    JS_ASSIGN_ENUM(kCLAuthorizationStatusNotDetermined, int);

    // This application is not authorized to use location services.  Due
    // to active restrictions on location services, the user cannot change
    // this status, and may not have personally denied authorization
    JS_ASSIGN_ENUM(kCLAuthorizationStatusRestricted, int);

    // User has explicitly denied authorization for this application, or
    // location services are disabled in Settings.
    JS_ASSIGN_ENUM(kCLAuthorizationStatusDenied, int);

    // User has granted authorization to use their location at any time,
    // including monitoring for regions, visits, or significant location changes.
    //
    // This value should be used on iOS, tvOS and watchOS.  It is available on
    // MacOS, but kCLAuthorizationStatusAuthorized is synonymous and preferred.
    JS_ASSIGN_ENUM(kCLAuthorizationStatusAuthorizedAlways, int);

    // User has granted authorization to use their location only when your app
    // is visible to them (it will be made visible to them if you continue to
    // receive location updates while in the background).  Authorization to use
    // launch APIs has not been granted.
    //
    // This value is not available on MacOS.  It should be used on iOS, tvOS and
    // watchOS.
    JS_ASSIGN_ENUM(kCLAuthorizationStatusAuthorizedWhenInUse, int);

    // User has authorized this application to use location services.
    //
    // This value is deprecated or prohibited on iOS, tvOS and watchOS.
    // It should be used on MacOS.
    JS_ASSIGN_ENUM(kCLAuthorizationStatusAuthorized, int); // API_DEPRECATED("Use kCLAuthorizationStatusAuthorizedAlways", ios(2.0, 8.0)) API_AVAILABLE(macos(10.6)) API_UNAVAILABLE(watchos, tvos) = kCLAuthorizationStatusAuthorizedAlways
  //};

  //typedef NS_ENUM(NSInteger, CLActivityType) {
    JS_ASSIGN_ENUM(CLActivityTypeOther, NSInteger); // = 1,
    JS_ASSIGN_ENUM(CLActivityTypeAutomotiveNavigation, NSInteger); //,  // for automotive navigation
    JS_ASSIGN_ENUM(CLActivityTypeFitness, NSInteger); //,        // includes any pedestrian activities
    JS_ASSIGN_ENUM(CLActivityTypeOtherNavigation, NSInteger); //,     // for other navigation cases (excluding pedestrian navigation), e.g. navigation for boats, trains, or planes
    JS_ASSIGN_ENUM(CLActivityTypeAirborne, NSInteger); // API_AVAILABLE(ios(12.0), macos(10.14), tvos(12.0), watchos(5.0)),
  //};

JS_INIT_CLASS_END(CLLocationManager, NSObject);

NAN_METHOD(NCLLocationManager::New) {
  JS_RECONSTRUCT(CLLocationManager);
  @autoreleasepool {
    CLLocationManager* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLLocationManager *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLLocationManager alloc] init];
    }
    if (self) {
      NCLLocationManager *wrapper = new NCLLocationManager();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLLocationManager::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCLLocationManager::locationServicesEnabled) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager locationServicesEnabled]));
  }
}

NAN_METHOD(NCLLocationManager::headingAvailable) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager headingAvailable]));
  }
}

NAN_METHOD(NCLLocationManager::significantLocationChangeMonitoringAvailable) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager significantLocationChangeMonitoringAvailable]));
  }
}

NAN_METHOD(NCLLocationManager::isMonitoringAvailableForClass) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* Class*/, regionClass);
    JS_SET_RETURN(js_value_BOOL([CLLocationManager isMonitoringAvailableForClass: regionClass]));
  }
}

NAN_METHOD(NCLLocationManager::regionMonitoringAvailable) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager regionMonitoringAvailable]));
  }
}

NAN_METHOD(NCLLocationManager::regionMonitoringEnabled) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager regionMonitoringEnabled]));
  }
}

NAN_METHOD(NCLLocationManager::isRangingAvailable) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager isRangingAvailable]));
  }
}

NAN_METHOD(NCLLocationManager::authorizationStatus) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLAuthorizationStatus([CLLocationManager authorizationStatus]));
  }
}

NAN_METHOD(NCLLocationManager::deferredLocationUpdatesAvailable) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([CLLocationManager deferredLocationUpdatesAvailable]));
  }
}

NAN_METHOD(NCLLocationManager::requestWhenInUseAuthorization) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self requestWhenInUseAuthorization];
  }
}

NAN_METHOD(NCLLocationManager::requestAlwaysAuthorization) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self requestAlwaysAuthorization];
  }
}

NAN_METHOD(NCLLocationManager::startUpdatingLocation) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self startUpdatingLocation];
  }
}

NAN_METHOD(NCLLocationManager::stopUpdatingLocation) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self stopUpdatingLocation];
  }
}

NAN_METHOD(NCLLocationManager::requestLocation) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self requestLocation];
  }
}

NAN_METHOD(NCLLocationManager::startUpdatingHeading) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self startUpdatingHeading];
  }
}

NAN_METHOD(NCLLocationManager::stopUpdatingHeading) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self stopUpdatingHeading];
  }
}

NAN_METHOD(NCLLocationManager::dismissHeadingCalibrationDisplay) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self dismissHeadingCalibrationDisplay];
  }
}

NAN_METHOD(NCLLocationManager::startMonitoringSignificantLocationChanges) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self startMonitoringSignificantLocationChanges];
  }
}

NAN_METHOD(NCLLocationManager::stopMonitoringSignificantLocationChanges) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self stopMonitoringSignificantLocationChanges];
  }
}

#include "NCLRegion.h"
#include "NCLLocation.h"

NAN_METHOD(NCLLocationManager::startMonitoringForRegionDesiredAccuracy) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLRegion, region);
    declare_value(CLLocationAccuracy, accuracy);
    [self startMonitoringForRegion: region desiredAccuracy: accuracy];
  }
}

NAN_METHOD(NCLLocationManager::stopMonitoringForRegion) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLRegion, region);
    [self stopMonitoringForRegion: region];
  }
}

NAN_METHOD(NCLLocationManager::startMonitoringForRegion) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLRegion, region);
    [self startMonitoringForRegion: region];
  }
}

NAN_METHOD(NCLLocationManager::requestStateForRegion) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLRegion, region);
    [self requestStateForRegion: region];
  }
}

#include "NCLBeaconRegion.h"

NAN_METHOD(NCLLocationManager::startRangingBeaconsInRegion) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLBeaconRegion, region);
    [self startRangingBeaconsInRegion: region];
  }
}

NAN_METHOD(NCLLocationManager::stopRangingBeaconsInRegion) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLBeaconRegion, region);
    [self stopRangingBeaconsInRegion: region];
  }
}

NAN_METHOD(NCLLocationManager::allowDeferredLocationUpdatesUntilTraveledTimeout) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationDistance, distance);
    declare_value(NSTimeInterval, timeout);
    [self allowDeferredLocationUpdatesUntilTraveled: distance timeout: timeout];
  }
}

NAN_METHOD(NCLLocationManager::disallowDeferredLocationUpdates) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    [self disallowDeferredLocationUpdates];
  }
}

NAN_GETTER(NCLLocationManager::delegateGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <CLLocationManagerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NCLLocationManager::delegateSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <CLLocationManagerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NCLLocationManager::locationServicesEnabledGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self locationServicesEnabled]));
  }
}

NAN_GETTER(NCLLocationManager::purposeGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self purpose]));
  }
}

NAN_SETTER(NCLLocationManager::purposeSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPurpose: input];
  }
}

NAN_GETTER(NCLLocationManager::activityTypeGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLActivityType([self activityType]));
  }
}

NAN_SETTER(NCLLocationManager::activityTypeSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLActivityType, input);
    [self setActivityType: input];
  }
}

NAN_GETTER(NCLLocationManager::distanceFilterGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDistance([self distanceFilter]));
  }
}

NAN_SETTER(NCLLocationManager::distanceFilterSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationDistance, input);
    [self setDistanceFilter: input];
  }
}

NAN_GETTER(NCLLocationManager::desiredAccuracyGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationAccuracy([self desiredAccuracy]));
  }
}

NAN_SETTER(NCLLocationManager::desiredAccuracySetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationAccuracy, input);
    [self setDesiredAccuracy: input];
  }
}

NAN_GETTER(NCLLocationManager::pausesLocationUpdatesAutomaticallyGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self pausesLocationUpdatesAutomatically]));
  }
}

NAN_SETTER(NCLLocationManager::pausesLocationUpdatesAutomaticallySetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPausesLocationUpdatesAutomatically: input];
  }
}

NAN_GETTER(NCLLocationManager::allowsBackgroundLocationUpdatesGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self allowsBackgroundLocationUpdates]));
  }
}

NAN_SETTER(NCLLocationManager::allowsBackgroundLocationUpdatesSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAllowsBackgroundLocationUpdates: input];
  }
}

NAN_GETTER(NCLLocationManager::showsBackgroundLocationIndicatorGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsBackgroundLocationIndicator]));
  }
}

NAN_SETTER(NCLLocationManager::showsBackgroundLocationIndicatorSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsBackgroundLocationIndicator: input];
  }
}

NAN_GETTER(NCLLocationManager::locationGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocation([self location]));
  }
}

NAN_GETTER(NCLLocationManager::headingAvailableGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self headingAvailable]));
  }
}

NAN_GETTER(NCLLocationManager::headingFilterGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDegrees([self headingFilter]));
  }
}

NAN_SETTER(NCLLocationManager::headingFilterSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLLocationDegrees, input);
    [self setHeadingFilter: input];
  }
}

NAN_GETTER(NCLLocationManager::headingOrientationGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLDeviceOrientation([self headingOrientation]));
  }
}

NAN_SETTER(NCLLocationManager::headingOrientationSetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CLDeviceOrientation, input);
    [self setHeadingOrientation: input];
  }
}

#include "NCLHeading.h"

NAN_GETTER(NCLLocationManager::headingGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLHeading([self heading]));
  }
}

NAN_GETTER(NCLLocationManager::maximumRegionMonitoringDistanceGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDistance([self maximumRegionMonitoringDistance]));
  }
}

NAN_GETTER(NCLLocationManager::monitoredRegionsGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <CLRegion*>*/([self monitoredRegions]));
  }
}

NAN_GETTER(NCLLocationManager::rangedRegionsGetter) {
  JS_UNWRAP(CLLocationManager, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet/* <CLRegion*>*/([self rangedRegions]));
  }
}
