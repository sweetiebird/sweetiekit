//
//  NNSLayoutAnchor.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSLayoutAnchor_h
#define NNSLayoutAnchor_h

#include "NNSObject.h"

#define js_value_NSLayoutAnchor(x) js_value_wrapper(x, NSLayoutAnchor)
#define to_value_NSLayoutAnchor(x) to_value_wrapper(x, NSLayoutAnchor)
#define is_value_NSLayoutAnchor(x) is_value_wrapper(x, NSLayoutAnchor)

JS_WRAP_CLASS(NSLayoutAnchor, NSObject);
  JS_METHOD(ConstraintEqualToAnchor);
JS_WRAP_CLASS_END(NSLayoutAnchor);

#endif /* NNSLayoutAnchor_h */
