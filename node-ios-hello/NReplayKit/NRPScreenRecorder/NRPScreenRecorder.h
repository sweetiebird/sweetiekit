//
//  NRPScreenRecorder.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPScreenRecorder_h
#define NRPScreenRecorder_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NRPScreenRecorder : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NRPScreenRecorder();
  virtual ~NRPScreenRecorder();

  static NAN_METHOD(New);
};

#endif /* NRPScreenRecorder_h */