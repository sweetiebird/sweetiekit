//
//  NARSKView.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSKView_h
#define NARSKView_h

#include "NSKView.h"

#if TARGET_OS_IPHONE

#define js_value_ARSKView(x) js_value_wrapper(x, ARSKView)
#define to_value_ARSKView(x) to_value_wrapper(x, ARSKView)
#define is_value_ARSKView(x) is_value_wrapper(x, ARSKView)

JS_WRAP_CLASS(ARSKView, SKView);
  JS_METHOD(anchorForNode);
  JS_METHOD(nodeForAnchor);
  JS_METHOD(hitTestTypes);
  JS_PROP(delegate);
  JS_PROP(session);
JS_WRAP_CLASS_END(ARSKView);

#endif

#endif /* NARSKView_h */
