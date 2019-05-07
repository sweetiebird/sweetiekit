//
//  NARSKView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKView_h
#define NARSKView_h

#import <UIKit/UIKit.h>
#import "NSKView.h"
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARSKView : public NSKView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARSKView();
  virtual ~NARSKView();

  static NAN_METHOD(New);
  JS_PROP(Session);
};

#endif /* NARSKView_h */
