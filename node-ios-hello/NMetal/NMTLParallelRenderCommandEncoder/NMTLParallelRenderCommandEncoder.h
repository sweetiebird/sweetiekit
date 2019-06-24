//
//  NMTLParallelRenderCommandEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLParallelRenderCommandEncoder_h
#define NMTLParallelRenderCommandEncoder_h    

#include "NMTLCommandEncoder.h"

#define js_value_MTLParallelRenderCommandEncoder(x) js_protocol_wrapper(x, MTLParallelRenderCommandEncoder)
#define to_value_MTLParallelRenderCommandEncoder(x) to_protocol_wrapper(x, MTLParallelRenderCommandEncoder)
#define is_value_MTLParallelRenderCommandEncoder(x) is_protocol_wrapper(x, MTLParallelRenderCommandEncoder)

JS_WRAP_PROTOCOL(MTLParallelRenderCommandEncoder, MTLCommandEncoder);
  // TODO: declare MTLParallelRenderCommandEncoder methods and properties
JS_WRAP_PROTOCOL_END(MTLParallelRenderCommandEncoder, MTLCommandEncoder);

#endif /* NMTLParallelRenderCommandEncoder_h */