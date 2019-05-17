//
//  NUIAlertController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIAlertController_h
#define NUIAlertController_h

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIAlertController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIAlertController();
  virtual ~NUIAlertController();

  static NAN_METHOD(New);
  static NAN_METHOD(AddAction);
};

#endif /* NUIAlertController_h */
