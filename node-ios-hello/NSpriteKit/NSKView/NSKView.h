//
//  NSKView.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKView_h
#define NSKView_h

#import "NUIView.h"

#define js_value_SKView(x) js_value_wrapper(x, SKView)
#define to_value_SKView(x) to_value_wrapper(x, SKView)
#define is_value_SKView(x) is_value_wrapper(x, SKView)

JS_WRAP_CLASS(SKView, UIView);
  JS_METHOD(presentScene);
  JS_PROP(paused);
  JS_PROP(showsFPS);
  JS_PROP(showsDrawCount);
  JS_PROP(showsNodeCount);
  JS_PROP(showsQuadCount);
  JS_PROP(showsPhysics);
  JS_PROP(showsFields);
  JS_PROP(asynchronous);
  JS_PROP(allowsTransparency);
  JS_PROP(ignoresSiblingOrder);
  JS_PROP(shouldCullNonVisibleNodes);
  JS_PROP(preferredFramesPerSecond);
  JS_PROP(delegate);
  JS_PROP(frameInterval);
  JS_PROP(preferredFrameRate);
  JS_PROP_READONLY(scene);
JS_WRAP_CLASS_END(SKView);

#endif /* NSKView_h */
