//
//  NMTLIndirectRenderCommand.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLIndirectRenderCommand.h"

#define instancetype MTLIndirectRenderCommand
#define js_value_instancetype js_value_MTLIndirectRenderCommand

NMTLIndirectRenderCommand::NMTLIndirectRenderCommand() {}
NMTLIndirectRenderCommand::~NMTLIndirectRenderCommand() {}

JS_INIT_PROTOCOL(MTLIndirectRenderCommand, NSObject);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_METHOD(setRenderPipelineState);
#endif
  JS_ASSIGN_PROTO_METHOD(setVertexBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setFragmentBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride);
  JS_ASSIGN_PROTO_METHOD(drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance);
  JS_ASSIGN_PROTO_METHOD(drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance);
  JS_ASSIGN_PROTO_METHOD(reset);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLIndirectRenderCommand, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLIndirectRenderCommand, NSObject);


NAN_METHOD(NMTLIndirectRenderCommand::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLIndirectRenderCommand);
  @autoreleasepool {
    id<MTLIndirectRenderCommand> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLIndirectRenderCommand>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLIndirectRenderCommand> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLIndirectRenderCommand, value);
      self = value;
    }
    if (self) {
      NMTLIndirectRenderCommand *wrapper = new NMTLIndirectRenderCommand();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLIndirectRenderCommand::New: invalid arguments");
    }
  }
}

#include "NMTLRenderPipelineState.h"

#if !TARGET_OS_IPHONE
NAN_METHOD(NMTLIndirectRenderCommand::setRenderPipelineState) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLRenderPipelineState, pipelineState);
    [self setRenderPipelineState: pipelineState];
  }
}
#endif

#include "NMTLBuffer.h"

NAN_METHOD(NMTLIndirectRenderCommand::setVertexBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setVertexBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLIndirectRenderCommand::setFragmentBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setFragmentBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLIndirectRenderCommand::drawPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, numberOfPatchControlPoints);
    declare_value(NSUInteger, patchStart);
    declare_value(NSUInteger, patchCount);
    declare_nullable_protocol(MTLBuffer, patchIndexBuffer);
    declare_value(NSUInteger, patchIndexBufferOffset);
    declare_value(NSUInteger, instanceCount);
    declare_value(NSUInteger, baseInstance);
    declare_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, instanceStride);
    [self drawPatches: numberOfPatchControlPoints patchStart: patchStart patchCount: patchCount patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset instanceCount: instanceCount baseInstance: baseInstance tessellationFactorBuffer: buffer tessellationFactorBufferOffset: offset tessellationFactorBufferInstanceStride: instanceStride];
  }
}

NAN_METHOD(NMTLIndirectRenderCommand::drawIndexedPatchesPatchStartPatchCountPatchIndexBufferPatchIndexBufferOffsetControlPointIndexBufferControlPointIndexBufferOffsetInstanceCountBaseInstanceTessellationFactorBufferTessellationFactorBufferOffsetTessellationFactorBufferInstanceStride) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
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
    declare_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, instanceStride);
    [self drawIndexedPatches: numberOfPatchControlPoints patchStart: patchStart patchCount: patchCount patchIndexBuffer: patchIndexBuffer patchIndexBufferOffset: patchIndexBufferOffset controlPointIndexBuffer: controlPointIndexBuffer controlPointIndexBufferOffset: controlPointIndexBufferOffset instanceCount: instanceCount baseInstance: baseInstance tessellationFactorBuffer: buffer tessellationFactorBufferOffset: offset tessellationFactorBufferInstanceStride: instanceStride];
  }
}

#include "NMTLRenderCommandEncoder.h"

NAN_METHOD(NMTLIndirectRenderCommand::drawPrimitivesVertexStartVertexCountInstanceCountBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
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

#include "NMTLStageInputOutputDescriptor.h"

NAN_METHOD(NMTLIndirectRenderCommand::drawIndexedPrimitivesIndexCountIndexTypeIndexBufferIndexBufferOffsetInstanceCountBaseVertexBaseInstance) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
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

NAN_METHOD(NMTLIndirectRenderCommand::reset) {
  JS_UNWRAP_PROTOCOL(MTLIndirectRenderCommand, self);
  declare_autoreleasepool {
    [self reset];
  }
}

