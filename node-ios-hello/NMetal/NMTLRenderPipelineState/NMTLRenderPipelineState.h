//
//  NMTLRenderPipelineState.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineState_h
#define NMTLRenderPipelineState_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineState(x) js_protocol_wrapper(x, MTLRenderPipelineState)
#define to_value_MTLRenderPipelineState(x) to_protocol_wrapper(x, MTLRenderPipelineState)
#define is_value_MTLRenderPipelineState(x) is_protocol_wrapper(x, MTLRenderPipelineState)

JS_WRAP_PROTOCOL(MTLRenderPipelineState, NSObject);
  // TODO: declare MTLRenderPipelineState methods and properties
JS_WRAP_PROTOCOL_END(MTLRenderPipelineState, NSObject);

#endif /* NMTLRenderPipelineState_h */
