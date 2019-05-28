//
//  NSKPhysicsContactDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContactDelegate_h
#define NSKPhysicsContactDelegate_h    

#include "NNSObject.h"

#define js_value_SKPhysicsContactDelegate(x) js_value_wrapper_known(x, SKPhysicsContactDelegate)
#define to_value_SKPhysicsContactDelegate(x) to_value_wrapper(x, SKPhysicsContactDelegate)

class NSKPhysicsContactDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKPhysicsContactDelegate();
  virtual ~NSKPhysicsContactDelegate();

  static NAN_METHOD(New);
  JS_PROP(didBeginContact);
  JS_PROP(didEndContact);
  
  sweetiekit::JSFunction _didBeginContact;
  sweetiekit::JSFunction _didEndContact;
};

#endif /* NSKPhysicsContactDelegate_h */
