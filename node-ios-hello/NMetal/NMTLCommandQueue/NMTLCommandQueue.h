//
//  NMTLCommandQueue.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLCommandQueue_h
#define NMTLCommandQueue_h    

#include "NNSObject.h"

#define js_value_MTLCommandQueue(x) js_protocol_wrapper(x, MTLCommandQueue)
#define to_value_MTLCommandQueue(x) to_protocol_wrapper(x, MTLCommandQueue)
#define is_value_MTLCommandQueue(x) is_protocol_wrapper(x, MTLCommandQueue)

JS_WRAP_PROTOCOL(MTLCommandQueue, NSObject);
  JS_METHOD(commandBuffer);
  JS_METHOD(commandBufferWithUnretainedReferences);
  JS_METHOD(insertDebugCaptureBoundary);
  JS_PROP(label);
  JS_PROP_READONLY(device);
JS_WRAP_PROTOCOL_END(MTLCommandQueue, NSObject);

#endif /* NMTLCommandQueue_h */
