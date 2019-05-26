//
//  NSKSpriteNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKSpriteNode_h
#define NSKSpriteNode_h

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "NSKNode.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKSpriteNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKSpriteNode();
  virtual ~NSKSpriteNode();

  static NAN_METHOD(New);
  JS_PROP(Size);
  JS_PROP(ColorBlendFactor);
  JS_PROP(Color);
  JS_METHOD(scaleToSize);
};

#endif /* NSKSpriteNode_h */
