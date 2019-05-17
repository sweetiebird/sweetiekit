//
//  NUITouch.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITouch_h
#define NUITouch_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITouch : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITouch();
  virtual ~NUITouch();

  static NAN_METHOD(New);
  static NAN_METHOD(locationInView);
};

#endif /* NUITouch_h */
