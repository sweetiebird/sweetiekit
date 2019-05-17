//
//  NUINavigationController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationController_h
#define NUINavigationController_h

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUINavigationController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUINavigationController();
  virtual ~NUINavigationController();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(SetViewControllers);
  static NAN_METHOD(PushViewController);
  static NAN_METHOD(PopViewController);
  static NAN_METHOD(PopToRootViewController);
  static NAN_METHOD(PopToViewController);
  JS_PROP(IsToolbarHidden);
};

#endif /* NUINavigationController_h */
