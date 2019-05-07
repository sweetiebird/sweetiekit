//
//  NUIToolbar.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIToolbar_h
#define NUIToolbar_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NUIBarButtonItem : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIBarButtonItem();
  virtual ~NUIBarButtonItem();

  static NAN_METHOD(New);
  
  sweetiekit::JSFunction _callback;
};

#endif /* NUIToolbar_h */
