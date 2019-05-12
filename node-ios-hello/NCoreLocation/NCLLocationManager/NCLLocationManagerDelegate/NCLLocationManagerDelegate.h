//
//  NCLLocationManagerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLLocationManagerDelegate_h
#define NCLLocationManagerDelegate_h

#import <CoreLocation/CoreLocation.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCLLocationManagerDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLLocationManagerDelegate();
  virtual ~NCLLocationManagerDelegate();

  static NAN_METHOD(New);
  sweetiekit::JSFunction _onAuthorization;
  sweetiekit::JSFunction _didUpdateLocations;
};

#endif /* NCLLocationManagerDelegate_h */
