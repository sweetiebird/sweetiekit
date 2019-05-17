//
//  NNSLayoutAnchor.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutAnchor_h
#define NNSLayoutAnchor_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NNSLayoutAnchor : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSLayoutAnchor();
  virtual ~NNSLayoutAnchor();

  static NAN_METHOD(New);
  static NAN_METHOD(ConstraintEqualToAnchor);
};

#endif /* NNSLayoutAnchor_h */
