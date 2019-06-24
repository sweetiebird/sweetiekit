//
//  NMTLVertexAttributeDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexAttributeDescriptor_h
#define NMTLVertexAttributeDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLVertexAttributeDescriptor(x) js_value_wrapper(x, MTLVertexAttributeDescriptor)
#define to_value_MTLVertexAttributeDescriptor(x) to_value_wrapper(x, MTLVertexAttributeDescriptor)
#define is_value_MTLVertexAttributeDescriptor(x) is_value_wrapper(x, MTLVertexAttributeDescriptor)

JS_WRAP_CLASS(MTLVertexAttributeDescriptor, NSObject);
  JS_PROP(format);
  JS_PROP(offset);
  JS_PROP(bufferIndex);
JS_WRAP_CLASS_END(MTLVertexAttributeDescriptor);

#endif /* NMTLVertexAttributeDescriptor_h */
