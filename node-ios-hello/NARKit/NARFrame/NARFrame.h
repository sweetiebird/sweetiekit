//
//  NARFrame.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARFrame_h
#define NARFrame_h

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARFrame : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARFrame();
  virtual ~NARFrame();

  static NAN_METHOD(New);
  JS_PROP(Camera);
  JS_PROP(LightEstimate);
  JS_PROP(capturedImage);
};

#endif /* NARFrame_h */
