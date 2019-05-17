//
//  NUINavigationBar.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationBar_h
#define NUINavigationBar_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUINavigationBar : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUINavigationBar();
  virtual ~NUINavigationBar();

  static NAN_METHOD(New);
  JS_PROP(barStyle);
};

#endif /* NUINavigationBar_h */
