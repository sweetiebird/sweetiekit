//
//  NARSKViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKViewDelegate_h
#define NARSKViewDelegate_h

#import <UIKit/UIKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARSKViewDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARSKViewDelegate();
  virtual ~NARSKViewDelegate();

  static NAN_METHOD(New);
  sweetiekit::JSFunction _nodeForAnchor;
};

#endif /* NARSKViewDelegate_h */
