//
//  NSCNView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNView_h
#define NSCNView_h

#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNView();
  virtual ~NSCNView();

  static NAN_METHOD(New);
  JS_PROP(AutoenablesDefaultLighting);
  JS_PROP(Playing);
};

#endif /* NSCNView_h */
