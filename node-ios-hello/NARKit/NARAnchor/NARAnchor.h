//
//  NARAnchor.h
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARAnchor_h
#define NARAnchor_h

#include "NNSObject.h"

#define js_value_ARAnchor(x) js_value_wrapper(x, ARAnchor)
#define to_value_ARAnchor(x) to_value_wrapper(x, ARAnchor)
#define is_value_ARAnchor(x) is_value_wrapper(x, ARAnchor)

JS_WRAP_CLASS(ARAnchor, NSObject);
  JS_METHOD(initWithAnchor);
  JS_METHOD(initWithTransform);
  JS_METHOD(initWithNameTransform);
  JS_PROP_READONLY(identifier);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(transform);
JS_WRAP_CLASS_END(ARAnchor);


#endif /* NARAnchor_h */
