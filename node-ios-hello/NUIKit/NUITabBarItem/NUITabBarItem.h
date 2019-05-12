//
//  NUITabBarItem.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarItem_h
#define NUITabBarItem_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NUITabBarItem : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITabBarItem();
  virtual ~NUITabBarItem();

  static NAN_METHOD(New);
};

#endif /* NUITabBarItem_h */
