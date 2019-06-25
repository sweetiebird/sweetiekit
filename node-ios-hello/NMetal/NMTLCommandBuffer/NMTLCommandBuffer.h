//
//  NMTLCommandBuffer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLCommandBuffer_h
#define NMTLCommandBuffer_h    

#include "NNSObject.h"

#define js_value_MTLCommandBuffer(x) js_protocol_wrapper(x, MTLCommandBuffer)
#define to_value_MTLCommandBuffer(x) to_protocol_wrapper(x, MTLCommandBuffer)
#define is_value_MTLCommandBuffer(x) is_protocol_wrapper(x, MTLCommandBuffer)

#define js_value_MTLCommandBufferStatus(x) JS_ENUM(MTLCommandBufferStatus, NSUInteger, x)
#define to_value_MTLCommandBufferStatus(x) TO_ENUM(MTLCommandBufferStatus, NSUInteger, x)
#define is_value_MTLCommandBufferStatus(x) IS_ENUM(MTLCommandBufferStatus, NSUInteger, x)

#define js_value_MTLCommandBufferError(x) JS_ENUM(MTLCommandBufferError, NSUInteger, x)
#define to_value_MTLCommandBufferError(x) TO_ENUM(MTLCommandBufferError, NSUInteger, x)
#define is_value_MTLCommandBufferError(x) IS_ENUM(MTLCommandBufferError, NSUInteger, x)

#define js_value_MTLDispatchType(x) JS_ENUM(MTLDispatchType, NSUInteger, x)
#define to_value_MTLDispatchType(x) TO_ENUM(MTLDispatchType, NSUInteger, x)
#define is_value_MTLDispatchType(x) IS_ENUM(MTLDispatchType, NSUInteger, x)

JS_WRAP_PROTOCOL(MTLCommandBuffer, NSObject);
  JS_METHOD(enqueue);
  JS_METHOD(commit);
  JS_METHOD(addScheduledHandler);
  JS_METHOD(presentDrawable);
  JS_METHOD(presentDrawableAtTime);
  JS_METHOD(presentDrawableAfterMinimumDuration);
  JS_METHOD(waitUntilScheduled);
  JS_METHOD(addCompletedHandler);
  JS_METHOD(waitUntilCompleted);
  JS_METHOD(blitCommandEncoder);
  JS_METHOD(renderCommandEncoderWithDescriptor);
  JS_METHOD(computeCommandEncoder);
  JS_METHOD(computeCommandEncoderWithDispatchType);
  JS_METHOD(encodeWaitForEventValue);
  JS_METHOD(encodeSignalEventValue);
  JS_METHOD(parallelRenderCommandEncoderWithDescriptor);
  JS_METHOD(pushDebugGroup);
  JS_METHOD(popDebugGroup);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(commandQueue);
  JS_PROP_READONLY(retainedReferences);
  JS_PROP(label);
  JS_PROP_READONLY(kernelStartTime);
  JS_PROP_READONLY(kernelEndTime);
  JS_PROP_READONLY(GPUStartTime);
  JS_PROP_READONLY(GPUEndTime);
  JS_PROP_READONLY(status);
  JS_PROP_READONLY(error);
JS_WRAP_PROTOCOL_END(MTLCommandBuffer, NSObject);

#endif /* NMTLCommandBuffer_h */
