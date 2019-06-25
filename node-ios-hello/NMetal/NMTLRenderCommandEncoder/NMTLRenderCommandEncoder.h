//
//  NMTLRenderCommandEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderCommandEncoder_h
#define NMTLRenderCommandEncoder_h    

#include "NMTLCommandEncoder.h"

#define js_value_MTLRenderCommandEncoder(x) js_protocol_wrapper(x, MTLRenderCommandEncoder)
#define to_value_MTLRenderCommandEncoder(x) to_protocol_wrapper(x, MTLRenderCommandEncoder)
#define is_value_MTLRenderCommandEncoder(x) is_protocol_wrapper(x, MTLRenderCommandEncoder)

#define js_value_MTLPrimitiveType(x) JS_ENUM(MTLPrimitiveType, NSUInteger, x)
#define to_value_MTLPrimitiveType(x) TO_ENUM(MTLPrimitiveType, NSUInteger, x)
#define is_value_MTLPrimitiveType(x) IS_ENUM(MTLPrimitiveType, NSUInteger, x)

#define js_value_MTLVisibilityResultMode(x) JS_ENUM(MTLVisibilityResultMode, NSUInteger, x)
#define to_value_MTLVisibilityResultMode(x) TO_ENUM(MTLVisibilityResultMode, NSUInteger, x)
#define is_value_MTLVisibilityResultMode(x) IS_ENUM(MTLVisibilityResultMode, NSUInteger, x)

#define js_value_MTLCullMode(x) JS_ENUM(MTLCullMode, NSUInteger, x)
#define to_value_MTLCullMode(x) TO_ENUM(MTLCullMode, NSUInteger, x)
#define is_value_MTLCullMode(x) IS_ENUM(MTLCullMode, NSUInteger, x)

#define js_value_MTLWinding(x) JS_ENUM(MTLWinding, NSUInteger, x)
#define to_value_MTLWinding(x) TO_ENUM(MTLWinding, NSUInteger, x)
#define is_value_MTLWinding(x) IS_ENUM(MTLWinding, NSUInteger, x)

#define js_value_MTLDepthClipMode(x) JS_ENUM(MTLDepthClipMode, NSUInteger, x)
#define to_value_MTLDepthClipMode(x) TO_ENUM(MTLDepthClipMode, NSUInteger, x)
#define is_value_MTLDepthClipMode(x) IS_ENUM(MTLDepthClipMode, NSUInteger, x)

#define js_value_MTLTriangleFillMode(x) JS_ENUM(MTLTriangleFillMode, NSUInteger, x)
#define to_value_MTLTriangleFillMode(x) TO_ENUM(MTLTriangleFillMode, NSUInteger, x)
#define is_value_MTLTriangleFillMode(x) IS_ENUM(MTLTriangleFillMode, NSUInteger, x)

#define js_value_MTLRenderStages(x) JS_OPTS(MTLRenderStages, NSUInteger, x)
#define to_value_MTLRenderStages(x) TO_OPTS(MTLRenderStages, NSUInteger, x)
#define is_value_MTLRenderStages(x) IS_OPTS(MTLRenderStages, NSUInteger, x)

/*
typedef struct {
  NSUInteger x, y, width, height;
} MTLScissorRect;
*/
JS_DECLARE_STRUCT(MTLScissorRect);

/*
typedef struct {
  double originX, originY, width, height, znear, zfar;
} MTLViewport;
*/
JS_DECLARE_STRUCT(MTLViewport);

/*
typedef struct {
  uint32_t vertexCount;
  uint32_t instanceCount;
  uint32_t vertexStart;
  uint32_t baseInstance;
} MTLDrawPrimitivesIndirectArguments;
*/
JS_DECLARE_STRUCT(MTLDrawPrimitivesIndirectArguments);

/*
typedef struct {
  uint32_t indexCount;
  uint32_t instanceCount;
  uint32_t indexStart;
  int32_t  baseVertex;
  uint32_t baseInstance;
} MTLDrawIndexedPrimitivesIndirectArguments;
*/
JS_DECLARE_STRUCT(MTLDrawIndexedPrimitivesIndirectArguments);

/*
typedef struct {
  uint32_t patchCount;
  uint32_t instanceCount;
  uint32_t patchStart;
  uint32_t baseInstance;
} MTLDrawPatchIndirectArguments;
*/
JS_DECLARE_STRUCT(MTLDrawPatchIndirectArguments);

/*
typedef struct {
  uint16_t edgeTessellationFactor[4];
  uint16_t insideTessellationFactor[2];
} MTLQuadTessellationFactorsHalf;
*/
JS_DECLARE_STRUCT(MTLQuadTessellationFactorsHalf);

/*
typedef struct {
  uint16_t edgeTessellationFactor[3];
  uint16_t insideTessellationFactor;
} MTLTriangleTessellationFactorsHalf;
*/
JS_DECLARE_STRUCT(MTLTriangleTessellationFactorsHalf);

JS_WRAP_PROTOCOL(MTLRenderCommandEncoder, MTLCommandEncoder);
  JS_METHOD(setRenderPipelineState);
  JS_METHOD(setVertexBytesLengthAtIndex);
  JS_METHOD(setVertexBufferWithOffsetAtIndex);
  JS_METHOD(setVertexBufferOffsetAtIndex);
  JS_METHOD(setVertexBuffersOffsetsWithRange);
  JS_METHOD(setVertexTextureAtIndex);
  JS_METHOD(setVertexTexturesWithRange);
  JS_METHOD(setVertexSamplerStateAtIndex);
  JS_METHOD(setVertexSamplerStatesWithRange);
  JS_METHOD(setVertexSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_METHOD(setVertexSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_METHOD(setViewport);
  JS_METHOD(setViewportsCount);
  JS_METHOD(setFrontFacingWinding);
  JS_METHOD(setCullMode);
  JS_METHOD(setDepthClipMode);
  JS_METHOD(setDepthBiasSlopeScaleClamp);
  JS_METHOD(setScissorRect);
  JS_METHOD(setScissorRectsCount);
  JS_METHOD(setTriangleFillMode);
  JS_METHOD(setFragmentBytesLengthAtIndex);
  JS_METHOD(setFragmentBufferWithOffsetAtIndex);
  JS_METHOD(setFragmentBufferOffsetAtIndex);
  JS_METHOD(setFragmentBuffersOffsetsWithRange);
  JS_METHOD(setFragmentTextureAtIndex);
  JS_METHOD(setFragmentTexturesWithRange);
  JS_METHOD(setFragmentSamplerStateAtIndex);
  JS_METHOD(setFragmentSamplerStatesWithRange);
  JS_METHOD(setFragmentSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_METHOD(setFragmentSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_METHOD(setBlendColorRedGreenBlueAlpha);
  JS_METHOD(setDepthStencilState);
  JS_METHOD(setStencilReferenceValue);
  JS_METHOD(setStencilFrontReferenceValueBackReferenceValue);
  JS_METHOD(setVisibilityResultModeOffset);
  JS_METHOD(setColorStoreActionAtIndex);
  JS_METHOD(setDepthStoreAction);
  JS_METHOD(setStencilStoreAction);
  JS_METHOD(setColorStoreActionOptionsAtIndex);
  JS_METHOD(setDepthStoreActionOptions);
  JS_METHOD(setStencilStoreActionOptions);
  JS_METHOD(drawPrimitivesVertexStartVertexCountInstanceCount);
  JS_METHOD(drawPrimitivesVertexStartVertexCount);
  JS_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCount);
  JS_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffset);
  JS_METHOD(drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance);
  JS_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance);
  JS_METHOD(drawPrimitivesIndirectBufferIndirectBufferOffset);
  JS_METHOD(drawIndexedPrimitivesIndexTypeIndexBufferIndexBufferOffsetIndirectBufferIndirectBufferOffset);
#if !TARGET_OS_IPHONE
  JS_METHOD(textureBarrier);
#endif
  JS_METHOD(updateFenceAfterStages);
  JS_METHOD(waitForFenceBeforeStages);
  JS_METHOD(setTessellationFactorBufferOffsetInstanceStride);
  JS_METHOD(setTessellationFactorScale);
  JS_METHOD(drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstance);
  JS_METHOD(drawPatchesPatchIndexBufferPatchIndexBufferOffsetIndirectBufferIndirectBufferOffset);
  JS_METHOD(drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstance);
  JS_METHOD(drawIndexedPatchesPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetIndirectBufferIndirectBufferOffset);
  JS_METHOD(setTileBytesLengthAtIndex);
  JS_METHOD(setTileBufferWithOffsetAtIndex);
  JS_METHOD(setTileBufferOffsetAtIndex);
  JS_METHOD(setTileBuffersOffsetsWithRange);
  JS_METHOD(setTileTextureAtIndex);
  JS_METHOD(setTileTexturesWithRange);
  JS_METHOD(setTileSamplerStateAtIndex);
  JS_METHOD(setTileSamplerStatesWithRange);
  JS_METHOD(setTileSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_METHOD(setTileSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_METHOD(dispatchThreadsPerTile);
  JS_METHOD(setThreadgroupMemoryLengthOffsetAtIndex);
  JS_METHOD(useResourceUsage);
  JS_METHOD(useResourcesCountUsage);
  JS_METHOD(useHeap);
  JS_METHOD(useHeapsCount);
  JS_METHOD(executeCommandsInBufferWithRange);
#if !TARGET_OS_IPHONE
  JS_METHOD(executeCommandsInBufferIndirectBufferIndirectBufferOffset);
  JS_METHOD(memoryBarrierWithScopeAfterStagesBeforeStages);
#endif
  JS_METHOD(memoryBarrierWithResourcesCountAfterStagesBeforeStages);
  JS_PROP_READONLY(tileWidth);
  JS_PROP_READONLY(tileHeight);
JS_WRAP_PROTOCOL_END(MTLRenderCommandEncoder, MTLCommandEncoder);

#endif /* NMTLRenderCommandEncoder_h */
