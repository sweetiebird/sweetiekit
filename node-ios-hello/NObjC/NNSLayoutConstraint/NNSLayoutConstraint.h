//
//  NNSLayoutConstraint.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutConstraint_h
#define NNSLayoutConstraint_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NNSLayoutConstraint : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSLayoutConstraint();
  virtual ~NNSLayoutConstraint();

  static NAN_METHOD(New);
  JS_PROP(IsActive);
};

#endif /* NNSLayoutConstraint_h */
