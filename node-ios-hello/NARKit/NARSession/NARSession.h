//
//  NARSession.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARSession_h
#define NARSession_h

#include "NNSObject.h"

#define js_value_ARSession(x) js_value_wrapper(x, ARSession)
#define to_value_ARSession(x) to_value_wrapper(x, ARSession)
#define is_value_ARSession(x) is_value_wrapper(x, ARSession)

JS_WRAP_CLASS(ARSession, NSObject);
  JS_METHOD(run);
  JS_METHOD(add);
  JS_METHOD(remove);
  JS_PROP(currentFrame);
JS_WRAP_CLASS_END(ARSession);

#endif /* NARSession_h */
