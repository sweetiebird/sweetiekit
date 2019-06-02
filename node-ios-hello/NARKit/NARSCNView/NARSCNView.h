//
//  NARSCNView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNView_h
#define NARSCNView_h

#include "NSCNView.h"

#define js_value_ARSCNView(x) js_value_wrapper(x, ARSCNView)
#define to_value_ARSCNView(x) to_value_wrapper(x, ARSCNView)
#define is_value_ARSCNView(x) is_value_wrapper(x, ARSCNView)

JS_WRAP_CLASS(ARSCNView, SCNView);
  JS_METHOD(PresentScene);
  JS_PROP(Session);
  JS_PROP(Delegate);
  JS_PROP(Scene);
  JS_PROP(AutomaticallyUpdatesLighting);
  
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(ARSCNView);

#endif /* NARSCNView_h */
