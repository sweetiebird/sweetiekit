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

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

extern Local<Object> makeUITabBarController();

class NUITabBarController : public ObjectWrap {
public:
  static Nan::Persistent<FunctionTemplate> type;
  static Local<Object> Initialize(Isolate *isolate);

protected:
  static NAN_METHOD(New);

  NUITabBarController();
  ~NUITabBarController();

private:
  UITabBarController* controller;
};

#endif /* NUITabBarController_h */
