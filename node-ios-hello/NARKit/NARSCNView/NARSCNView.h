//
//  NARSCNView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNView_h
#define NARSCNView_h

#import <UIKit/UIKit.h>
#import "NSCNView.h"
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARSCNView : public NSCNView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARSCNView();
  virtual ~NARSCNView();

  static NAN_METHOD(New);
  static NAN_METHOD(PresentScene);
  JS_PROP(Session);
  JS_PROP(Delegate);
  JS_PROP(Scene);
  JS_PROP(AutomaticallyUpdatesLighting);
  
  Nan::Persistent<Value> _delegate;
};

#endif /* NARSCNView_h */
