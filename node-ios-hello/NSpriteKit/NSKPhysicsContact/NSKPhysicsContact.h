//
//  NSKPhysicsContact.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContact_h
#define NSKPhysicsContact_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

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
