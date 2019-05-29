//
//  NSKPhysicsContact.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContact_h
#define NSKPhysicsContact_h    

#include "NNSObject.h"

#define js_value_SKPhysicsContact(x) js_value_wrapper(x, SKPhysicsContact)
#define to_value_SKPhysicsContact(x) to_value_wrapper(x, SKPhysicsContact)

class NSKPhysicsContact : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKPhysicsContact();
  virtual ~NSKPhysicsContact();

  static NAN_METHOD(New);
  JS_PROP(bodyA);
  JS_PROP(bodyB);
};

#endif /* NSKPhysicsContact_h */
