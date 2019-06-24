//
//  NMTLDevice.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLDevice_h
#define NMTLDevice_h    

#include "NNSObject.h"

#define js_value_MTLDevice(x) js_protocol_wrapper(x, MTLDevice)
#define to_value_MTLDevice(x) to_protocol_wrapper(x, MTLDevice)
#define is_value_MTLDevice(x) is_protocol_wrapper(x, MTLDevice)

#define js_value_MTLFeatureSet(x) JS_ENUM(MTLFeatureSet, NSUInteger, x)
#define to_value_MTLFeatureSet(x) TO_ENUM(MTLFeatureSet, NSUInteger, x)
#define is_value_MTLFeatureSet(x) IS_ENUM(MTLFeatureSet, NSUInteger, x)

#define js_value_MTLPipelineOption(x) JS_ENUM(MTLPipelineOption, NSUInteger, x)
#define to_value_MTLPipelineOption(x) TO_ENUM(MTLPipelineOption, NSUInteger, x)
#define is_value_MTLPipelineOption(x) IS_ENUM(MTLPipelineOption, NSUInteger, x)

#define js_value_MTLReadWriteTextureTier(x) JS_ENUM(MTLReadWriteTextureTier, NSUInteger, x)
#define to_value_MTLReadWriteTextureTier(x) TO_ENUM(MTLReadWriteTextureTier, NSUInteger, x)
#define is_value_MTLReadWriteTextureTier(x) IS_ENUM(MTLReadWriteTextureTier, NSUInteger, x)

#define js_value_MTLArgumentBuffersTier(x) JS_ENUM(MTLArgumentBuffersTier, NSUInteger, x)
#define to_value_MTLArgumentBuffersTier(x) TO_ENUM(MTLArgumentBuffersTier, NSUInteger, x)
#define is_value_MTLArgumentBuffersTier(x) IS_ENUM(MTLArgumentBuffersTier, NSUInteger, x)

Local<Value> js_value_MTLSizeAndAlign(const MTLSizeAndAlign& value);
MTLSizeAndAlign to_value_MTLSizeAndAlign(const Local<Value>& value, bool * _Nullable failed = nullptr);
bool is_value_MTLSizeAndAlign(const Local<Value>& value);

JS_WRAP_PROTOCOL(MTLDevice, NSObject);
  // global functions
  JS_GLOBAL_METHOD(MTLCreateSystemDefaultDevice);
  JS_GLOBAL_METHOD(MTLCopyAllDevices);

// MTLDevice
  JS_METHOD(newCommandQueue);
  JS_METHOD(newCommandQueueWithMaxCommandBufferCount);
  JS_METHOD(heapTextureSizeAndAlignWithDescriptor);
  JS_METHOD(heapBufferSizeAndAlignWithLengthOptions);
  JS_METHOD(newHeapWithDescriptor);
  JS_METHOD(newBufferWithLengthOptions);
  JS_METHOD(newBufferWithBytesLengthOptions);
  JS_METHOD(newBufferWithBytesNoCopyLengthOptionsDeallocator);
  JS_METHOD(newDepthStencilStateWithDescriptor);
  JS_METHOD(newTextureWithDescriptor);
  JS_METHOD(newTextureWithDescriptorIosurfacePlane);
  JS_METHOD(newSamplerStateWithDescriptor);
  JS_METHOD(newDefaultLibrary);
  JS_METHOD(newDefaultLibraryWithBundleError);
  JS_METHOD(newLibraryWithFileError);
  JS_METHOD(newLibraryWithURLError);
  JS_METHOD(newLibraryWithDataError);
  JS_METHOD(newLibraryWithSourceOptionsError);
  JS_METHOD(newLibraryWithSourceOptionsCompletionHandler);
  JS_METHOD(newRenderPipelineStateWithDescriptorError);
  JS_METHOD(newRenderPipelineStateWithDescriptorOptionsReflectionError);
  JS_METHOD(newRenderPipelineStateWithDescriptorCompletionHandler);
  JS_METHOD(newRenderPipelineStateWithDescriptorOptionsCompletionHandler);
  JS_METHOD(newComputePipelineStateWithFunctionError);
  JS_METHOD(newComputePipelineStateWithFunctionOptionsReflectionError);
  JS_METHOD(newComputePipelineStateWithFunctionCompletionHandler);
  JS_METHOD(newComputePipelineStateWithFunctionOptionsCompletionHandler);
  JS_METHOD(newComputePipelineStateWithDescriptorOptionsReflectionError);
  JS_METHOD(newComputePipelineStateWithDescriptorOptionsCompletionHandler);
  JS_METHOD(newFence);
  JS_METHOD(supportsFeatureSet);
  JS_METHOD(supportsTextureSampleCount);
  JS_METHOD(minimumLinearTextureAlignmentForPixelFormat);
  JS_METHOD(minimumTextureBufferAlignmentForPixelFormat);
  JS_METHOD(newRenderPipelineStateWithTileDescriptorOptionsReflectionError);
  JS_METHOD(newRenderPipelineStateWithTileDescriptorOptionsCompletionHandler);
  JS_METHOD(getDefaultSamplePositionsCount);
  JS_METHOD(newArgumentEncoderWithArguments);
  JS_METHOD(newIndirectCommandBufferWithDescriptorMaxCommandCountOptions);
  JS_METHOD(newEvent);
  JS_METHOD(newSharedEvent);
  JS_METHOD(newSharedEventWithHandle);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(registryID);
  JS_PROP_READONLY(maxThreadsPerThreadgroup);
  JS_PROP_READONLY(isLowPower);
  JS_PROP_READONLY(isHeadless);
  JS_PROP_READONLY(isRemovable);
  JS_PROP_READONLY(recommendedMaxWorkingSetSize);
  JS_PROP_READONLY(isDepth24Stencil8PixelFormatSupported);
  JS_PROP_READONLY(readWriteTextureSupport);
  JS_PROP_READONLY(argumentBuffersSupport);
  JS_PROP_READONLY(areRasterOrderGroupsSupported);
  JS_PROP_READONLY(currentAllocatedSize);
  JS_PROP_READONLY(maxThreadgroupMemoryLength);
  JS_PROP_READONLY(maxArgumentBufferSamplerCount);
  JS_PROP_READONLY(areProgrammableSamplePositionsSupported);
  JS_PROP_READONLY(maxBufferLength);
JS_WRAP_PROTOCOL_END(MTLDevice, NSObject);

#endif /* NMTLDevice_h */
