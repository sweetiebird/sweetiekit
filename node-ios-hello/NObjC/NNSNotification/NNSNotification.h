//
//  NNSNotification.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSNotification_h
#define NNSNotification_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSNotification : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSNotification();
  virtual ~NNSNotification();

  static NAN_METHOD(New);
  static NAN_METHOD(notificationWithName);
  JS_PROP(name);
  JS_PROP(object);
  JS_PROP(userInfo);
};

#endif /* NNSNotification_h */
