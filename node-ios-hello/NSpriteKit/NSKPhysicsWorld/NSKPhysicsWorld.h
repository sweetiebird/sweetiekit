//
//  NSKPhysicsWorld.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsWorld_h
#define NSKPhysicsWorld_h    

#include "NNSObject.h"

#define js_value_SKPhysicsWorld(x) js_value_wrapper(x, SKPhysicsWorld)
#define to_value_SKPhysicsWorld(x) to_value_wrapper(x, SKPhysicsWorld)

class NSKPhysicsWorld : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKPhysicsWorld();
  virtual ~NSKPhysicsWorld();

  static NAN_METHOD(New);
  JS_PROP(gravity);
  JS_PROP(contactDelegate);
};

#endif /* NSKPhysicsWorld_h */
