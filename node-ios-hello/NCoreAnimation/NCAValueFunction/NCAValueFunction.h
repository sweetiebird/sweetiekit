//
//  NCAValueFunction.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAValueFunction_h
#define NCAValueFunction_h    

#include "NNSObject.h"

#define js_value_CAValueFunction(x) js_value_wrapper(x, CAValueFunction)
#define to_value_CAValueFunction(x) to_value_wrapper(x, CAValueFunction)
#define is_value_CAValueFunction(x) is_value_wrapper(x, CAValueFunction)

#define js_value_CAValueFunctionName(x) JS_ENUM(CAValueFunctionName, NSString, x)
#define to_value_CAValueFunctionName(x) TO_ENUM(CAValueFunctionName, NSString, x)
#define is_value_CAValueFunctionName(x) IS_ENUM(CAValueFunctionName, NSString, x)

JS_WRAP_CLASS(CAValueFunction, NSObject);
  JS_STATIC_METHOD(functionWithName);
  JS_PROP_READONLY(name);
JS_WRAP_CLASS_END(CAValueFunction);

#endif /* NCAValueFunction_h */
