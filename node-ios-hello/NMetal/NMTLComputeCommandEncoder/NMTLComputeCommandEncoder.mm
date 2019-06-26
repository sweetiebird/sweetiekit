//
//  NMTLComputeCommandEncoder.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLComputeCommandEncoder.h"

#define instancetype MTLComputeCommandEncoder
#define js_value_instancetype js_value_MTLComputeCommandEncoder

NMTLComputeCommandEncoder::NMTLComputeCommandEncoder() {}
NMTLComputeCommandEncoder::~NMTLComputeCommandEncoder() {}

JS_INIT_PROTOCOL(MTLComputeCommandEncoder, MTLCommandEncoder);
  JS_ASSIGN_PROTO_METHOD(setComputePipelineState);
  JS_ASSIGN_PROTO_METHOD(setBytesLengthAtIndex);
  JS_ASSIGN_PROTO_METHOD(setBufferWithOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setBufferOffsetAtIndex);
  JS_ASSIGN_PROTO_METHOD(setBuffersOffsetsWithRange);
  JS_ASSIGN_PROTO_METHOD(setTextureAtIndex);
  JS_ASSIGN_PROTO_METHOD(setTexturesWithRange);
  JS_ASSIGN_PROTO_METHOD(setSamplerStateAtIndex);
  JS_ASSIGN_PROTO_METHOD(setSamplerStatesWithRange);
  JS_ASSIGN_PROTO_METHOD(setSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_ASSIGN_PROTO_METHOD(setSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_ASSIGN_PROTO_METHOD(setThreadgroupMemoryLengthAtIndex);
  JS_ASSIGN_PROTO_METHOD(setImageblockWidthHeight);
  JS_ASSIGN_PROTO_METHOD(setStageInRegion);
  JS_ASSIGN_PROTO_METHOD(setStageInRegionWithIndirectBufferIndirectBufferOffset);
  JS_ASSIGN_PROTO_METHOD(dispatchThreadgroupsThreadsPerThreadgroup);
  JS_ASSIGN_PROTO_METHOD(dispatchThreadgroupsWithIndirectBufferIndirectBufferOffsetThreadsPerThreadgroup);
  JS_ASSIGN_PROTO_METHOD(dispatchThreadsThreadsPerThreadgroup);
  JS_ASSIGN_PROTO_METHOD(updateFence);
  JS_ASSIGN_PROTO_METHOD(waitForFence);
  JS_ASSIGN_PROTO_METHOD(useResourceUsage);
  JS_ASSIGN_PROTO_METHOD(useResourcesCountUsage);
  JS_ASSIGN_PROTO_METHOD(useHeap);
  JS_ASSIGN_PROTO_METHOD(useHeapsCount);
  JS_ASSIGN_PROTO_METHOD(memoryBarrierWithScope);
  JS_ASSIGN_PROTO_METHOD(memoryBarrierWithResourcesCount);
  JS_ASSIGN_PROTO_PROP_READONLY(dispatchType);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLComputeCommandEncoder, MTLCommandEncoder);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLComputeCommandEncoder, MTLCommandEncoder);


NAN_METHOD(NMTLComputeCommandEncoder::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLComputeCommandEncoder);
  @autoreleasepool {
    id<MTLComputeCommandEncoder> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLComputeCommandEncoder>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLComputeCommandEncoder> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLComputeCommandEncoder, value);
      self = value;
    }
    if (self) {
      NMTLComputeCommandEncoder *wrapper = new NMTLComputeCommandEncoder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLComputeCommandEncoder::New: invalid arguments");
    }
  }
}

#include "NMTLComputePipelineState.h"

NAN_METHOD(NMTLComputeCommandEncoder::setComputePipelineState) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLComputePipelineState, state);
    [self setComputePipelineState: state];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setBytesLengthAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* bytes = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, index);
    [self setBytes: bytes length: length atIndex: index];
  }
}

#include "NMTLBuffer.h"

NAN_METHOD(NMTLComputeCommandEncoder::setBufferWithOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLBuffer, buffer);
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setBuffer: buffer offset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setBufferOffsetAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, offset);
    declare_value(NSUInteger, index);
    [self setBufferOffset: offset atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setBuffersOffsetsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLBuffer>__nullable-%brackets,__nonnull, buffers);
    declare_value(const-NSUInteger-%brackets,__nonnull, offsets);
    declare_value(NSRange, range);
    [self setBuffers: buffers offsets: offsets withRange: range];
    #endif
  }
}

#include "NMTLTexture.h"

NAN_METHOD(NMTLComputeCommandEncoder::setTextureAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLTexture, texture);
    declare_value(NSUInteger, index);
    [self setTexture: texture atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setTexturesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLTexture>__nullable-%brackets,__nonnull, textures);
    declare_value(NSRange, range);
    [self setTextures: textures withRange: range];
    #endif
  }
}

#include "NMTLSamplerState.h"

NAN_METHOD(NMTLComputeCommandEncoder::setSamplerStateAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(NSUInteger, index);
    [self setSamplerState: sampler atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setSamplerStatesWithRange) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLSamplerState>__nullable-%brackets,__nonnull, samplers);
    declare_value(NSRange, range);
    [self setSamplerStates: samplers withRange: range];
    #endif
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setSamplerStateLodMinClampLodMaxClampAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_protocol(MTLSamplerState, sampler);
    declare_value(float, lodMinClamp);
    declare_value(float, lodMaxClamp);
    declare_value(NSUInteger, index);
    [self setSamplerState: sampler lodMinClamp: lodMinClamp lodMaxClamp: lodMaxClamp atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setSamplerStatesLodMinClampsLodMaxClampsWithRange) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLSamplerState>__nullable-%brackets,__nonnull, samplers);
    declare_value(const-float-%brackets,__nonnull, lodMinClamps);
    declare_value(const-float-%brackets,__nonnull, lodMaxClamps);
    declare_value(NSRange, range);
    [self setSamplerStates: samplers lodMinClamps: lodMinClamps lodMaxClamps: lodMaxClamps withRange: range];
    #endif
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setThreadgroupMemoryLengthAtIndex) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, length);
    declare_value(NSUInteger, index);
    [self setThreadgroupMemoryLength: length atIndex: index];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setImageblockWidthHeight) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, width);
    declare_value(NSUInteger, height);
    [self setImageblockWidth: width height: height];
  }
}

#include "NMTLTypes.h"

NAN_METHOD(NMTLComputeCommandEncoder::setStageInRegion) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLRegion, region);
    [self setStageInRegion: region];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::setStageInRegionWithIndirectBufferIndirectBufferOffset) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    [self setStageInRegionWithIndirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::dispatchThreadgroupsThreadsPerThreadgroup) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLSize, threadgroupsPerGrid);
    declare_value(MTLSize, threadsPerThreadgroup);
    [self dispatchThreadgroups: threadgroupsPerGrid threadsPerThreadgroup: threadsPerThreadgroup];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::dispatchThreadgroupsWithIndirectBufferIndirectBufferOffsetThreadsPerThreadgroup) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLBuffer, indirectBuffer);
    declare_value(NSUInteger, indirectBufferOffset);
    declare_value(MTLSize, threadsPerThreadgroup);
    [self dispatchThreadgroupsWithIndirectBuffer: indirectBuffer indirectBufferOffset: indirectBufferOffset threadsPerThreadgroup: threadsPerThreadgroup];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::dispatchThreadsThreadsPerThreadgroup) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLSize, threadsPerGrid);
    declare_value(MTLSize, threadsPerThreadgroup);
    [self dispatchThreads: threadsPerGrid threadsPerThreadgroup: threadsPerThreadgroup];
  }
}

#include "NMTLFence.h"

NAN_METHOD(NMTLComputeCommandEncoder::updateFence) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFence, fence);
    [self updateFence: fence];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::waitForFence) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFence, fence);
    [self waitForFence: fence];
  }
}

#include "NMTLResource.h"

NAN_METHOD(NMTLComputeCommandEncoder::useResourceUsage) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLResource, resource);
    declare_value(MTLResourceUsage, usage);
    [self useResource: resource usage: usage];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::useResourcesCountUsage) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLResource>__nonnull-%brackets,__nonnull, resources);
    declare_value(NSUInteger, count);
    declare_value(MTLResourceUsage, usage);
    [self useResources: resources count: count usage: usage];
    #endif
  }
}

#include "NMTLHeap.h"

NAN_METHOD(NMTLComputeCommandEncoder::useHeap) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLHeap, heap);
    [self useHeap: heap];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::useHeapsCount) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLHeap>__nonnull-%brackets,__nonnull, heaps);
    declare_value(NSUInteger, count);
    [self useHeaps: heaps count: count];
    #endif
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::memoryBarrierWithScope) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLBarrierScope, scope);
    [self memoryBarrierWithScope: scope];
  }
}

NAN_METHOD(NMTLComputeCommandEncoder::memoryBarrierWithResourcesCount) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(const-id<MTLResource>__nonnull-%brackets,__nonnull, resources);
    declare_value(NSUInteger, count);
    [self memoryBarrierWithResources: resources count: count];
    #endif
  }
}

#include "NMTLCommandBuffer.h"

NAN_GETTER(NMTLComputeCommandEncoder::dispatchTypeGetter) {
  JS_UNWRAP_PROTOCOL(MTLComputeCommandEncoder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDispatchType([self dispatchType]));
  }
}

