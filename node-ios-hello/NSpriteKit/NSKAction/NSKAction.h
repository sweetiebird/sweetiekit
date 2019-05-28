//
//  NSKAction.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAction_h
#define NSKAction_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKAction : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKAction();
  virtual ~NSKAction();

  static NAN_METHOD(New);
  static NAN_METHOD(moveTo);
  static NAN_METHOD(removeFromParent);
  static NAN_METHOD(sequence);
  static NAN_METHOD(waitForDuration);
  static NAN_METHOD(moveBy);
  static NAN_METHOD(scaleBy);
};

#endif /* NSKAction_h */
