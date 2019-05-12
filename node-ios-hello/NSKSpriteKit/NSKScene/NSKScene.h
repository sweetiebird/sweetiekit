//
//  NSKScene.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKScene_h
#define NSKScene_h

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "NSKNode.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKScene : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKScene();
  virtual ~NSKScene();

  static NAN_METHOD(New);
};


#endif /* NSKScene_h */
