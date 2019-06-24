//
//  NMTLSamplerState.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLSamplerState_h
#define NMTLSamplerState_h    

#include "NNSObject.h"

#define js_value_MTLSamplerState(x) js_protocol_wrapper(x, MTLSamplerState)
#define to_value_MTLSamplerState(x) to_protocol_wrapper(x, MTLSamplerState)
#define is_value_MTLSamplerState(x) is_protocol_wrapper(x, MTLSamplerState)

JS_WRAP_PROTOCOL(MTLSamplerState, NSObject);
  JS_PROP_READONLY(label);
  JS_PROP_READONLY(device);
JS_WRAP_PROTOCOL_END(MTLSamplerState, NSObject);

#endif /* NMTLSamplerState_h */
