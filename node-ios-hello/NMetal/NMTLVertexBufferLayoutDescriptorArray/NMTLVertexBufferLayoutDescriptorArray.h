//
//  NMTLVertexBufferLayoutDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLVertexBufferLayoutDescriptorArray_h
#define NMTLVertexBufferLayoutDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLVertexBufferLayoutDescriptorArray(x) js_value_wrapper(x, MTLVertexBufferLayoutDescriptorArray)
#define to_value_MTLVertexBufferLayoutDescriptorArray(x) to_value_wrapper(x, MTLVertexBufferLayoutDescriptorArray)
#define is_value_MTLVertexBufferLayoutDescriptorArray(x) is_value_wrapper(x, MTLVertexBufferLayoutDescriptorArray)

JS_WRAP_CLASS(MTLVertexBufferLayoutDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLVertexBufferLayoutDescriptorArray);

#endif /* NMTLVertexBufferLayoutDescriptorArray_h */
