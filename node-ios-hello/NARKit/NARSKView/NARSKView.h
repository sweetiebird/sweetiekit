//
//  NARSKView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKView_h
#define NARSKView_h

#include "NSKView.h"

#define js_value_ARSKView(x) js_value_wrapper(x, ARSKView)
#define to_value_ARSKView(x) to_value_wrapper(x, ARSKView)
#define is_value_ARSKView(x) is_value_wrapper(x, ARSKView)

JS_WRAP_CLASS(ARSKView, SKView);
  JS_METHOD(presentScene);
  JS_PROP(session);
  JS_PROP(delegate);
  JS_METHOD(hitTest);
  JS_METHOD(nodeForAnchor);
  JS_METHOD(anchorForNode);
  
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(ARSKView);

#endif /* NARSKView_h */
