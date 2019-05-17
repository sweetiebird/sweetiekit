//
//  NCLHeading.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLHeading_h
#define NCLHeading_h

#import <CoreLocation/CoreLocation.h>
#import "NNSObject.h"

using namespace v8;
using namespace node;

class NCLHeading : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLHeading();
  virtual ~NCLHeading();

  static NAN_METHOD(New);
  JS_PROP(MagneticHeading);
  JS_PROP(TrueHeading);
  JS_PROP(HeadingAccuracy);
  JS_PROP(Timestamp);
  JS_PROP(X);
  JS_PROP(Y);
  JS_PROP(Z);
};

#endif /* NCLHeading_h */
