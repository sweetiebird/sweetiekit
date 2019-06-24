//
//  NMTLComputePipelineReflection.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLComputePipelineReflection_h
#define NMTLComputePipelineReflection_h    

#include "NNSObject.h"

#define js_value_MTLComputePipelineReflection(x) js_value_wrapper(x, MTLComputePipelineReflection)
#define to_value_MTLComputePipelineReflection(x) to_value_wrapper(x, MTLComputePipelineReflection)
#define is_value_MTLComputePipelineReflection(x) is_value_wrapper(x, MTLComputePipelineReflection)

JS_WRAP_CLASS(MTLComputePipelineReflection, NSObject);
  // TODO: declare MTLComputePipelineReflection methods and properties
JS_WRAP_CLASS_END(MTLComputePipelineReflection);

#endif /* NMTLComputePipelineReflection_h */