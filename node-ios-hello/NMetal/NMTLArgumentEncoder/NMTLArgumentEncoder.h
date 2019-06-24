//
//  NMTLArgumentEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLArgumentEncoder_h
#define NMTLArgumentEncoder_h    

#include "NNSObject.h"

#define js_value_MTLArgumentEncoder(x) js_protocol_wrapper(x, MTLArgumentEncoder)
#define to_value_MTLArgumentEncoder(x) to_protocol_wrapper(x, MTLArgumentEncoder)
#define is_value_MTLArgumentEncoder(x) is_protocol_wrapper(x, MTLArgumentEncoder)

JS_WRAP_PROTOCOL(MTLArgumentEncoder, NSObject);
  // TODO: declare MTLArgumentEncoder methods and properties
JS_WRAP_PROTOCOL_END(MTLArgumentEncoder, NSObject);

#endif /* NMTLArgumentEncoder_h */