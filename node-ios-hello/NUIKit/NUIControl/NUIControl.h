//
//  NUIControl.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIControl_h
#define NUIControl_h

#include "defines.h"
#include "NUIView.h"

using namespace v8;
using namespace node;

class NUIControl : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIControl();
  virtual ~NUIControl();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(addTarget);
  JS_PROP(State);
  JS_PROP(Enabled);
  JS_PROP(Selected);
  JS_PROP(Highlighted);
  JS_PROP(Tracking);
  JS_PROP(TouchInside);
};


#endif /* NUIControl_h */
