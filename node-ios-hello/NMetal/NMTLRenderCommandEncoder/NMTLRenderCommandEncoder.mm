//
//  NMTLRenderCommandEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderCommandEncoder.h"

#define instancetype MTLRenderCommandEncoder
#define js_value_instancetype js_value_MTLRenderCommandEncoder

Local<Value> js_value_MTLScissorRect(const MTLScissorRect& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("x"), js_value_double(value.x));
  result->Set(JS_STR("y"), js_value_double(value.y));
  result->Set(JS_STR("width"), js_value_double(value.width));
  result->Set(JS_STR("height"), js_value_double(value.height));
  return scope.Escape(result);
}

MTLScissorRect to_value_MTLScissorRect(const Local<Value>& value, bool * _Nullable failed) {
  MTLScissorRect result;
  result.x = 0;
  result.y = 0;
  result.width = 0;
  result.height = 0;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLScissorRect(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MTLScissorRect");
    }
    return result;
  }
  result.x = to_value_double(JS_OBJ(value)->Get(JS_STR("x")));
  result.y = to_value_double(JS_OBJ(value)->Get(JS_STR("y")));
  result.width = to_value_double(JS_OBJ(value)->Get(JS_STR("width")));
  result.height = to_value_double(JS_OBJ(value)->Get(JS_STR("height")));
  return result;
}

bool is_value_MTLScissorRect(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_double(obj->Get(JS_STR("x")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("y")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("width")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("height")))) {
    return false;
  }
  return true;
}


Local<Value> js_value_MTLViewport(const MTLViewport& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("originX"), js_value_double(value.originX));
  result->Set(JS_STR("originY"), js_value_double(value.originY));
  result->Set(JS_STR("width"), js_value_double(value.width));
  result->Set(JS_STR("height"), js_value_double(value.height));
  result->Set(JS_STR("znear"), js_value_double(value.znear));
  result->Set(JS_STR("zfar"), js_value_double(value.zfar));
  return scope.Escape(result);
}

MTLViewport to_value_MTLViewport(const Local<Value>& value, bool * _Nullable failed) {
  MTLViewport result;
  result.originX = 0;
  result.originY = 0;
  result.width = 0;
  result.height = 0;
  result.znear = 0;
  result.zfar = 0;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLViewport(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected MTLViewport");
    }
    return result;
  }
  result.originX = to_value_double(JS_OBJ(value)->Get(JS_STR("originX")));
  result.originY = to_value_double(JS_OBJ(value)->Get(JS_STR("originY")));
  result.width = to_value_double(JS_OBJ(value)->Get(JS_STR("width")));
  result.height = to_value_double(JS_OBJ(value)->Get(JS_STR("height")));
  result.znear = to_value_double(JS_OBJ(value)->Get(JS_STR("znear")));
  result.zfar = to_value_double(JS_OBJ(value)->Get(JS_STR("zfar")));
  return result;
}

bool is_value_MTLViewport(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_double(obj->Get(JS_STR("originX")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("originY")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("width")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("height")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("znear")))) {
    return false;
  }
  if (!is_value_double(obj->Get(JS_STR("zfar")))) {
    return false;
  }
  return true;
}


NMTLRenderCommandEncoder::NMTLRenderCommandEncoder() {}
NMTLRenderCommandEncoder::~NMTLRenderCommandEncoder() {}

JS_INIT_PROTOCOL(MTLRenderCommandEncoder, MTLCommandEncoder);
  JS_ASSIGN_PROTO_METHOD(setRenderPipelineState);
  JS_ASSIGN_PROTO_METHOD(setVertexBytesLengthAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexBufferWithOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexBuffersOffsetsWithRange);
  JS_ASSIGN_PROTO_METHOD(setVertexTextureAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexTexturesWithRange);
  JS_ASSIGN_PROTO_METHOD(setVertexSamplerStateAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexSamplerStatesWithRange);
  JS_ASSIGN_PROTO_METHOD(setVertexSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_ASSIGN_PROTO_METHOD(setVertexSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_ASSIGN_PROTO_METHOD(setViewport);
  JS_ASSIGN_PROTO_METHOD(setViewportsCount);
  JS_ASSIGN_PROTO_METHOD(setFrontFacingWinding);
  JS_ASSIGN_PROTO_METHOD(setCullMode);
  JS_ASSIGN_PROTO_METHOD(setDepthClipMode);
  JS_ASSIGN_PROTO_METHOD(setDepthBiasSlopeScaleClamp);
  JS_ASSIGN_PROTO_METHOD(setScissorRect);
  JS_ASSIGN_PROTO_METHOD(setScissorRectsCount);
  JS_ASSIGN_PROTO_METHOD(setTriangleFillMode);
  JS_ASSIGN_PROTO_METHOD(setFragmentBytesLengthAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentBufferWithOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentBuffersOffsetsWithRange);
  JS_ASSIGN_PROTO_METHOD(setFragmentTextureAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentTexturesWithRange);
  JS_ASSIGN_PROTO_METHOD(setFragmentSamplerStateAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentSamplerStatesWithRange);
  JS_ASSIGN_PROTO_METHOD(setFragmentSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_ASSIGN_PROTO_METHOD(setBlendColorRedGreenBlueAlpha);
  JS_ASSIGN_PROTO_METHOD(setDepthStencilState);
  JS_ASSIGN_PROTO_METHOD(setStencilReferenceValue);
  JS_ASSIGN_PROTO_METHOD(setStencilFrontReferenceValueBackReferenceValue);
  JS_ASSIGN_PROTO_METHOD(setVisibilityResultModeOffset);
  JS_ASSIGN_PROTO_METHOD(setColorStoreActionAtIndex);
  JS_ASSIGN_PROTO_METHOD(setDepthStoreAction);
  JS_ASSIGN_PROTO_METHOD(setStencilStoreAction);
  JS_ASSIGN_PROTO_METHOD(setColorStoreActionOptionsAtIndex);
  JS_ASSIGN_PROTO_METHOD(setDepthStoreActionOptions);
  JS_ASSIGN_PROTO_METHOD(setStencilStoreActionOptions);
  JS_ASSIGN_PROTO_METHOD(drawPrimitivesVertexStartVertexCountInstanceCount);
  JS_ASSIGN_PROTO_METHOD(drawPrimitivesVertexStartVertexCount);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCount);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffset);
  JS_ASSIGN_PROTO_METHOD(drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance);
  JS_ASSIGN_PROTO_METHOD(drawPrimitivesIndirectBufferIndirectBufferOffset);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPrimitivesIndexTypeIndexBufferIndexBufferOffsetIndirectBufferIndirectBufferOffset);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(textureBarrier);
#endif
  JS_ASSIGN_PROTO_METHOD(updateFenceAfterStages);
  JS_ASSIGN_PROTO_METHOD(waitForFenceBeforeStages);
  JS_ASSIGN_PROTO_METHOD(setTessellationFactorBufferOffsetInstanceStride);
  JS_ASSIGN_PROTO_METHOD(setTessellationFactorScale);
  JS_ASSIGN_PROTO_METHOD(drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstance);
  JS_ASSIGN_PROTO_METHOD(drawPatchesPatchIndexBufferPatchIndexBufferOffsetIndirectBufferIndirectBufferOffset);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstance);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPatchesPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetIndirectBufferIndirectBufferOffset);
  JS_ASSIGN_PROTO_METHOD(setTileBytesLengthAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileBufferWithOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileBuffersOffsetsWithRange);
  JS_ASSIGN_PROTO_METHOD(setTileTextureAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileTexturesWithRange);
  JS_ASSIGN_PROTO_METHOD(setTileSamplerStateAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileSamplerStatesWithRange);
  JS_ASSIGN_PROTO_METHOD(setTileSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTileSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_ASSIGN_PROTO_METHOD(dispatchThreadsPerTile);
  JS_ASSIGN_PROTO_METHOD(setThreadgroupMemoryLengthOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(useResourceUsage);
  JS_ASSIGN_PROTO_METHOD(useResourcesCountUsage);
  JS_ASSIGN_PROTO_METHOD(useHeap);
  JS_ASSIGN_PROTO_METHOD(useHeapsCount);
  JS_ASSIGN_PROTO_METHOD(executeCommandsInBufferWithRange);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(executeCommandsInBufferIndirectBufferIndirectBufferOffset);
  JS_ASSIGN_PROTO_METHOD(memoryBarrierWithScopeAfterStagesBeforeStages);
#endif
  JS_ASSIGN_PROTO_METHOD(memoryBarrierWithResourcesCountAfterStagesBeforeStages);
  JS_ASSIGN_PROTO_PROP_READONLY(tileWidth);
  JS_ASSIGN_PROTO_PROP_READONLY(tileHeight);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLRenderCommandEncoder, MTLCommandEncoder);
  // constant values (exports)

  //typedef NS_ENUM(NSUInteger, MTLPrimitiveType) {
    JS_ASSIGN_ENUM(MTLPrimitiveTypePoint, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLPrimitiveTypeLine, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLPrimitiveTypeLineStrip, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLPrimitiveTypeTriangle, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLPrimitiveTypeTriangleStrip, NSUInteger); // = 4,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLVisibilityResultMode) {
    JS_ASSIGN_ENUM(MTLVisibilityResultModeDisabled, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLVisibilityResultModeBoolean, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLVisibilityResultModeCounting, NSUInteger); // API_AVAILABLE(macos(10.11), ios(9.0)) = 2,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLCullMode) {
    JS_ASSIGN_ENUM(MTLCullModeNone, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLCullModeFront, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLCullModeBack, NSUInteger); // = 2,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLWinding) {
    JS_ASSIGN_ENUM(MTLWindingClockwise, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLWindingCounterClockwise, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLDepthClipMode) {
    JS_ASSIGN_ENUM(MTLDepthClipModeClip, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLDepthClipModeClamp, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(9.0));

  //typedef NS_ENUM(NSUInteger, MTLTriangleFillMode) {
    JS_ASSIGN_ENUM(MTLTriangleFillModeFill, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLTriangleFillModeLines, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_OPTIONS(NSUInteger, MTLRenderStages) {
    JS_ASSIGN_ENUM(MTLRenderStageVertex, NSUInteger); //   = (1UL << 0),
    JS_ASSIGN_ENUM(MTLRenderStageFragment, NSUInteger); // = (1UL << 1),
  //} API_AVAILABLE(macos(10.13), ios(10.0));

JS_INIT_PROTOCOL_END(MTLRenderCommandEncoder, MTLCommandEncoder);


NAN_METHOD(NMTLRenderCommandEncoder::New) {
  JS_RECONSTRUCT(MTLRenderCommandEncoder);
  @autoreleasepool {
    id<MTLRenderCommandEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLRenderCommandEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLRenderCommandEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLRenderCommandEncoder, value);
      self = value;
    }
    if (self) {
      NMTLRenderCommandEncoder *wrapper = new NMTLRenderCommandEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLRenderCommandEncoder::New: invalid arguments");
    }
  }
}

#include "NMTLRenderPipelineState.h"

NAN_METHOD(NMTLRenderCommandEncoder::setRenderPipelineState) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLRenderPipelineState, pipelineState);
    [self setRenderPipelineState: pipelineState];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexBytesLengthAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (!info[data_argument_index]->IsNullOrUndefined() && !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* bytes = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, index);
    [self setVertexBytes: bytes length: length atIndex: index];
  }
}

#include "NMTLBuffer.h"

NAN_METHOD(NMTLRenderCommandEncoder::setVertexBufferWithOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setVertexBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setVertexBufferOffset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexBuffersOffsetsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray/* <const id <MTLBuffer> __nullable>*/, buffers);
    declare_pointer(NSArray/* <const NSUInteger>*/, offsets);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setVertexBuffers: buffers offsets: offsets withRange: range];
  }
}

#include "NMTLTexture.h"

NAN_METHOD(NMTLRenderCommandEncoder::setVertexTextureAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLTexture, texture);
    declare_value(NSUInteger, index);
    [self setVertexTexture: texture atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexTexturesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, textures);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setVertexTextures: textures withRange: range];
  }
}

#include "NMTLSamplerState.h"

NAN_METHOD(NMTLRenderCommandEncoder::setVertexSamplerStateAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(NSUInteger, index);
    [self setVertexSamplerState: sampler atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexSamplerStatesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setVertexSamplerStates: samplers withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexSamplerStateLodMinClampLodMaxClampAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(float, lodMinClamp);
    declare_value(float, lodMaxClamp);
    declare_value(NSUInteger, index);
    [self setVertexSamplerState: sampler lodMinClamp: lodMinClamp lodMaxClamp: lodMaxClamp atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVertexSamplerStatesLodMinClampsLodMaxClampsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_pointer(NSArray, lodMinClamps);
    declare_pointer(NSArray, lodMaxClamps);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setVertexSamplerStates: samplers lodMinClamps: lodMinClamps lodMaxClamps: lodMaxClamps withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setViewport) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLViewport, viewport);
    [self setViewport: viewport];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setViewportsCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, viewports);
    declare_value(NSUInteger, count);
    JS_TODO();
//    [self setViewports: viewports count: count];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFrontFacingWinding) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLWinding, frontFacingWinding);
    [self setFrontFacingWinding: frontFacingWinding];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setCullMode) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLCullMode, cullMode);
    [self setCullMode: cullMode];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setDepthClipMode) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLDepthClipMode, depthClipMode);
    [self setDepthClipMode: depthClipMode];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setDepthBiasSlopeScaleClamp) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, depthBias);
    declare_value(float, slopeScale);
    declare_value(float, clamp);
    [self setDepthBias: depthBias slopeScale: slopeScale clamp: clamp];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setScissorRect) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLScissorRect, rect);
    [self setScissorRect: rect];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setScissorRectsCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, scissorRects);
    declare_value(NSUInteger, count);
    JS_TODO();
//    [self setScissorRects: scissorRects count: count];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTriangleFillMode) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLTriangleFillMode, fillMode);
    [self setTriangleFillMode: fillMode];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentBytesLengthAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (!info[data_argument_index]->IsNullOrUndefined() && !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* bytes = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, index);
    [self setFragmentBytes: bytes length: length atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentBufferWithOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setFragmentBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setFragmentBufferOffset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentBuffersOffsetsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, buffers);
    declare_pointer(NSArray, offsets);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setFragmentBuffers: buffers offsets: offsets withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentTextureAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLTexture, texture);
    declare_value(NSUInteger, index);
    [self setFragmentTexture: texture atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentTexturesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, textures);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setFragmentTextures: textures withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentSamplerStateAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(NSUInteger, index);
    [self setFragmentSamplerState: sampler atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentSamplerStatesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setFragmentSamplerStates: samplers withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentSamplerStateLodMinClampLodMaxClampAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(float, lodMinClamp);
    declare_value(float, lodMaxClamp);
    declare_value(NSUInteger, index);
    [self setFragmentSamplerState: sampler lodMinClamp: lodMinClamp lodMaxClamp: lodMaxClamp atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setFragmentSamplerStatesLodMinClampsLodMaxClampsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_pointer(NSArray, lodMinClamps);
    declare_pointer(NSArray, lodMaxClamps);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setFragmentSamplerStates: samplers lodMinClamps: lodMinClamps lodMaxClamps: lodMaxClamps withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setBlendColorRedGreenBlueAlpha) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, red);
    declare_value(float, green);
    declare_value(float, blue);
    declare_value(float, alpha);
    [self setBlendColorRed: red green: green blue: blue alpha: alpha];
  }
}

#include "NMTLDepthStencilState.h"

NAN_METHOD(NMTLRenderCommandEncoder::setDepthStencilState) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLDepthStencilState, depthStencilState);
    [self setDepthStencilState: depthStencilState];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setStencilReferenceValue) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, referenceValue);
    [self setStencilReferenceValue: referenceValue];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setStencilFrontReferenceValueBackReferenceValue) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint32_t, frontReferenceValue);
    declare_value(uint32_t, backReferenceValue);
    [self setStencilFrontReferenceValue: frontReferenceValue backReferenceValue: backReferenceValue];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setVisibilityResultModeOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLVisibilityResultMode, mode);
    declare_value(NSUInteger, offset);
    [self setVisibilityResultMode: mode offset: offset];
  }
}

#include "NMTLRenderPassDescriptor.h"

NAN_METHOD(NMTLRenderCommandEncoder::setColorStoreActionAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreAction, storeAction);
    declare_value(NSUInteger, colorAttachmentIndex);
    [self setColorStoreAction: storeAction atIndex: colorAttachmentIndex];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setDepthStoreAction) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreAction, storeAction);
    [self setDepthStoreAction: storeAction];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setStencilStoreAction) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreAction, storeAction);
    [self setStencilStoreAction: storeAction];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setColorStoreActionOptionsAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreActionOptions, storeActionOptions);
    declare_value(NSUInteger, colorAttachmentIndex);
    [self setColorStoreActionOptions: storeActionOptions atIndex: colorAttachmentIndex];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setDepthStoreActionOptions) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreActionOptions, storeActionOptions);
    [self setDepthStoreActionOptions: storeActionOptions];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setStencilStoreActionOptions) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLStoreActionOptions, storeActionOptions);
    [self setStencilStoreActionOptions: storeActionOptions];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPrimitivesVertexStartVertexCountInstanceCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, vertexStart);
    declare_value(NSUInteger, vertexCount);
    declare_value(NSUInteger, instanceCount);
    [self drawPrimitives: primitiveType vertexStart: vertexStart vertexCount: vertexCount instanceCount: instanceCount];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPrimitivesVertexStartVertexCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, vertexStart);
    declare_value(NSUInteger, vertexCount);
    [self drawPrimitives: primitiveType vertexStart: vertexStart vertexCount: vertexCount];
  }
}

#include "NMTLStageInputOutputDescriptor.h"

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, indexCount);
    declare_value(MTLIndexType, indexType);
    declare_protocol(MTLBuffer, indexBuffer);
    declare_value(NSUInteger, indexBufferOffset);
    declare_value(NSUInteger, instanceCount);
    [self drawIndexedPrimitives: primitiveType indexCount: indexCount indexType: indexType indexBuffer: indexBuffer indexBufferOffset: indexBufferOffset instanceCount: instanceCount];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, indexCount);
    declare_value(MTLIndexType, indexType);
    declare_protocol(MTLBuffer, indexBuffer);
    declare_value(NSUInteger, indexBufferOffset);
    [self drawIndexedPrimitives: primitiveType indexCount: indexCount indexType: indexType indexBuffer: indexBuffer indexBufferOffset: indexBufferOffset];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, vertexStart);
    declare_value(NSUInteger, vertexCount);
    declare_value(NSUInteger, instanceCount);
    declare_value(NSUInteger, baseInstance);
    [self drawPrimitives: primitiveType vertexStart: vertexStart vertexCount: vertexCount instanceCount: instanceCount baseInstance: baseInstance];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(NSUInteger, indexCount);
    declare_value(MTLIndexType, indexType);
    declare_protocol(MTLBuffer, indexBuffer);
    declare_value(NSUInteger, indexBufferOffset);
    declare_value(NSUInteger, instanceCount);
    declare_value(NSInteger, baseVertex);
    declare_value(NSUInteger, baseInstance);
    [self drawIndexedPrimitives: primitiveType indexCount: indexCount indexType: indexType indexBuffer: indexBuffer indexBufferOffset: indexBufferOffset instanceCount: instanceCount baseVertex: baseVertex baseInstance: baseInstance];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPrimitivesIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self drawPrimitives: primitiveType indirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPrimitivesIndexTypeIndexBufferIndexBufferOffsetIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPrimitiveType, primitiveType);
    declare_value(MTLIndexType, indexType);
    declare_protocol(MTLBuffer, indexBuffer);
    declare_value(NSUInteger, indexBufferOffset);
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self drawIndexedPrimitives: primitiveType indexType: indexType indexBuffer: indexBuffer indexBufferOffset: indexBufferOffset indirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset];
  }
}

#if !TARGET_OS_IPHONE
NAN_METHOD(NMTLRenderCommandEncoder::textureBarrier) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    [self textureBarrier];
  }
}
#endif

#include "NMTLFence.h"

NAN_METHOD(NMTLRenderCommandEncoder::updateFenceAfterStages) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFence, fence);
    declare_value(MTLRenderStages, stages);
    [self updateFence: fence afterStages: stages];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::waitForFenceBeforeStages) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFence, fence);
    declare_value(MTLRenderStages, stages);
    [self waitForFence: fence beforeStages: stages];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTessellationFactorBufferOffsetInstanceStride) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, instanceStride);
    [self setTessellationFactorBuffer: buffer offset: offset instanceStride: instanceStride];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTessellationFactorScale) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, scale);
    [self setTessellationFactorScale: scale];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfPatchControlPoints);
    declare_value(NSUInteger, patchStart);
    declare_value(NSUInteger, patchCount);
    declare_nullable_protocol(MTLBuffer, patchIndexBuffer);
    declare_value(NSUInteger, patchIndexBufferOffset);
    declare_value(NSUInteger, instanceCount);
    declare_value(NSUInteger, baseInstance);
    [self drawPatches: numberOfPatchControlPoints patchStart: patchStart patchCount: patchCount patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset instanceCount: instanceCount baseInstance: baseInstance];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawPatchesPatchIndexBufferPatchIndexBufferOffsetIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfPatchControlPoints);
    declare_nullable_protocol(MTLBuffer, patchIndexBuffer);
    declare_value(NSUInteger, patchIndexBufferOffset);
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self drawPatches: numberOfPatchControlPoints patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset indirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfPatchControlPoints);
    declare_value(NSUInteger, patchStart);
    declare_value(NSUInteger, patchCount);
    declare_nullable_protocol(MTLBuffer, patchIndexBuffer);
    declare_value(NSUInteger, patchIndexBufferOffset);
    declare_protocol(MTLBuffer, controlPointIndexBuffer);
    declare_value(NSUInteger, controlPointIndexBufferOffset);
    declare_value(NSUInteger, instanceCount);
    declare_value(NSUInteger, baseInstance);
    [self drawIndexedPatches: numberOfPatchControlPoints patchStart: patchStart patchCount: patchCount patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset controlPointIndexBuffer: controlPointIndexBuffer controlPointIndexBufferOffset: controlPointIndexBufferOffset instanceCount: instanceCount baseInstance: baseInstance];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::drawIndexedPatchesPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfPatchControlPoints);
    declare_nullable_protocol(MTLBuffer, patchIndexBuffer);
    declare_value(NSUInteger, patchIndexBufferOffset);
    declare_protocol(MTLBuffer, controlPointIndexBuffer);
    declare_value(NSUInteger, controlPointIndexBufferOffset);
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self drawIndexedPatches: numberOfPatchControlPoints patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset controlPointIndexBuffer: controlPointIndexBuffer controlPointIndexBufferOffset: controlPointIndexBufferOffset indirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileBytesLengthAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (!info[data_argument_index]->IsNullOrUndefined() && !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* bytes = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, index);
    [self setTileBytes: bytes length: length atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileBufferWithOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setTileBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setTileBufferOffset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileBuffersOffsetsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, buffers);
    declare_pointer(NSArray, offsets);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setTileBuffers: buffers offsets: offsets withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileTextureAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLTexture, texture);
    declare_value(NSUInteger, index);
    [self setTileTexture: texture atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileTexturesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, textures);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setTileTextures: textures withRange: range];
  }
}

#include "NMTLSamplerState.h"

NAN_METHOD(NMTLRenderCommandEncoder::setTileSamplerStateAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(NSUInteger, index);
    [self setTileSamplerState: sampler atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileSamplerStatesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setTileSamplerStates: samplers withRange: range];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileSamplerStateLodMinClampLodMaxClampAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(float, lodMinClamp);
    declare_value(float, lodMaxClamp);
    declare_value(NSUInteger, index);
    [self setTileSamplerState: sampler lodMinClamp: lodMinClamp lodMaxClamp: lodMaxClamp atIndex: index];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setTileSamplerStatesLodMinClampsLodMaxClampsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, samplers);
    declare_pointer(NSArray, lodMinClamps);
    declare_pointer(NSArray, lodMaxClamps);
    declare_value(NSRange, range);
    JS_TODO();
//    [self setTileSamplerStates: samplers lodMinClamps: lodMinClamps lodMaxClamps: lodMaxClamps withRange: range];
  }
}

#include "NMTLTypes.h"

NAN_METHOD(NMTLRenderCommandEncoder::dispatchThreadsPerTile) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLSize, threadsPerTile);
    [self dispatchThreadsPerTile: threadsPerTile];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::setThreadgroupMemoryLengthOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setThreadgroupMemoryLength: length offset: offset atIndex: index];
  }
}

#include "NMTLResource.h"

NAN_METHOD(NMTLRenderCommandEncoder::useResourceUsage) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLResource, resource);
    declare_value(MTLResourceUsage, usage);
    [self useResource: resource usage: usage];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::useResourcesCountUsage) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, resources);
    declare_value(NSUInteger, count);
    declare_value(MTLResourceUsage, usage);
    JS_TODO();
//    [self useResources: resources count: count usage: usage];
  }
}

#include "NMTLHeap.h"

NAN_METHOD(NMTLRenderCommandEncoder::useHeap) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLHeap, heap);
    [self useHeap: heap];
  }
}

NAN_METHOD(NMTLRenderCommandEncoder::useHeapsCount) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, heaps);
    declare_value(NSUInteger, count);
    JS_TODO();
//    [self useHeaps: heaps count: count];
  }
}

#include "NMTLIndirectCommandBuffer.h"

NAN_METHOD(NMTLRenderCommandEncoder::executeCommandsInBufferWithRange) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLIndirectCommandBuffer, indirectCommandBuffer);
    declare_value(NSRange, executionRange);
    [self executeCommandsInBuffer: indirectCommandBuffer withRange: executionRange];
  }
}

#if !TARGET_OS_IPHONE
NAN_METHOD(NMTLRenderCommandEncoder::executeCommandsInBufferIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLIndirectCommandBuffer, indirectCommandbuffer);
    declare_protocol(MTLBuffer, indirectRangeBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self executeCommandsInBuffer: indirectCommandbuffer indirectBuffer: indirectRangeBuffer indirectBufferOffset: indirectBufferOffset];
  }
}
#endif

#if !TARGET_OS_IPHONE
NAN_METHOD(NMTLRenderCommandEncoder::memoryBarrierWithScopeAfterStagesBeforeStages) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLBarrierScope, scope);
    declare_value(MTLRenderStages, after);
    declare_value(MTLRenderStages, before);
    [self memoryBarrierWithScope: scope afterStages: after beforeStages: before];
  }
}
#endif

NAN_METHOD(NMTLRenderCommandEncoder::memoryBarrierWithResourcesCountAfterStagesBeforeStages) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray, resources);
    declare_value(NSUInteger, count);
    declare_value(MTLRenderStages, after);
    declare_value(MTLRenderStages, before);
    JS_TODO();
//    [self memoryBarrierWithResources: resources count: count afterStages: after beforeStages: before];
  }
}

NAN_GETTER(NMTLRenderCommandEncoder::tileWidthGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self tileWidth]));
  }
}

NAN_GETTER(NMTLRenderCommandEncoder::tileHeightGetter) {
  JS_UNWRAP_PROTOCOL(MTLRenderCommandEncoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self tileHeight]));
  }
}
