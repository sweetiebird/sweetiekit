//
//  NUIResponder.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIResponder_h
#define NUIResponder_h

#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NUIResponder : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIResponder();
  virtual ~NUIResponder();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
};

#endif /* NUIResponder_h */
