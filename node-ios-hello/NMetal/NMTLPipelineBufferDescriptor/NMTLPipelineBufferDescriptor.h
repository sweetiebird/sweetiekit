//
//  NMTLPipelineBufferDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLPipelineBufferDescriptor_h
#define NMTLPipelineBufferDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLPipelineBufferDescriptor(x) js_value_wrapper(x, MTLPipelineBufferDescriptor)
#define to_value_MTLPipelineBufferDescriptor(x) to_value_wrapper(x, MTLPipelineBufferDescriptor)
#define is_value_MTLPipelineBufferDescriptor(x) is_value_wrapper(x, MTLPipelineBufferDescriptor)

JS_WRAP_CLASS(MTLPipelineBufferDescriptor, NSObject);
  JS_PROP(mutability);
JS_WRAP_CLASS_END(MTLPipelineBufferDescriptor);

#endif /* NMTLPipelineBufferDescriptor_h */
