//
//  NARLightEstimate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARLightEstimate_h
#define NARLightEstimate_h

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARLightEstimate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARLightEstimate();
  virtual ~NARLightEstimate();

  static NAN_METHOD(New);
  JS_PROP(AmbientIntensity);
  JS_PROP(AmbientColorTemperature);
};

#endif /* NARLightEstimate_h */
