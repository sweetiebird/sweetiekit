//
//  NSKNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKNode_h
#define NSKNode_h

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "NUIResponder.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKNode : public NUIResponder {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKNode();
  virtual ~NSKNode();

  static NAN_METHOD(New);
};

#endif /* NSKNode_h */
