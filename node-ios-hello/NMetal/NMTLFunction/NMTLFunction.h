//
//  NMTLFunction.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLFunction_h
#define NMTLFunction_h    

#include "NNSObject.h"

#define js_value_MTLFunction(x) js_protocol_wrapper(x, MTLFunction)
#define to_value_MTLFunction(x) to_protocol_wrapper(x, MTLFunction)
#define is_value_MTLFunction(x) is_protocol_wrapper(x, MTLFunction)

JS_WRAP_PROTOCOL(MTLFunction, NSObject);
  JS_METHOD(newArgumentEncoderWithBufferIndex);
  JS_METHOD(newArgumentEncoderWithBufferIndexReflection);
  JS_PROP(label);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(functionType);
  JS_PROP_READONLY(patchType);
  JS_PROP_READONLY(patchControlPointCount);
  JS_PROP_READONLY(vertexAttributes);
  JS_PROP_READONLY(stageInputAttributes);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(functionConstantsDictionary);
JS_WRAP_PROTOCOL_END(MTLFunction, NSObject);

#endif /* NMTLFunction_h */
