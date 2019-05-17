//
//  NSKPhysicsWorld.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsWorld_h
#define NSKPhysicsWorld_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

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
