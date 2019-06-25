//
//  NMTLComputeCommandEncoder.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLComputeCommandEncoder_h
#define NMTLComputeCommandEncoder_h    

#include "NMTLCommandEncoder.h"

#define js_value_MTLComputeCommandEncoder(x) js_protocol_wrapper(x, MTLComputeCommandEncoder)
#define to_value_MTLComputeCommandEncoder(x) to_protocol_wrapper(x, MTLComputeCommandEncoder)
#define is_value_MTLComputeCommandEncoder(x) is_protocol_wrapper(x, MTLComputeCommandEncoder)

JS_WRAP_PROTOCOL(MTLComputeCommandEncoder, MTLCommandEncoder);
  JS_METHOD(setComputePipelineState);
  JS_METHOD(setBytesLengthAtIndex);
  JS_METHOD(setBufferWithOffsetAtIndex);
  JS_METHOD(setBufferOffsetAtIndex);
  JS_METHOD(setBuffersOffsetsWithRange);
  JS_METHOD(setTextureAtIndex);
  JS_METHOD(setTexturesWithRange);
  JS_METHOD(setSamplerStateAtIndex);
  JS_METHOD(setSamplerStatesWithRange);
  JS_METHOD(setSamplerStateLodMinClampLodMaxClampAtIndex);
  JS_METHOD(setSamplerStatesLodMinClampsLodMaxClampsWithRange);
  JS_METHOD(setThreadgroupMemoryLengthAtIndex);
  JS_METHOD(setImageblockWidthHeight);
  JS_METHOD(setStageInRegion);
  JS_METHOD(setStageInRegionWithIndirectBufferIndirectBufferOffset);
  JS_METHOD(dispatchThreadgroupsThreadsPerThreadgroup);
  JS_METHOD(dispatchThreadgroupsWithIndirectBufferIndirectBufferOffsetThreadsPerThreadgroup);
  JS_METHOD(dispatchThreadsThreadsPerThreadgroup);
  JS_METHOD(updateFence);
  JS_METHOD(waitForFence);
  JS_METHOD(useResourceUsage);
  JS_METHOD(useResourcesCountUsage);
  JS_METHOD(useHeap);
  JS_METHOD(useHeapsCount);
  JS_METHOD(memoryBarrierWithScope);
  JS_METHOD(memoryBarrierWithResourcesCount);
  JS_PROP_READONLY(dispatchType);
JS_WRAP_PROTOCOL_END(MTLComputeCommandEncoder, MTLCommandEncoder);

#endif /* NMTLComputeCommandEncoder_h */
