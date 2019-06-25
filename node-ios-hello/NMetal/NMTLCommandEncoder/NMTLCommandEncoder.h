//
//  NMTLCommandEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLCommandEncoder_h
#define NMTLCommandEncoder_h    

#include "NNSObject.h"

#define js_value_MTLCommandEncoder(x) js_protocol_wrapper(x, MTLCommandEncoder)
#define to_value_MTLCommandEncoder(x) to_protocol_wrapper(x, MTLCommandEncoder)
#define is_value_MTLCommandEncoder(x) is_protocol_wrapper(x, MTLCommandEncoder)

#define js_value_MTLResourceUsage(x) JS_OPTS(MTLResourceUsage, NSUInteger, x)
#define to_value_MTLResourceUsage(x) TO_OPTS(MTLResourceUsage, NSUInteger, x)
#define is_value_MTLResourceUsage(x) IS_OPTS(MTLResourceUsage, NSUInteger, x)

#define js_value_MTLBarrierScope(x) JS_OPTS(MTLBarrierScope, NSUInteger, x)
#define to_value_MTLBarrierScope(x) TO_OPTS(MTLBarrierScope, NSUInteger, x)
#define is_value_MTLBarrierScope(x) IS_OPTS(MTLBarrierScope, NSUInteger, x)

JS_WRAP_PROTOCOL(MTLCommandEncoder, NSObject);
  JS_METHOD(endEncoding);
  JS_METHOD(insertDebugSignpost);
  JS_METHOD(pushDebugGroup);
  JS_METHOD(popDebugGroup);
  JS_PROP_READONLY(device);
  JS_PROP(label);
JS_WRAP_PROTOCOL_END(MTLCommandEncoder, NSObject);

#endif /* NMTLCommandEncoder_h */
