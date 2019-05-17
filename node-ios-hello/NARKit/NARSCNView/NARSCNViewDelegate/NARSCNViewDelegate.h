//
//  NARSCNViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNViewDelegate_h
#define NARSCNViewDelegate_h

#import <UIKit/UIKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARSCNViewDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARSCNViewDelegate();
  virtual ~NARSCNViewDelegate();

  static NAN_METHOD(New);
  sweetiekit::JSFunction _nodeForAnchor;
};

#endif /* NARSCNViewDelegate_h */
