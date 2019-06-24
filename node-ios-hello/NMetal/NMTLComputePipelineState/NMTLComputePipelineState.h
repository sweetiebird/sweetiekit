//
//  NMTLComputePipelineState.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLComputePipelineState_h
#define NMTLComputePipelineState_h    

#include "NNSObject.h"

#define js_value_MTLComputePipelineState(x) js_protocol_wrapper(x, MTLComputePipelineState)
#define to_value_MTLComputePipelineState(x) to_protocol_wrapper(x, MTLComputePipelineState)
#define is_value_MTLComputePipelineState(x) is_protocol_wrapper(x, MTLComputePipelineState)

JS_WRAP_PROTOCOL(MTLComputePipelineState, NSObject);
  // TODO: declare MTLComputePipelineState methods and properties
JS_WRAP_PROTOCOL_END(MTLComputePipelineState, NSObject);

#endif /* NMTLComputePipelineState_h */
