//
//  NMTLFunctionConstantValues.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLFunctionConstantValues_h
#define NMTLFunctionConstantValues_h    

#include "NNSObject.h"

#define js_value_MTLFunctionConstantValues(x) js_value_wrapper(x, MTLFunctionConstantValues)
#define to_value_MTLFunctionConstantValues(x) to_value_wrapper(x, MTLFunctionConstantValues)
#define is_value_MTLFunctionConstantValues(x) is_value_wrapper(x, MTLFunctionConstantValues)

JS_WRAP_CLASS(MTLFunctionConstantValues, NSObject);
  JS_METHOD(setConstantValueTypeAtIndex);
  JS_METHOD(setConstantValuesTypeWithRange);
  JS_METHOD(setConstantValueTypeWithName);
  JS_METHOD(reset);
JS_WRAP_CLASS_END(MTLFunctionConstantValues);

#endif /* NMTLFunctionConstantValues_h */
