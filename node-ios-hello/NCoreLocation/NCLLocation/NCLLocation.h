//
//  NCLLocation.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocation_h
#define NCLLocation_h

#import "NNSObject.h"

#define js_value_CLLocation(x) js_value_wrapper(x, CLLocation)
#define to_value_CLLocation(x) to_value_wrapper(x, CLLocation)
#define is_value_CLLocation(x) is_value_wrapper(x, CLLocation)

/*
 *  CLLocationDegrees
 *  
 *  Discussion:
 *    Type used to represent a latitude or longitude coordinate in degrees under the WGS 84 reference
 *    frame. The degree can be positive (North and East) or negative (South and West).  
 */
#define js_value_CLLocationDegrees(x) js_value_double(x)
#define to_value_CLLocationDegrees(x) to_value_double(x)
#define is_value_CLLocationDegrees(x) is_value_double(x)

/*
 *  CLLocationAccuracy
 *  
 *  Discussion:
 *    Type used to represent a location accuracy level in meters. The lower the value in meters, the
 *    more physically precise the location is. A negative accuracy value indicates an invalid location.
 */
#define js_value_CLLocationAccuracy(x) js_value_double(x)
#define to_value_CLLocationAccuracy(x) to_value_double(x)
#define is_value_CLLocationAccuracy(x) is_value_double(x)

/*
 *  CLLocationSpeed
 *  
 *  Discussion:
 *    Type used to represent the speed in meters per second.
 */
#define js_value_CLLocationSpeed(x) js_value_double(x)
#define to_value_CLLocationSpeed(x) to_value_double(x)
#define is_value_CLLocationSpeed(x) is_value_double(x)

/*
 *  CLLocationDirection
 *  
 *  Discussion:
 *    Type used to represent the direction in degrees from 0 to 359.9. A negative value indicates an
 *    invalid direction.
 */
#define js_value_CLLocationDirection(x) js_value_double(x)
#define to_value_CLLocationDirection(x) to_value_double(x)
#define is_value_CLLocationDirection(x) is_value_double(x)

/*
 *  CLLocationDistance
 *  
 *  Discussion:
 *    Type used to represent a distance in meters.
 */
#define js_value_CLLocationDistance(x) js_value_double(x)
#define to_value_CLLocationDistance(x) to_value_double(x)
#define is_value_CLLocationDistance(x) is_value_double(x)


JS_WRAP_CLASS(CLLocation, NSObject);
  JS_PROP(Coordinate);
  JS_PROP(Altitude);
  JS_PROP(Floor);
  JS_PROP(HorizontalAccuracy);
  JS_PROP(VerticalAccuracy);
  JS_PROP(Timestamp);
  JS_METHOD(Distance);
  JS_PROP(Speed);
  JS_PROP(Course);
JS_WRAP_CLASS_END(CLLocation);

#endif /* NCLLocation_h */
