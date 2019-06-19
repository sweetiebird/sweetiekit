//
//  NCoreGraphicsGlobals.h
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCoreGraphicsGlobals_h
#define NCoreGraphicsGlobals_h    

#include "NNSObject.h"

#define js_value_CoreGraphicsGlobals(x) js_value_wrapper(x, CoreGraphicsGlobals)
#define to_value_CoreGraphicsGlobals(x) to_value_wrapper(x, CoreGraphicsGlobals)
#define is_value_CoreGraphicsGlobals(x) is_value_wrapper(x, CoreGraphicsGlobals)

JS_WRAP_CLASS(CoreGraphicsGlobals, NSObject);
  JS_METHOD(UIGraphicsBeginImageContextWithOptions);
  JS_METHOD(UIGraphicsGetImageFromCurrentImageContext);
  JS_METHOD(UIGraphicsEndImageContext);
JS_WRAP_CLASS_END(CoreGraphicsGlobals);

#if __OBJC__
typedef SCoreGraphicsGlobals CoreGraphicsGlobals;
#endif

#endif /* NCoreGraphicsGlobals_h */
