//
//  NCLLocation.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocation_h
#define NCLLocation_h

#import <CoreLocation/CoreLocation.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCLLocation : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLLocation();
  virtual ~NCLLocation();

  static NAN_METHOD(New);
  JS_PROP(Coordinate);
  JS_PROP(Altitude);
  JS_PROP(Floor);
  JS_PROP(HorizontalAccuracy);
  JS_PROP(VerticalAccuracy);
  JS_PROP(Timestamp);
  static NAN_METHOD(Distance);
  JS_PROP(Speed);
  JS_PROP(Course);
};

#endif /* NCLLocation_h */
