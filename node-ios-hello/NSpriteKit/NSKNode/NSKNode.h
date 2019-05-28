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
  static NAN_METHOD(addChild);
  static NAN_METHOD(removeFromParent);
  static NAN_METHOD(runAction);
  JS_PROP(frame);
  JS_PROP(position);
  JS_PROP(zPosition);
  JS_PROP(zRotation);
  JS_PROP(xScale);
  JS_PROP(yScale);
  JS_PROP(speed);
  JS_PROP(alpha);
  JS_PROP(paused);
  JS_PROP(hidden);
  JS_PROP(userInteractionEnabled);
  JS_PROP(focusBehavior);
  JS_PROP(parent);
  JS_PROP(children);
  JS_PROP(name);
  JS_PROP(scene);
  JS_PROP(physicsBody);
  JS_PROP(userData);
  JS_PROP(reachConstraints);
  JS_PROP(constraints);
  JS_PROP(attributeValues);
};

#endif /* NSKNode_h */
