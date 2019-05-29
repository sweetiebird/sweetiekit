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

JS_WRAP_CLASS(SKScene, SKNode);
  JS_METHOD(sceneWithSize);
  JS_METHOD(convertPointFromView);
  JS_METHOD(convertPointToView);
  JS_PROP(touchesBegan);
  JS_PROP(touchesMoved);
  JS_PROP(touchesEnded);
  JS_PROP(update);
  JS_PROP(frame);
  JS_PROP(size);
  JS_PROP(scaleMode);
  JS_PROP(camera);
  JS_PROP(listener);
  JS_PROP(audioEngine);
  JS_PROP(backgroundColor);
  JS_PROP(delegate);
  JS_PROP(anchorPoint);
  JS_PROP(physicsWorld);
  JS_PROP(view);

  sweetiekit::JSFunction _touchesBegan;
  sweetiekit::JSFunction _touchesMoved;
  sweetiekit::JSFunction _touchesEnded;
  sweetiekit::JSFunction _update;
JS_WRAP_CLASS_END(SKScene);

#endif /* NSKScene_h */
