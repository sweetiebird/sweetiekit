//
//  NUIPresentationController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPresentationController_h
#define NUIPresentationController_h

#include "NNSObject.h"

using namespace v8;
using namespace node;

class NUIPresentationController : public NNSObject {
public:
  
  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);
  
  NUIPresentationController();
  virtual ~NUIPresentationController();
  
  static NAN_METHOD(New);
};

#endif /* NUIPresentationController_h */
