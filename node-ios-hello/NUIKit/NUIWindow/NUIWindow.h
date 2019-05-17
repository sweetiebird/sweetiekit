//
//  NUIWindow.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIWindow_h
#define NUIWindow_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIWindow : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIWindow();
  virtual ~NUIWindow();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(SetRootViewController);
  static NAN_METHOD(MakeKeyAndVisible);
};

#endif /* NUIWindow_h */
