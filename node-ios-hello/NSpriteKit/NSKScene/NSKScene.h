//
//  NSKScene.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKScene_h
#define NSKScene_h

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
  static NAN_METHOD(sceneWithSize);
  
  JS_PROP(backgroundColor);
  JS_PROP(scaleMode);
  JS_PROP(touchesBegan);
  JS_PROP(touchesMoved);
  JS_PROP(touchesEnded);
  JS_PROP(update);
  JS_PROP(physicsWorld);
  JS_PROP(camera);

  sweetiekit::JSFunction _touchesBegan;
  sweetiekit::JSFunction _touchesMoved;
  sweetiekit::JSFunction _touchesEnded;
  sweetiekit::JSFunction _update;
};

#endif /* NSKScene_h */
