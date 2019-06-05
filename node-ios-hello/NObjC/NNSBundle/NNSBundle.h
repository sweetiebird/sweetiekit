//
//  NNSBundle.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSBundle_h
#define NNSBundle_h

#include "NNSObject.h"

#define js_value_NSBundle(x) js_value_wrapper(x, NSBundle)
#define to_value_NSBundle(x) to_value_wrapper(x, NSBundle)
#define is_value_NSBundle(x) is_value_wrapper(x, NSBundle)

JS_WRAP_CLASS(NSBundle, NSObject);
  JS_METHOD(pathForResource);
  JS_METHOD(main);
JS_WRAP_CLASS_END(NSBundle);

#endif /* NNSBundle_h */
