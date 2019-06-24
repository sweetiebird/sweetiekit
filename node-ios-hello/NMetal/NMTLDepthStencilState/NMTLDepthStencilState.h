//
//  NMTLDepthStencilState.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLDepthStencilState_h
#define NMTLDepthStencilState_h    

#include "NNSObject.h"

#define js_value_MTLDepthStencilState(x) js_protocol_wrapper(x, MTLDepthStencilState)
#define to_value_MTLDepthStencilState(x) to_protocol_wrapper(x, MTLDepthStencilState)
#define is_value_MTLDepthStencilState(x) is_protocol_wrapper(x, MTLDepthStencilState)

JS_WRAP_PROTOCOL(MTLDepthStencilState, NSObject);
  JS_PROP_READONLY(label);
  JS_PROP_READONLY(device);
JS_WRAP_PROTOCOL_END(MTLDepthStencilState, NSObject);

#endif /* NMTLDepthStencilState_h */
