//
//  NMTLRenderPipeline.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipeline_h
#define NMTLRenderPipeline_h    

#include "NNSObject.h"

#include "NMTLRenderPipelineState.h"

#define js_value_MTLBlendFactor(x) JS_ENUM(MTLBlendFactor, NSUInteger, x)
#define to_value_MTLBlendFactor(x) TO_ENUM(MTLBlendFactor, NSUInteger, x)
#define is_value_MTLBlendFactor(x) IS_ENUM(MTLBlendFactor, NSUInteger, x)

#define js_value_MTLBlendOperation(x) JS_ENUM(MTLBlendOperation, NSUInteger, x)
#define to_value_MTLBlendOperation(x) TO_ENUM(MTLBlendOperation, NSUInteger, x)
#define is_value_MTLBlendOperation(x) IS_ENUM(MTLBlendOperation, NSUInteger, x)

#define js_value_MTLColorWriteMask(x) JS_ENUM(MTLColorWriteMask, NSUInteger, x)
#define to_value_MTLColorWriteMask(x) TO_ENUM(MTLColorWriteMask, NSUInteger, x)
#define is_value_MTLColorWriteMask(x) IS_ENUM(MTLColorWriteMask, NSUInteger, x)

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

JS_WRAP_GLOBALS(MTLRenderPipeline);
JS_WRAP_GLOBALS_END(MTLRenderPipeline);

#endif /* NMTLRenderPipeline_h */
