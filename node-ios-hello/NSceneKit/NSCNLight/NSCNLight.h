//
//  NSCNLight.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNLight_h
#define NSCNLight_h

#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNLight : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNLight();
  virtual ~NSCNLight();

  static NAN_METHOD(New);
  JS_PROP(Type);
  JS_PROP(Color);
  JS_PROP(SpotInnerAngle);
  JS_PROP(SpotOuterAngle);
};

#endif /* NSCNLight_h */
