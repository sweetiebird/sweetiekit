//
//  NNSNotificationCenter.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSNotificationCenter_h
#define NNSNotificationCenter_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSNotificationCenter : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSNotificationCenter();
  virtual ~NNSNotificationCenter();

  static NAN_METHOD(New);
  static NAN_METHOD(postNotification);
  static NAN_METHOD(addObserverForName);
};

#endif /* NNSNotificationCenter_h */
