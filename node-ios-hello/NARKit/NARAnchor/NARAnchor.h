//
//  NARAnchor.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARAnchor_h
#define NARAnchor_h

#import <UIKit/UIKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARAnchor : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARAnchor();
  virtual ~NARAnchor();

  static NAN_METHOD(New);
  static NAN_METHOD(InitWithTransform);
  
  JS_PROP(name);
  JS_PROP(identifier);
  JS_PROP(transform);
};


#endif /* NARAnchor_h */
