//
//  NMTLPipelineBufferDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLPipelineBufferDescriptorArray_h
#define NMTLPipelineBufferDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLPipelineBufferDescriptorArray(x) js_value_wrapper(x, MTLPipelineBufferDescriptorArray)
#define to_value_MTLPipelineBufferDescriptorArray(x) to_value_wrapper(x, MTLPipelineBufferDescriptorArray)
#define is_value_MTLPipelineBufferDescriptorArray(x) is_value_wrapper(x, MTLPipelineBufferDescriptorArray)

JS_WRAP_CLASS(MTLPipelineBufferDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLPipelineBufferDescriptorArray);

#endif /* NMTLPipelineBufferDescriptorArray_h */
