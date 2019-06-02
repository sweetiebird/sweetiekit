//
//  NCLLocation.h
//  node-ios-hello
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
