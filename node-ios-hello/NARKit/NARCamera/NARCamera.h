//
//  NARCamera.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARCamera_h
#define NARCamera_h

#include "NNSObject.h"

#define js_value_ARCamera(x) js_value_wrapper(x, ARCamera)
#define to_value_ARCamera(x) to_value_wrapper(x, ARCamera)
#define is_value_ARCamera(x) is_value_wrapper(x, ARCamera)

JS_WRAP_CLASS(ARCamera, NSObject);
  JS_PROP(Transform);
JS_WRAP_CLASS_END(ARCamera);

#endif /* NARCamera_h */
