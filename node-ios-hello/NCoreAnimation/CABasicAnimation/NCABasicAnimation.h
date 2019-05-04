//
//  CABasicAnimation.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef CABasicAnimation_h
#define CABasicAnimation_h

#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NCABasicAnimation : public NNSObject {
public:
  
  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);
  
  NCABasicAnimation();
  virtual ~NCABasicAnimation();
  
  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  JS_PROP(FromValue);
  JS_PROP(ToValue);
  JS_PROP(Duration);
};

#endif /* CABasicAnimation_h */
