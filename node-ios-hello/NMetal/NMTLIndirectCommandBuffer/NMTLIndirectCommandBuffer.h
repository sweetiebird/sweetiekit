//
//  NMTLIndirectCommandBuffer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLIndirectCommandBuffer_h
#define NMTLIndirectCommandBuffer_h    

#include "NMTLResource.h"

#define js_value_MTLIndirectCommandBuffer(x) js_protocol_wrapper(x, MTLIndirectCommandBuffer)
#define to_value_MTLIndirectCommandBuffer(x) to_protocol_wrapper(x, MTLIndirectCommandBuffer)
#define is_value_MTLIndirectCommandBuffer(x) is_protocol_wrapper(x, MTLIndirectCommandBuffer)

JS_WRAP_PROTOCOL(MTLIndirectCommandBuffer, MTLResource);
  JS_METHOD(resetWithRange);
  JS_METHOD(indirectRenderCommandAtIndex);
  JS_PROP_READONLY(size);
JS_WRAP_PROTOCOL_END(MTLIndirectCommandBuffer, MTLResource);

#endif /* NMTLIndirectCommandBuffer_h */
