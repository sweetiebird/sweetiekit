//
//  NMTLComputePipelineDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLComputePipelineDescriptor_h
#define NMTLComputePipelineDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLComputePipelineDescriptor(x) js_value_wrapper(x, MTLComputePipelineDescriptor)
#define to_value_MTLComputePipelineDescriptor(x) to_value_wrapper(x, MTLComputePipelineDescriptor)
#define is_value_MTLComputePipelineDescriptor(x) is_value_wrapper(x, MTLComputePipelineDescriptor)

JS_WRAP_CLASS(MTLComputePipelineDescriptor, NSObject);
  // TODO: declare MTLComputePipelineDescriptor methods and properties
JS_WRAP_CLASS_END(MTLComputePipelineDescriptor);

#endif /* NMTLComputePipelineDescriptor_h */