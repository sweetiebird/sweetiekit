//
//  NMTLVertexAttributeDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexAttributeDescriptorArray_h
#define NMTLVertexAttributeDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLVertexAttributeDescriptorArray(x) js_value_wrapper(x, MTLVertexAttributeDescriptorArray)
#define to_value_MTLVertexAttributeDescriptorArray(x) to_value_wrapper(x, MTLVertexAttributeDescriptorArray)
#define is_value_MTLVertexAttributeDescriptorArray(x) is_value_wrapper(x, MTLVertexAttributeDescriptorArray)

JS_WRAP_CLASS(MTLVertexAttributeDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLVertexAttributeDescriptorArray);

#endif /* NMTLVertexAttributeDescriptorArray_h */
