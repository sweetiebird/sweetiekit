//
//  NMTLStageInputOutputDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLStageInputOutputDescriptor_h
#define NMTLStageInputOutputDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLStageInputOutputDescriptor(x) js_value_wrapper(x, MTLStageInputOutputDescriptor)
#define to_value_MTLStageInputOutputDescriptor(x) to_value_wrapper(x, MTLStageInputOutputDescriptor)
#define is_value_MTLStageInputOutputDescriptor(x) is_value_wrapper(x, MTLStageInputOutputDescriptor)

#define js_value_MTLAttributeFormat(x) JS_ENUM(MTLAttributeFormat, NSUInteger, x)
#define to_value_MTLAttributeFormat(x) TO_ENUM(MTLAttributeFormat, NSUInteger, x)
#define is_value_MTLAttributeFormat(x) IS_ENUM(MTLAttributeFormat, NSUInteger, x)

#define js_value_MTLIndexType(x) JS_ENUM(MTLIndexType, NSUInteger, x)
#define to_value_MTLIndexType(x) TO_ENUM(MTLIndexType, NSUInteger, x)
#define is_value_MTLIndexType(x) IS_ENUM(MTLIndexType, NSUInteger, x)

#define js_value_MTLStepFunction(x) JS_ENUM(MTLStepFunction, NSUInteger, x)
#define to_value_MTLStepFunction(x) TO_ENUM(MTLStepFunction, NSUInteger, x)
#define is_value_MTLStepFunction(x) IS_ENUM(MTLStepFunction, NSUInteger, x)

JS_WRAP_CLASS(MTLStageInputOutputDescriptor, NSObject);
  JS_STATIC_METHOD(stageInputOutputDescriptor);
  JS_METHOD(reset);
  JS_PROP_READONLY(layouts);
  JS_PROP_READONLY(attributes);
  JS_PROP(indexType);
  JS_PROP(indexBufferIndex);
JS_WRAP_CLASS_END(MTLStageInputOutputDescriptor);

#endif /* NMTLStageInputOutputDescriptor_h */
