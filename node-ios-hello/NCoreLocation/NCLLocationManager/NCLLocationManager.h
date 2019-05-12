//
//  NCLLocationManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocationManager_h
#define NCLLocationManager_h

#import <CoreLocation/CoreLocation.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCLLocationManager : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLLocationManager();
  virtual ~NCLLocationManager();

  static NAN_METHOD(New);
  static NAN_METHOD(StartUpdatingLocation);
  static NAN_METHOD(StartUpdatingHeading);
  static NAN_METHOD(RequestAlwaysAuthorization);
  static NAN_METHOD(RequestWhenInUseAuthorization);
  JS_PROP(Delegate);
  JS_PROP(DesiredAccuracy);
  JS_PROP(DistanceFilter);
  JS_PROP(HeadingFilter);
  
  Nan::Persistent<Value> _delegate;
};

#endif /* NCLLocationManager_h */
