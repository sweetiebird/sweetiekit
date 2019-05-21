//
//  NUITabBar.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-20.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBar_h
#define NUITabBar_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITabBar : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITabBar();
  virtual ~NUITabBar();

  static NAN_METHOD(New);
  JS_PROP(barTintColor);
  JS_PROP(tintColor);
  JS_PROP(unselectedItemTintColor);
};

#endif /* NUITabBar_h */
