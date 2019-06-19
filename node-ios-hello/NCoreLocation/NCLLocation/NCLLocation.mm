//
//  NCLLocation.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLLocation.h"

#define instancetype CLLocation
#define js_value_instancetype js_value_CLLocation

NCLLocation::NCLLocation () {}
NCLLocation::~NCLLocation () {}

JS_INIT_CLASS(CLLocation, NSObject);
  // global functions
  JS_SET_METHOD(exports, "CLLocationCoordinate2DIsValid", CLLocationCoordinate2DIsValid);
  JS_SET_METHOD(exports, "CLLocationCoordinate2DMake", CLLocationCoordinate2DMake);

// CLLocation
  JS_ASSIGN_STATIC_METHOD(initWithLatitudeLongitude);
  JS_ASSIGN_STATIC_METHOD(initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyTimestamp);
  JS_ASSIGN_STATIC_METHOD(initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyCourseSpeedTimestamp);
  JS_ASSIGN_PROTO_METHOD(getDistanceFrom);
  JS_ASSIGN_PROTO_METHOD(distanceFromLocation);
  JS_ASSIGN_PROTO_PROP_READONLY(coordinate);
  JS_ASSIGN_PROTO_PROP_READONLY(altitude);
  JS_ASSIGN_PROTO_PROP_READONLY(horizontalAccuracy);
  JS_ASSIGN_PROTO_PROP_READONLY(verticalAccuracy);
  JS_ASSIGN_PROTO_PROP_READONLY(course);
  JS_ASSIGN_PROTO_PROP_READONLY(speed);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(floor);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLLocation, NSObject);
  // constants (exports)
  
/*
 *  kCLDistanceFilterNone
 *  
 *  Discussion:
 *    Use as the distanceFilter property for CLLocationManager. This indicates 
 *    to the location service that no minimum movement filter is desired - ie, client will be informed
 *    of any movement.
 */
  JS_ASSIGN_ENUM(kCLDistanceFilterNone, CLLocationDistance);

/*
 *  kCLLocationAccuracy<x>
 *  
 *  Discussion:
 *    Used to specify the accuracy level desired. The location service will try its best to achieve
 *    your desired accuracy. However, it is not guaranteed. To optimize
 *    power performance, be sure to specify an appropriate accuracy for your usage scenario (eg,
 *    use a large accuracy value when only a coarse location is needed).
 */
  JS_ASSIGN_ENUM(kCLLocationAccuracyBestForNavigation, CLLocationAccuracy);
  JS_ASSIGN_ENUM(kCLLocationAccuracyBest, CLLocationAccuracy);
  JS_ASSIGN_ENUM(kCLLocationAccuracyNearestTenMeters, CLLocationAccuracy);
  JS_ASSIGN_ENUM(kCLLocationAccuracyHundredMeters, CLLocationAccuracy);
  JS_ASSIGN_ENUM(kCLLocationAccuracyKilometer, CLLocationAccuracy);
  JS_ASSIGN_ENUM(kCLLocationAccuracyThreeKilometers, CLLocationAccuracy);

/*
 *  CLLocationDistanceMax
 *
 *  Discussion:
 *    Used to specify the maximum CLLocationDistance
 */
  JS_ASSIGN_ENUM(CLLocationDistanceMax, CLLocationDistance);

/*
 *  CLTimeIntervalMax
 *
 *  Discussion:
 *    Used to specify the maximum NSTimeInterval
 */
  JS_ASSIGN_ENUM(CLTimeIntervalMax, NSTimeInterval);
  
  JS_ASSIGN_ENUM(kCLLocationCoordinate2DInvalid, CLLocationCoordinate2D);

JS_INIT_CLASS_END(CLLocation, NSObject);

NAN_METHOD(NCLLocation::New) {
  JS_RECONSTRUCT(CLLocation);

  Local<Object> obj = info.This();

  NCLLocation *loc = new NCLLocation();

  if (info[0]->IsExternal()) {
    loc->SetNSObject((__bridge CLLocation *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double lat = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("latitude")));
      double lng = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("longitude")));
      loc->SetNSObject([[CLLocation alloc] initWithLatitude:lat longitude:lng]);
    }
  } else {
    @autoreleasepool {
        loc->SetNSObject([[CLLocation alloc] init]);
    }
  }
  loc->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

Local<Value>
js_value_CLLocationCoordinate2D(const CLLocationCoordinate2D& value)
{
  Nan::EscapableHandleScope handleScope;
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("latitude"), js_value_CLLocationDegrees(value.latitude));
  result->Set(JS_STR("longitude"), js_value_CLLocationDegrees(value.longitude));
  return handleScope.Escape(result);
}

CLLocationCoordinate2D
to_value_CLLocationCoordinate2D(const Local<Value>& value, bool* _Nullable failed)
{
  if (failed) {
    *failed = false;
  }

  if (!is_value_CLLocationCoordinate2D(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected CLLocationCoordinate2D");
    }
    return kCLLocationCoordinate2DInvalid;
  }

  CLLocationDegrees latitude = to_value_CLLocationDegrees(JS_OBJ(value)->Get(JS_STR("latitude")));
  CLLocationDegrees longitude = to_value_CLLocationDegrees(JS_OBJ(value)->Get(JS_STR("longitude")));
  return CLLocationCoordinate2DMake(latitude, longitude);
}

bool
is_value_CLLocationCoordinate2D(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_CLLocationDegrees(obj->Get(JS_STR("latitude")))) {
    return false;
  }
  if (!is_value_CLLocationDegrees(obj->Get(JS_STR("longitude")))) {
    return false;
  }
  return true;
}

NAN_METHOD(NCLLocation::CLLocationCoordinate2DIsValid) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, value);
    JS_SET_RETURN(js_value_BOOL(::CLLocationCoordinate2DIsValid(value)));
  }
}

NAN_METHOD(NCLLocation::CLLocationCoordinate2DMake) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationDegrees, latitude);
    declare_value(CLLocationDegrees, longitude);
    JS_SET_RETURN(js_value_CLLocationCoordinate2D(::CLLocationCoordinate2DMake(latitude, longitude)));
  }
}

NAN_METHOD(NCLLocation::initWithLatitudeLongitude) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationDegrees, latitude);
    declare_value(CLLocationDegrees, longitude);
    JS_SET_RETURN(js_value_instancetype([[CLLocation alloc] initWithLatitude: latitude longitude: longitude]));
  }
}

NAN_METHOD(NCLLocation::initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyTimestamp) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, coordinate);
    declare_value(CLLocationDistance, altitude);
    declare_value(CLLocationAccuracy, hAccuracy);
    declare_value(CLLocationAccuracy, vAccuracy);
    declare_pointer(NSDate, timestamp);
    JS_SET_RETURN(js_value_instancetype([[CLLocation alloc] initWithCoordinate: coordinate altitude: altitude horizontalAccuracy: hAccuracy verticalAccuracy: vAccuracy timestamp: timestamp]));
  }
}

NAN_METHOD(NCLLocation::initWithCoordinateAltitudeHorizontalAccuracyVerticalAccuracyCourseSpeedTimestamp) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, coordinate);
    declare_value(CLLocationDistance, altitude);
    declare_value(CLLocationAccuracy, hAccuracy);
    declare_value(CLLocationAccuracy, vAccuracy);
    declare_value(CLLocationDirection, course);
    declare_value(CLLocationSpeed, speed);
    declare_pointer(NSDate, timestamp);
    JS_SET_RETURN(js_value_instancetype([[CLLocation alloc] initWithCoordinate: coordinate altitude: altitude horizontalAccuracy: hAccuracy verticalAccuracy: vAccuracy course: course speed: speed timestamp: timestamp]));
  }
}

NAN_METHOD(NCLLocation::getDistanceFrom) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLLocation, location);
    JS_SET_RETURN(js_value_CLLocationDistance([self getDistanceFrom: location]));
  }
}

NAN_METHOD(NCLLocation::distanceFromLocation) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CLLocation, location);
    JS_SET_RETURN(js_value_CLLocationDistance([self distanceFromLocation: location]));
  }
}

NAN_GETTER(NCLLocation::coordinateGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self coordinate]));
  }
}

NAN_GETTER(NCLLocation::altitudeGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDistance([self altitude]));
  }
}

NAN_GETTER(NCLLocation::horizontalAccuracyGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationAccuracy([self horizontalAccuracy]));
  }
}

NAN_GETTER(NCLLocation::verticalAccuracyGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationAccuracy([self verticalAccuracy]));
  }
}

NAN_GETTER(NCLLocation::courseGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDirection([self course]));
  }
}

NAN_GETTER(NCLLocation::speedGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationSpeed([self speed]));
  }
}

NAN_GETTER(NCLLocation::timestampGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self timestamp]));
  }
}

#include "NCLFloor.h"

NAN_GETTER(NCLLocation::floorGetter) {
  JS_UNWRAP(CLLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLFloor([self floor]));
  }
}
