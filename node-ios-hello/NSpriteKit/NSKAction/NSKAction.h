//
//  NSKAction.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAction_h
#define NSKAction_h    

#include "NNSObject.h"

#define js_value_SKAction(x) js_value_wrapper_known(x, SKAction)
#define to_value_SKAction(x) to_value_wrapper(x, SKAction)

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
  static NAN_METHOD(group);
};

#endif /* NSKAction_h */
