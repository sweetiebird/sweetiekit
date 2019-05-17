//
//  NARSession.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSession_h
#define NARSession_h

#import <UIKit/UIKit.h>
#import "NSKView.h"
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARSession : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARSession();
  virtual ~NARSession();

  static NAN_METHOD(New);
  static NAN_METHOD(Run);
  static NAN_METHOD(Add);
  JS_PROP(CurrentFrame);
};

#endif /* NARSession_h */
