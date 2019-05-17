//
//  NARCamera.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARCamera_h
#define NARCamera_h

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARCamera : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARCamera();
  virtual ~NARCamera();

  static NAN_METHOD(New);
  JS_PROP(Transform);
};

#endif /* NARCamera_h */
