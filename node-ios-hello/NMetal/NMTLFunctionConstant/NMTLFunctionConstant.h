//
//  NMTLFunctionConstant.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLFunctionConstant_h
#define NMTLFunctionConstant_h    

#include "NNSObject.h"

#define js_value_MTLFunctionConstant(x) js_value_wrapper(x, MTLFunctionConstant)
#define to_value_MTLFunctionConstant(x) to_value_wrapper(x, MTLFunctionConstant)
#define is_value_MTLFunctionConstant(x) is_value_wrapper(x, MTLFunctionConstant)

JS_WRAP_CLASS(MTLFunctionConstant, NSObject);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(type);
  JS_PROP_READONLY(index);
  JS_PROP_READONLY(required);
JS_WRAP_CLASS_END(MTLFunctionConstant);

#endif /* NMTLFunctionConstant_h */
