//
//  NUITabBarController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarController_h
#define NUITabBarController_h

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUITabBarController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITabBarController();
  virtual ~NUITabBarController();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(SetViewControllers);
  JS_PROP(tabBar);
};

#endif /* NUITabBarController_h */
