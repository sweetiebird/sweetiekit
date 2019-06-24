//
//  NMTLBlitCommandEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLBlitCommandEncoder_h
#define NMTLBlitCommandEncoder_h    

#include "NMTLCommandEncoder.h"

#define js_value_MTLBlitCommandEncoder(x) js_protocol_wrapper(x, MTLBlitCommandEncoder)
#define to_value_MTLBlitCommandEncoder(x) to_protocol_wrapper(x, MTLBlitCommandEncoder)
#define is_value_MTLBlitCommandEncoder(x) is_protocol_wrapper(x, MTLBlitCommandEncoder)

JS_WRAP_PROTOCOL(MTLBlitCommandEncoder, MTLCommandEncoder);
  // TODO: declare MTLBlitCommandEncoder methods and properties
JS_WRAP_PROTOCOL_END(MTLBlitCommandEncoder, MTLCommandEncoder);

#endif /* NMTLBlitCommandEncoder_h */