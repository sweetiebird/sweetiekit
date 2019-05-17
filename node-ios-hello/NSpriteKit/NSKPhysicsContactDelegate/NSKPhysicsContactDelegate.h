//
//  NSKPhysicsContactDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKPhysicsContactDelegate_h
#define NSKPhysicsContactDelegate_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

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
