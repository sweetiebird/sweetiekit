//
//  NARSCNView.h
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSCNView_h
#define NARSCNView_h

#include "NSCNView.h"

#ifdef __IPHONEOS__

#define js_value_ARSCNView(x) js_value_wrapper(x, ARSCNView)
#define to_value_ARSCNView(x) to_value_wrapper(x, ARSCNView)
#define is_value_ARSCNView(x) is_value_wrapper(x, ARSCNView)

JS_WRAP_CLASS(ARSCNView, SCNView);
  JS_METHOD(presentScene);
  JS_METHOD(anchorForNode);
  JS_METHOD(nodeForAnchor);
  JS_METHOD(hitTest);
  JS_METHOD(unprojectPointOntoPlaneWithTransform);
  JS_PROP(session);
  JS_PROP(delegate);
  JS_PROP(scene);
  JS_PROP(automaticallyUpdatesLighting);
  
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(ARSCNView);

#endif

#endif /* NARSCNView_h */
