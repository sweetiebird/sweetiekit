//
//  NMTLIndirectCommandBufferDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLIndirectCommandBufferDescriptor_h
#define NMTLIndirectCommandBufferDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLIndirectCommandBufferDescriptor(x) js_value_wrapper(x, MTLIndirectCommandBufferDescriptor)
#define to_value_MTLIndirectCommandBufferDescriptor(x) to_value_wrapper(x, MTLIndirectCommandBufferDescriptor)
#define is_value_MTLIndirectCommandBufferDescriptor(x) is_value_wrapper(x, MTLIndirectCommandBufferDescriptor)

#define js_value_MTLIndirectCommandType(x) JS_ENUM(MTLIndirectCommandType, NSUInteger, x)
#define to_value_MTLIndirectCommandType(x) TO_ENUM(MTLIndirectCommandType, NSUInteger, x)
#define is_value_MTLIndirectCommandType(x) IS_ENUM(MTLIndirectCommandType, NSUInteger, x)

JS_WRAP_CLASS(MTLIndirectCommandBufferDescriptor, NSObject);
  JS_PROP(commandTypes);
#if !TARGET_OS_IPHONE
  JS_PROP(inheritPipelineState);
#endif
  JS_PROP(inheritBuffers);
  JS_PROP(maxVertexBufferBindCount);
  JS_PROP(maxFragmentBufferBindCount);
JS_WRAP_CLASS_END(MTLIndirectCommandBufferDescriptor);

#endif /* NMTLIndirectCommandBufferDescriptor_h */
