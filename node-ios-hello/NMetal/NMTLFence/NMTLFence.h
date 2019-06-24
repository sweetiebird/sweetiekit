//
//  NMTLFence.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLFence_h
#define NMTLFence_h    

#include "NNSObject.h"

#define js_value_MTLFence(x) js_protocol_wrapper(x, MTLFence)
#define to_value_MTLFence(x) to_protocol_wrapper(x, MTLFence)
#define is_value_MTLFence(x) is_protocol_wrapper(x, MTLFence)

JS_WRAP_PROTOCOL(MTLFence, NSObject);
  JS_PROP_READONLY(device);
  JS_PROP(label);
JS_WRAP_PROTOCOL_END(MTLFence, NSObject);

#endif /* NMTLFence_h */
