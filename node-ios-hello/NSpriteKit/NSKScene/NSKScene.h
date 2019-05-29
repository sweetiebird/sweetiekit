//
//  NSKScene.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKScene_h
#define NSKScene_h

#import "NSKNode.h"

#define js_value_SKScene(x) js_value_wrapper(x, SKScene)
#define to_value_SKScene(x) to_value_wrapper(x, SKScene)

class NSKScene : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKScene();
  virtual ~NSKScene();

  static NAN_METHOD(New);
  static NAN_METHOD(sceneWithSize);
  static NAN_METHOD(convertPointFromView);
  static NAN_METHOD(convertPointToView);
  
  JS_PROP(backgroundColor);
  JS_PROP(scaleMode);
  JS_PROP(touchesBegan);
  JS_PROP(touchesMoved);
  JS_PROP(touchesEnded);
  JS_PROP(update);
  JS_PROP(physicsWorld);
  JS_PROP(camera);
  JS_PROP(size);
  JS_PROP(anchorPoint);
  JS_PROP(frame);

  sweetiekit::JSFunction _touchesBegan;
  sweetiekit::JSFunction _touchesMoved;
  sweetiekit::JSFunction _touchesEnded;
  sweetiekit::JSFunction _update;
};

#endif /* NSKScene_h */
