//
//  NMTLRenderPassDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassDescriptor_h
#define NMTLRenderPassDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLRenderPassDescriptor(x) js_value_wrapper(x, MTLRenderPassDescriptor)
#define to_value_MTLRenderPassDescriptor(x) to_value_wrapper(x, MTLRenderPassDescriptor)
#define is_value_MTLRenderPassDescriptor(x) is_value_wrapper(x, MTLRenderPassDescriptor)

#define js_value_MTLLoadAction(x) JS_ENUM(MTLLoadAction, NSUInteger, x)
#define to_value_MTLLoadAction(x) TO_ENUM(MTLLoadAction, NSUInteger, x)
#define is_value_MTLLoadAction(x) IS_ENUM(MTLLoadAction, NSUInteger, x)

#define js_value_MTLStoreAction(x) JS_ENUM(MTLStoreAction, NSUInteger, x)
#define to_value_MTLStoreAction(x) TO_ENUM(MTLStoreAction, NSUInteger, x)
#define is_value_MTLStoreAction(x) IS_ENUM(MTLStoreAction, NSUInteger, x)

#define js_value_MTLStoreActionOptions(x) JS_OPTS(MTLStoreActionOptions, NSUInteger, x)
#define to_value_MTLStoreActionOptions(x) TO_OPTS(MTLStoreActionOptions, NSUInteger, x)
#define is_value_MTLStoreActionOptions(x) IS_OPTS(MTLStoreActionOptions, NSUInteger, x)

#define js_value_MTLMultisampleDepthResolveFilter(x) JS_ENUM(MTLMultisampleDepthResolveFilter, NSUInteger, x)
#define to_value_MTLMultisampleDepthResolveFilter(x) TO_ENUM(MTLMultisampleDepthResolveFilter, NSUInteger, x)
#define is_value_MTLMultisampleDepthResolveFilter(x) IS_ENUM(MTLMultisampleDepthResolveFilter, NSUInteger, x)

#define js_value_MTLMultisampleStencilResolveFilter(x) JS_ENUM(MTLMultisampleStencilResolveFilter, NSUInteger, x)
#define to_value_MTLMultisampleStencilResolveFilter(x) TO_ENUM(MTLMultisampleStencilResolveFilter, NSUInteger, x)
#define is_value_MTLMultisampleStencilResolveFilter(x) IS_ENUM(MTLMultisampleStencilResolveFilter, NSUInteger, x)

Local<Value> js_value_MTLClearColor(const MTLClearColor& color);
MTLClearColor to_value_MTLClearColor(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_MTLClearColor(const Local<Value>& value);

JS_WRAP_CLASS(MTLRenderPassDescriptor, NSObject);
  JS_STATIC_METHOD(renderPassDescriptor);
  JS_METHOD(setSamplePositionsCount);
  JS_METHOD(getSamplePositionsCount);
  JS_PROP_READONLY(colorAttachments);
  JS_PROP(depthAttachment);
  JS_PROP(stencilAttachment);
  JS_PROP(visibilityResultBuffer);
  JS_PROP(renderTargetArrayLength);
  JS_PROP(imageblockSampleLength);
  JS_PROP(threadgroupMemoryLength);
  JS_PROP(tileWidth);
  JS_PROP(tileHeight);
  JS_PROP(defaultRasterSampleCount);
  JS_PROP(renderTargetWidth);
  JS_PROP(renderTargetHeight);
JS_WRAP_CLASS_END(MTLRenderPassDescriptor);

#endif /* NMTLRenderPassDescriptor_h */
