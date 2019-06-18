//
//  NCAMediaTimingFunction.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAMediaTimingFunction_h
#define NCAMediaTimingFunction_h    

#include "NNSObject.h"

#define js_value_CAMediaTimingFunction(x) js_value_wrapper(x, CAMediaTimingFunction)
#define to_value_CAMediaTimingFunction(x) to_value_wrapper(x, CAMediaTimingFunction)
#define is_value_CAMediaTimingFunction(x) is_value_wrapper(x, CAMediaTimingFunction)

#define js_value_CAMediaTimingFunctionName(x) JS_ENUM(CAMediaTimingFunctionName, NSString, x)
#define to_value_CAMediaTimingFunctionName(x) TO_ENUM(CAMediaTimingFunctionName, NSString, x)
#define is_value_CAMediaTimingFunctionName(x) IS_ENUM(CAMediaTimingFunctionName, NSString, x)

JS_WRAP_CLASS(CAMediaTimingFunction, NSObject);
  JS_STATIC_METHOD(functionWithName);
  JS_STATIC_METHOD(functionWithControlPoints);
  JS_STATIC_METHOD(initWithControlPoints);
  JS_METHOD(getControlPointAtIndexValues);
JS_WRAP_CLASS_END(CAMediaTimingFunction);

#endif /* NCAMediaTimingFunction_h */
