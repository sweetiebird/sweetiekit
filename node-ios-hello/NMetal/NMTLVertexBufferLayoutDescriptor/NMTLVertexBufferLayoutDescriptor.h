//
//  NMTLVertexBufferLayoutDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexBufferLayoutDescriptor_h
#define NMTLVertexBufferLayoutDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLVertexBufferLayoutDescriptor(x) js_value_wrapper(x, MTLVertexBufferLayoutDescriptor)
#define to_value_MTLVertexBufferLayoutDescriptor(x) to_value_wrapper(x, MTLVertexBufferLayoutDescriptor)
#define is_value_MTLVertexBufferLayoutDescriptor(x) is_value_wrapper(x, MTLVertexBufferLayoutDescriptor)

JS_WRAP_CLASS(MTLVertexBufferLayoutDescriptor, NSObject);
  JS_PROP(stride);
  JS_PROP(stepFunction);
  JS_PROP(stepRate);
JS_WRAP_CLASS_END(MTLVertexBufferLayoutDescriptor);

#endif /* NMTLVertexBufferLayoutDescriptor_h */
