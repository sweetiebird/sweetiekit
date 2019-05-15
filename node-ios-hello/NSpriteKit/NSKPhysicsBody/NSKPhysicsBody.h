//
//  NSKPhysicsBody.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsBody_h
#define NSKPhysicsBody_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKPhysicsBody : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKPhysicsBody();
  virtual ~NSKPhysicsBody();

  static NAN_METHOD(New);
  static NAN_METHOD(bodyWithCircleOfRadius);
  static NAN_METHOD(bodyWithTexture);
};

#endif /* NSKPhysicsBody_h */
