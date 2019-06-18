//
//  NCLLocation.mm
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLLocation.h"

NCLLocation::NCLLocation () {}
NCLLocation::~NCLLocation () {}

JS_INIT_CLASS(CLLocation, NSObject);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "coordinate", Coordinate);
  JS_SET_PROP_READONLY(proto, "altitude", Altitude);
  JS_SET_PROP_READONLY(proto, "floor", Floor);
  JS_SET_PROP_READONLY(proto, "horizontalAccuracy", HorizontalAccuracy);
  JS_SET_PROP_READONLY(proto, "verticalAccuracy", VerticalAccuracy);
  JS_SET_PROP_READONLY(proto, "timestamp", Timestamp);
  JS_SET_METHOD(proto, "distance", Distance);
  JS_SET_PROP_READONLY(proto, "speed", Speed);
  JS_SET_PROP_READONLY(proto, "course", Course);
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

NAN_GETTER(NCLLocation::CoordinateGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  Local<Object> result = Object::New(Isolate::GetCurrent());
  double lng = [loc coordinate].longitude;
  double lat = [loc coordinate].latitude;
  result->Set(JS_STR("latitude"), JS_NUM(lat));
  result->Set(JS_STR("longitude"), JS_NUM(lng));

  JS_SET_RETURN(result);
}

NAN_GETTER(NCLLocation::FloorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);
  
  CLFloor* floor = [loc floor];
  if (floor != nullptr) {
    NSInteger level = [floor level];

    Local<Object> result = Object::New(Isolate::GetCurrent());
    result->Set(JS_STR("floor"), JS_NUM(level));

    JS_SET_RETURN(result);
  }
}

NAN_GETTER(NCLLocation::AltitudeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  double alt = [loc altitude];

  JS_SET_RETURN(JS_NUM(alt));
}

NAN_GETTER(NCLLocation::HorizontalAccuracyGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  double result = [loc horizontalAccuracy];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLLocation::VerticalAccuracyGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  double result = [loc verticalAccuracy];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLLocation::TimestampGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  NSDate* result = [loc timestamp];
  double milliseconds = 1000.0 * [result timeIntervalSince1970];

  JS_SET_RETURN(Nan::New<Date>(milliseconds).ToLocalChecked());
}

NAN_METHOD(NCLLocation::Distance) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc1);
  
  JS_UNWRAPPED(info[0], CLLocation, loc2);
  double result = [loc1 distanceFromLocation:loc2];
  
  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLLocation::SpeedGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  double result = [loc speed];

  JS_SET_RETURN(JS_NUM(result));
}

NAN_GETTER(NCLLocation::CourseGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CLLocation, loc);

  double result = [loc course];

  JS_SET_RETURN(JS_NUM(result));
}
