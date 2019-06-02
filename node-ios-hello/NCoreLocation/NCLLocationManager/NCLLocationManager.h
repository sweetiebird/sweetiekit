//
//  NCLLocationManager.h
//  node-ios-hello
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

JS_WRAP_CLASS(CLLocationManager, NSObject);
  JS_METHOD(StartUpdatingLocation);
  JS_METHOD(StartUpdatingHeading);
  JS_METHOD(RequestAlwaysAuthorization);
  JS_METHOD(RequestWhenInUseAuthorization);
  JS_PROP(Delegate);
  JS_PROP(DesiredAccuracy);
  JS_PROP(DistanceFilter);
  JS_PROP(HeadingFilter);
  
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(CLLocationManager);

#endif /* NCLLocationManager_h */
