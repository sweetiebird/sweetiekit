//
//  NMTLRenderPipelineDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineDescriptor_h
#define NMTLRenderPipelineDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineDescriptor(x) js_value_wrapper(x, MTLRenderPipelineDescriptor)
#define to_value_MTLRenderPipelineDescriptor(x) to_value_wrapper(x, MTLRenderPipelineDescriptor)
#define is_value_MTLRenderPipelineDescriptor(x) is_value_wrapper(x, MTLRenderPipelineDescriptor)

#define js_value_MTLBlendFactor(x) JS_ENUM(MTLBlendFactor, NSUInteger, x)
#define to_value_MTLBlendFactor(x) TO_ENUM(MTLBlendFactor, NSUInteger, x)
#define is_value_MTLBlendFactor(x) IS_ENUM(MTLBlendFactor, NSUInteger, x)

#define js_value_MTLBlendOperation(x) JS_ENUM(MTLBlendOperation, NSUInteger, x)
#define to_value_MTLBlendOperation(x) TO_ENUM(MTLBlendOperation, NSUInteger, x)
#define is_value_MTLBlendOperation(x) IS_ENUM(MTLBlendOperation, NSUInteger, x)

#define js_value_MTLColorWriteMask(x) JS_OPTS(MTLColorWriteMask, NSUInteger, x)
#define to_value_MTLColorWriteMask(x) TO_OPTS(MTLColorWriteMask, NSUInteger, x)
#define is_value_MTLColorWriteMask(x) IS_OPTS(MTLColorWriteMask, NSUInteger, x)

#define js_value_MTLPrimitiveTopologyClass(x) JS_ENUM(MTLPrimitiveTopologyClass, NSUInteger, x)
#define to_value_MTLPrimitiveTopologyClass(x) TO_ENUM(MTLPrimitiveTopologyClass, NSUInteger, x)
#define is_value_MTLPrimitiveTopologyClass(x) IS_ENUM(MTLPrimitiveTopologyClass, NSUInteger, x)

#define js_value_MTLTessellationPartitionMode(x) JS_ENUM(MTLTessellationPartitionMode, NSUInteger, x)
#define to_value_MTLTessellationPartitionMode(x) TO_ENUM(MTLTessellationPartitionMode, NSUInteger, x)
#define is_value_MTLTessellationPartitionMode(x) IS_ENUM(MTLTessellationPartitionMode, NSUInteger, x)

#define js_value_MTLTessellationFactorStepFunction(x) JS_ENUM(MTLTessellationFactorStepFunction, NSUInteger, x)
#define to_value_MTLTessellationFactorStepFunction(x) TO_ENUM(MTLTessellationFactorStepFunction, NSUInteger, x)
#define is_value_MTLTessellationFactorStepFunction(x) IS_ENUM(MTLTessellationFactorStepFunction, NSUInteger, x)

#define js_value_MTLTessellationFactorFormat(x) JS_ENUM(MTLTessellationFactorFormat, NSUInteger, x)
#define to_value_MTLTessellationFactorFormat(x) TO_ENUM(MTLTessellationFactorFormat, NSUInteger, x)
#define is_value_MTLTessellationFactorFormat(x) IS_ENUM(MTLTessellationFactorFormat, NSUInteger, x)

#define js_value_MTLTessellationControlPointIndexType(x) JS_ENUM(MTLTessellationControlPointIndexType, NSUInteger, x)
#define to_value_MTLTessellationControlPointIndexType(x) TO_ENUM(MTLTessellationControlPointIndexType, NSUInteger, x)
#define is_value_MTLTessellationControlPointIndexType(x) IS_ENUM(MTLTessellationControlPointIndexType, NSUInteger, x)

JS_WRAP_CLASS(MTLRenderPipelineDescriptor, NSObject);
  JS_METHOD(reset);
  JS_PROP(label);
  JS_PROP(vertexFunction);
  JS_PROP(fragmentFunction);
  JS_PROP(vertexDescriptor);
  JS_PROP(sampleCount);
  JS_PROP(rasterSampleCount);
  JS_PROP(isAlphaToCoverageEnabled);
  JS_PROP(isAlphaToOneEnabled);
  JS_PROP(isRasterizationEnabled);
  JS_PROP_READONLY(colorAttachments);
  JS_PROP(depthAttachmentPixelFormat);
  JS_PROP(stencilAttachmentPixelFormat);
  JS_PROP(inputPrimitiveTopology);
  JS_PROP(tessellationPartitionMode);
  JS_PROP(maxTessellationFactor);
  JS_PROP(isTessellationFactorScaleEnabled);
  JS_PROP(tessellationFactorFormat);
  JS_PROP(tessellationControlPointIndexType);
  JS_PROP(tessellationFactorStepFunction);
  JS_PROP(tessellationOutputWindingOrder);
  JS_PROP_READONLY(vertexBuffers);
  JS_PROP_READONLY(fragmentBuffers);
  JS_PROP(supportIndirectCommandBuffers);
JS_WRAP_CLASS_END(MTLRenderPipelineDescriptor);

#endif /* NMTLRenderPipelineDescriptor_h */
