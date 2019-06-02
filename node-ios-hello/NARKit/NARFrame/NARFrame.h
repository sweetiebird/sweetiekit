//
//  NARFrame.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARFrame_h
#define NARFrame_h

#include "NNSObject.h"

#define js_value_ARFrame(x) js_value_wrapper(x, ARFrame)
#define to_value_ARFrame(x) to_value_wrapper(x, ARFrame)
#define is_value_ARFrame(x) is_value_wrapper(x, ARFrame)

JS_WRAP_CLASS(ARFrame, NSObject);
  JS_METHOD(displayTransform);
  JS_PROP(camera);
  JS_PROP(lightEstimate);
  JS_PROP(capturedImage);
JS_WRAP_CLASS_END(ARFrame);

#endif /* NARFrame_h */
