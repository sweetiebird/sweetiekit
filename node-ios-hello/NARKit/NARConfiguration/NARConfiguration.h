//
//  NARConfiguration.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARConfiguration_h
#define NARConfiguration_h

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARConfiguration : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARConfiguration();
  virtual ~NARConfiguration();

  static NAN_METHOD(New);
  JS_PROP(IsLightEstimationEnabled);
};

#endif /* NARConfiguration_h */
