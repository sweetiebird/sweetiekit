//
//  NMTLVertexDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexDescriptor_h
#define NMTLVertexDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLVertexDescriptor(x) js_value_wrapper(x, MTLVertexDescriptor)
#define to_value_MTLVertexDescriptor(x) to_value_wrapper(x, MTLVertexDescriptor)
#define is_value_MTLVertexDescriptor(x) is_value_wrapper(x, MTLVertexDescriptor)

#define js_value_MTLVertexFormat(x) JS_ENUM(MTLVertexFormat, NSUInteger, x)
#define to_value_MTLVertexFormat(x) TO_ENUM(MTLVertexFormat, NSUInteger, x)
#define is_value_MTLVertexFormat(x) IS_ENUM(MTLVertexFormat, NSUInteger, x)

#define js_value_MTLVertexStepFunction(x) JS_ENUM(MTLVertexStepFunction, NSUInteger, x)
#define to_value_MTLVertexStepFunction(x) TO_ENUM(MTLVertexStepFunction, NSUInteger, x)
#define is_value_MTLVertexStepFunction(x) IS_ENUM(MTLVertexStepFunction, NSUInteger, x)

JS_WRAP_CLASS(MTLVertexDescriptor, NSObject);
  JS_STATIC_METHOD(vertexDescriptor);
  JS_METHOD(reset);
  JS_PROP_READONLY(layouts);
  JS_PROP_READONLY(attributes);
JS_WRAP_CLASS_END(MTLVertexDescriptor);

#endif /* NMTLVertexDescriptor_h */
