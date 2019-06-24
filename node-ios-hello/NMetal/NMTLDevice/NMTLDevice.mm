//
//  NMTLDevice.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLDevice.h"

#define instancetype MTLDevice
#define js_value_instancetype js_value_MTLDevice

#import <Metal/MTLDevice.h>

Local<Value> js_value_MTLSizeAndAlign(const MTLSizeAndAlign& value) {
  Nan::EscapableHandleScope scope;
  Local<Object> result(Object::New(JS_ISOLATE()));
  result->Set(JS_STR("size"), js_value_NSUInteger(value.size));
  result->Set(JS_STR("align"), js_value_NSUInteger(value.align));
  return scope.Escape(result);
}

MTLSizeAndAlign to_value_MTLSizeAndAlign(const Local<Value>& value, bool * _Nullable failed) {
  MTLSizeAndAlign result;
  result.size = 0;
  result.align = 0;
  if (failed) {
    *failed = false;
  }
  if (!is_value_MTLSizeAndAlign(value)) {
    if (failed) {
      *failed = true;
    } else {
      Nan::ThrowError("Expected CGColor");
    }
    return result;
  }
  result.size = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("size")));
  result.align = to_value_NSUInteger(JS_OBJ(value)->Get(JS_STR("align")));
  return result;
}

bool is_value_MTLSizeAndAlign(const Local<Value>& value)
{
  if (!value->IsObject()) {
    return false;
  }
  auto obj(JS_OBJ(value));
  if (!is_value_NSUInteger(obj->Get(JS_STR("size")))) {
    return false;
  }
  if (!is_value_NSUInteger(obj->Get(JS_STR("align")))) {
    return false;
  }
  return true;
}

NMTLDevice::NMTLDevice() {}
NMTLDevice::~NMTLDevice() {}

JS_INIT_PROTOCOL(MTLDevice, NSObject);
  JS_ASSIGN_PROTO_METHOD(newCommandQueue);
  JS_ASSIGN_PROTO_METHOD(newCommandQueueWithMaxCommandBufferCount);
  JS_ASSIGN_PROTO_METHOD(heapTextureSizeAndAlignWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(heapBufferSizeAndAlignWithLengthOptions);
  JS_ASSIGN_PROTO_METHOD(newHeapWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(newBufferWithLengthOptions);
  JS_ASSIGN_PROTO_METHOD(newBufferWithBytesLengthOptions);
  JS_ASSIGN_PROTO_METHOD(newBufferWithBytesNoCopyLengthOptionsDeallocator);
  JS_ASSIGN_PROTO_METHOD(newDepthStencilStateWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(newTextureWithDescriptor);
#if !TARGET_OS_SIMULATOR
  JS_ASSIGN_PROTO_METHOD(newTextureWithDescriptorIosurfacePlane);
#endif
  JS_ASSIGN_PROTO_METHOD(newSamplerStateWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(newDefaultLibrary);
  JS_ASSIGN_PROTO_METHOD(newDefaultLibraryWithBundleError);
  JS_ASSIGN_PROTO_METHOD(newLibraryWithFileError);
  JS_ASSIGN_PROTO_METHOD(newLibraryWithURLError);
  JS_ASSIGN_PROTO_METHOD(newLibraryWithDataError);
  JS_ASSIGN_PROTO_METHOD(newLibraryWithSourceOptionsError);
  JS_ASSIGN_PROTO_METHOD(newLibraryWithSourceOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithDescriptorError);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithDescriptorOptionsReflectionError);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithDescriptorCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithDescriptorOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithFunctionError);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithFunctionOptionsReflectionError);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithFunctionCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithFunctionOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithDescriptorOptionsReflectionError);
  JS_ASSIGN_PROTO_METHOD(newComputePipelineStateWithDescriptorOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(newFence);
  JS_ASSIGN_PROTO_METHOD(supportsFeatureSet);
  JS_ASSIGN_PROTO_METHOD(supportsTextureSampleCount);
  JS_ASSIGN_PROTO_METHOD(minimumLinearTextureAlignmentForPixelFormat);
  JS_ASSIGN_PROTO_METHOD(minimumTextureBufferAlignmentForPixelFormat);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithTileDescriptorOptionsReflectionError);
  JS_ASSIGN_PROTO_METHOD(newRenderPipelineStateWithTileDescriptorOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(getDefaultSamplePositionsCount);
  JS_ASSIGN_PROTO_METHOD(newArgumentEncoderWithArguments);
  JS_ASSIGN_PROTO_METHOD(newIndirectCommandBufferWithDescriptorMaxCommandCountOptions);
  JS_ASSIGN_PROTO_METHOD(newEvent);
  JS_ASSIGN_PROTO_METHOD(newSharedEvent);
  JS_ASSIGN_PROTO_METHOD(newSharedEventWithHandle);
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(registryID);
  JS_ASSIGN_PROTO_PROP_READONLY(maxThreadsPerThreadgroup);
#if !TARGET_OS_IPHONE
  JS_ASSIGN_PROTO_PROP_READONLY(isLowPower);
  JS_ASSIGN_PROTO_PROP_READONLY(isHeadless);
  JS_ASSIGN_PROTO_PROP_READONLY(isRemovable);
  JS_ASSIGN_PROTO_PROP_READONLY(recommendedMaxWorkingSetSize);
  JS_ASSIGN_PROTO_PROP_READONLY(isDepth24Stencil8PixelFormatSupported);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(readWriteTextureSupport);
  JS_ASSIGN_PROTO_PROP_READONLY(argumentBuffersSupport);
  JS_ASSIGN_PROTO_PROP_READONLY(areRasterOrderGroupsSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(currentAllocatedSize);
  JS_ASSIGN_PROTO_PROP_READONLY(maxThreadgroupMemoryLength);
  JS_ASSIGN_PROTO_PROP_READONLY(maxArgumentBufferSamplerCount);
  JS_ASSIGN_PROTO_PROP_READONLY(areProgrammableSamplePositionsSupported);
  JS_ASSIGN_PROTO_PROP_READONLY(maxBufferLength);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLDevice, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(MTLDevice, NSObject);

NAN_METHOD(NMTLDevice::New) {
  JS_RECONSTRUCT(MTLDevice);
  @autoreleasepool {
    id<MTLDevice> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLDevice>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLDevice> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLDevice, value);
      self = value;
    }
    if (self) {
      NMTLDevice *wrapper = new NMTLDevice();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLDevice::New: invalid arguments");
    }
  }
}

#include "NMTLCommandQueue.h"

NAN_METHOD(NMTLDevice::newCommandQueue) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCommandQueue([self newCommandQueue]));
  }
}

NAN_METHOD(NMTLDevice::newCommandQueueWithMaxCommandBufferCount) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, maxCommandBufferCount);
    JS_SET_RETURN(js_value_MTLCommandQueue([self newCommandQueueWithMaxCommandBufferCount: maxCommandBufferCount]));
  }
}

#include "NMTLTextureDescriptor.h"

NAN_METHOD(NMTLDevice::heapTextureSizeAndAlignWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTextureDescriptor, desc);
    JS_SET_RETURN(js_value_MTLSizeAndAlign([self heapTextureSizeAndAlignWithDescriptor: desc]));
  }
}

#include "NMTLResource.h"

NAN_METHOD(NMTLDevice::heapBufferSizeAndAlignWithLengthOptions) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, length);
    declare_value(MTLResourceOptions, options);
    JS_SET_RETURN(js_value_MTLSizeAndAlign([self heapBufferSizeAndAlignWithLength: length options: options]));
  }
}

#include "NMTLHeap.h"
#include "NMTLHeapDescriptor.h"

NAN_METHOD(NMTLDevice::newHeapWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLHeapDescriptor, descriptor);
    JS_SET_RETURN(js_value_MTLHeap([self newHeapWithDescriptor: descriptor]));
  }
}

#include "NMTLBuffer.h"

NAN_METHOD(NMTLDevice::newBufferWithLengthOptions) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, length);
    declare_value(MTLResourceOptions, options);
    JS_SET_RETURN(js_value_MTLBuffer([self newBufferWithLength: length options: options]));
  }
}

NAN_METHOD(NMTLDevice::newBufferWithBytesLengthOptions) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    const void* pointer = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (const void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(MTLResourceOptions, options);
    JS_SET_RETURN(js_value_MTLBuffer([self newBufferWithBytes: pointer length: length options: options]));
  }
}

NAN_METHOD(NMTLDevice::newBufferWithBytesNoCopyLengthOptionsDeallocator) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    void* pointer = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (void*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, length);
    declare_value(MTLResourceOptions, options);
    declare_callback(deallocator);
    JS_SET_RETURN(js_value_MTLBuffer([self newBufferWithBytesNoCopy: pointer length: length options: options deallocator:^(void * _Nonnull pointer, NSUInteger length) {
      dispatch_main(^{
        if (deallocator) {
          [deallocator jsFunction]->Call("NMTLDevice::newBufferWithBytesNoCopyLengthOptionsDeallocator",
            js_value_size_t((size_t)pointer),
            js_value_NSUInteger(length));
        }
      });
    }]));
  }
}

#include "NMTLDepthStencilDescriptor.h"
#include "NMTLDepthStencilState.h"

NAN_METHOD(NMTLDevice::newDepthStencilStateWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLDepthStencilDescriptor, descriptor);
    JS_SET_RETURN(js_value_MTLDepthStencilState([self newDepthStencilStateWithDescriptor: descriptor]));
  }
}

#include "NMTLTexture.h"

NAN_METHOD(NMTLDevice::newTextureWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTextureDescriptor, descriptor);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureWithDescriptor: descriptor]));
  }
}

#if !TARGET_OS_SIMULATOR
#include "NIOSurfaceRef.h"

NAN_METHOD(NMTLDevice::newTextureWithDescriptorIosurfacePlane) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTextureDescriptor, descriptor);
    declare_value(IOSurfaceRef, iosurface);
    declare_value(NSUInteger, plane);
    JS_SET_RETURN(js_value_MTLTexture([self newTextureWithDescriptor: descriptor iosurface: iosurface plane: plane]));
  }
}
#endif

#include "NMTLSamplerState.h"
#include "NMTLSamplerDescriptor.h"

NAN_METHOD(NMTLDevice::newSamplerStateWithDescriptor) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLSamplerDescriptor, descriptor);
    JS_SET_RETURN(js_value_MTLSamplerState([self newSamplerStateWithDescriptor: descriptor]));
  }
}

#include "NMTLLibrary.h"

NAN_METHOD(NMTLDevice::newDefaultLibrary) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLLibrary([self newDefaultLibrary]));
  }
}

#include "NNSBundle.h"

NAN_METHOD(NMTLDevice::newDefaultLibraryWithBundleError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSBundle, bundle);
    declare_error();
    JS_SET_RETURN(js_value_MTLLibrary([self newDefaultLibraryWithBundle: bundle error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NMTLDevice::newLibraryWithFileError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, filepath);
    declare_error();
    JS_SET_RETURN(js_value_MTLLibrary([self newLibraryWithFile: filepath error: &error]));
    js_panic_NSError(error);
  }
}

#include "NNSURL.h"

NAN_METHOD(NMTLDevice::newLibraryWithURLError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_error();
    JS_SET_RETURN(js_value_MTLLibrary([self newLibraryWithURL: url error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NMTLDevice::newLibraryWithDataError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(dispatch_data_t, data);
    declare_error();
    JS_SET_RETURN(js_value_MTLLibrary([self newLibraryWithData: data error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

#include "NMTLCompileOptions.h"

NAN_METHOD(NMTLDevice::newLibraryWithSourceOptionsError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, source);
    declare_nullable_pointer(MTLCompileOptions, options);
    declare_error();
    JS_SET_RETURN(js_value_MTLLibrary([self newLibraryWithSource: source options: options error: &error]));
    js_panic_NSError(error);
  }
}

#include "NNSError.h"

NAN_METHOD(NMTLDevice::newLibraryWithSourceOptionsCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, source);
    declare_nullable_pointer(MTLCompileOptions, options);
    declare_callback(completionHandler);
    [self newLibraryWithSource: source options: options completionHandler:^(id<MTLLibrary>  _Nullable library, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newLibraryWithSourceOptionsCompletionHandler",
            js_value_MTLLibrary(library),
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NMTLRenderPipelineState.h"
#include "NMTLRenderPipelineDescriptor.h"

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithDescriptorError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLRenderPipelineDescriptor, descriptor);
    declare_error();
    JS_SET_RETURN(js_value_MTLRenderPipelineState([self newRenderPipelineStateWithDescriptor: descriptor error: &error]));
    js_panic_NSError(error);
  }
}

#include "NMTLRenderPipelineReflection.h"

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithDescriptorOptionsReflectionError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(MTLRenderPipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_nullable_pointer(MTLRenderPipelineReflection, reflection_);
    MTLAutoreleasedRenderPipelineReflection reflection(reflection_);
    declare_error();
    JS_SET_RETURN(js_value_MTLRenderPipelineState([self newRenderPipelineStateWithDescriptor: descriptor options: options reflection: &reflection error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithDescriptorCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLRenderPipelineDescriptor, descriptor);
    declare_callback(completionHandler);
    [self newRenderPipelineStateWithDescriptor: descriptor completionHandler:^(id<MTLRenderPipelineState>  _Nullable renderPipelineState, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newRenderPipelineStateWithDescriptorCompletionHandler",
            js_value_MTLRenderPipelineState(renderPipelineState),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithDescriptorOptionsCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLRenderPipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_callback(completionHandler);
    [self newRenderPipelineStateWithDescriptor: descriptor options: options completionHandler:^(id<MTLRenderPipelineState>  _Nullable renderPipelineState, MTLRenderPipelineReflection * _Nullable reflection, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newRenderPipelineStateWithDescriptorOptionsCompletionHandler",
            js_value_MTLRenderPipelineState(renderPipelineState),
            js_value_MTLRenderPipelineReflection(reflection),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NMTLFunction.h"
#include "NMTLComputePipelineState.h"

NAN_METHOD(NMTLDevice::newComputePipelineStateWithFunctionError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFunction, computeFunction);
    declare_error();
    JS_SET_RETURN(js_value_MTLComputePipelineState([self newComputePipelineStateWithFunction: computeFunction error: &error]));
    js_panic_NSError(error);
  }
}

#include "NMTLComputePipelineReflection.h"
#include "NMTLComputePipelineState.h"

NAN_METHOD(NMTLDevice::newComputePipelineStateWithFunctionOptionsReflectionError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_protocol(MTLFunction, computeFunction);
    declare_value(MTLPipelineOption, options);
    declare_nullable_pointer(MTLComputePipelineReflection, reflection_);
    MTLAutoreleasedComputePipelineReflection reflection(reflection_);
    declare_error();
    JS_SET_RETURN(js_value_MTLComputePipelineState([self newComputePipelineStateWithFunction: computeFunction options: options reflection: reflection error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

NAN_METHOD(NMTLDevice::newComputePipelineStateWithFunctionCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFunction, computeFunction);
    declare_callback(completionHandler);
    [self newComputePipelineStateWithFunction: computeFunction completionHandler:^(id<MTLComputePipelineState>  _Nullable computePipelineState, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newComputePipelineStateWithFunctionCompletionHandler",
            js_value_MTLComputePipelineState(computePipelineState),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

NAN_METHOD(NMTLDevice::newComputePipelineStateWithFunctionOptionsCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_protocol(MTLFunction, computeFunction);
    declare_value(MTLPipelineOption, options);
    declare_callback(completionHandler);
    [self newComputePipelineStateWithFunction: computeFunction options: options completionHandler:^(id<MTLComputePipelineState>  _Nullable computePipelineState, MTLComputePipelineReflection * _Nullable reflection, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newComputePipelineStateWithFunctionOptionsCompletionHandler",
            js_value_MTLComputePipelineState(computePipelineState),
            js_value_MTLComputePipelineReflection(reflection),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NMTLComputePipelineDescriptor.h"

NAN_METHOD(NMTLDevice::newComputePipelineStateWithDescriptorOptionsReflectionError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(MTLComputePipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_nullable_pointer(MTLComputePipelineReflection, reflection_);
    MTLAutoreleasedComputePipelineReflection reflection(reflection_);
    declare_error();
    JS_SET_RETURN(js_value_MTLComputePipelineState([self newComputePipelineStateWithDescriptor: descriptor options: options reflection: reflection error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

NAN_METHOD(NMTLDevice::newComputePipelineStateWithDescriptorOptionsCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLComputePipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_callback(completionHandler);
    [self newComputePipelineStateWithDescriptor: descriptor options: options completionHandler:^(id<MTLComputePipelineState>  _Nullable computePipelineState, MTLComputePipelineReflection * _Nullable reflection, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newComputePipelineStateWithDescriptorOptionsCompletionHandler",
            js_value_MTLComputePipelineState(computePipelineState),
            js_value_MTLComputePipelineReflection(reflection),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NMTLFence.h"

NAN_METHOD(NMTLDevice::newFence) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLFence([self newFence]));
  }
}

NAN_METHOD(NMTLDevice::supportsFeatureSet) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLFeatureSet, featureSet);
    JS_SET_RETURN(js_value_BOOL([self supportsFeatureSet: featureSet]));
  }
}

NAN_METHOD(NMTLDevice::supportsTextureSampleCount) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, sampleCount);
    JS_SET_RETURN(js_value_BOOL([self supportsTextureSampleCount: sampleCount]));
  }
}

#include "NMTLPixelFormat.h"

NAN_METHOD(NMTLDevice::minimumLinearTextureAlignmentForPixelFormat) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, format);
    JS_SET_RETURN(js_value_NSUInteger([self minimumLinearTextureAlignmentForPixelFormat: format]));
  }
}

NAN_METHOD(NMTLDevice::minimumTextureBufferAlignmentForPixelFormat) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPixelFormat, format);
    JS_SET_RETURN(js_value_NSUInteger([self minimumTextureBufferAlignmentForPixelFormat: format]));
  }
}

#include "NMTLTileRenderPipelineDescriptor.h"

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithTileDescriptorOptionsReflectionError) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(MTLTileRenderPipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_nullable_pointer(MTLComputePipelineReflection, reflection_);
    MTLAutoreleasedComputePipelineReflection reflection(reflection_);
    declare_error();
    JS_SET_RETURN(js_value_MTLRenderPipelineState([self newRenderPipelineStateWithTileDescriptor: descriptor options: options reflection: reflection error: &error]));
    js_panic_NSError(error);
    #endif
  }
}

NAN_METHOD(NMTLDevice::newRenderPipelineStateWithTileDescriptorOptionsCompletionHandler) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLTileRenderPipelineDescriptor, descriptor);
    declare_value(MTLPipelineOption, options);
    declare_callback(completionHandler);
    [self newRenderPipelineStateWithTileDescriptor: descriptor options: options completionHandler:^(id<MTLRenderPipelineState>  _Nullable renderPipelineState, MTLRenderPipelineReflection * _Nullable reflection, NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NMTLDevice::newRenderPipelineStateWithTileDescriptorOptionsCompletionHandler",
            js_value_MTLRenderPipelineState(renderPipelineState),
            js_value_MTLRenderPipelineReflection(reflection),
            js_value_NSError(error));
          clear_callback(completionHandler);
        }
      });
    }];
  }
}

#include "NMTLTypes.h"

NAN_METHOD(NMTLDevice::getDefaultSamplePositionsCount) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    auto data_argument_index(JS_ARGC++);
    if (info[data_argument_index]->IsNullOrUndefined() || !info[data_argument_index]->IsArrayBuffer())
      JS_PANIC("Expected arg[%u] to be an ArrayBuffer", data_argument_index);
    MTLSamplePosition* positions = info[data_argument_index]->IsNullOrUndefined() ? nullptr : (MTLSamplePosition*)(Local<ArrayBuffer>::Cast(info[data_argument_index]))->GetContents().Data();
    declare_value(NSUInteger, count);
    [self getDefaultSamplePositions: positions count: count];
  }
}

#include "NMTLArgumentDescriptor.h"
#include "NMTLArgumentEncoder.h"

NAN_METHOD(NMTLDevice::newArgumentEncoderWithArguments) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<MTLArgumentDescriptor*>, arguments);
    JS_SET_RETURN(js_value_MTLArgumentEncoder([self newArgumentEncoderWithArguments: arguments]));
  }
}

#include "NMTLIndirectCommandBuffer.h"
#include "NMTLIndirectCommandBufferDescriptor.h"

NAN_METHOD(NMTLDevice::newIndirectCommandBufferWithDescriptorMaxCommandCountOptions) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLIndirectCommandBufferDescriptor, descriptor);
    declare_value(NSUInteger, maxCount);
    declare_value(MTLResourceOptions, options);
    JS_SET_RETURN(js_value_MTLIndirectCommandBuffer([self newIndirectCommandBufferWithDescriptor: descriptor maxCommandCount: maxCount options: options]));
  }
}

#include "NMTLEvent.h"

NAN_METHOD(NMTLDevice::newEvent) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLEvent([self newEvent]));
  }
}

#include "NMTLSharedEvent.h"

NAN_METHOD(NMTLDevice::newSharedEvent) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSharedEvent([self newSharedEvent]));
  }
}

#include "NMTLSharedEventHandle.h"

NAN_METHOD(NMTLDevice::newSharedEventWithHandle) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLSharedEventHandle, sharedEventHandle);
    JS_SET_RETURN(js_value_MTLSharedEvent([self newSharedEventWithHandle: sharedEventHandle]));
  }
}

NAN_GETTER(NMTLDevice::nameGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NMTLDevice::registryIDGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint64_t([self registryID]));
  }
}

NAN_GETTER(NMTLDevice::maxThreadsPerThreadgroupGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLSize([self maxThreadsPerThreadgroup]));
  }
}

#if !TARGET_OS_IPHONE
NAN_GETTER(NMTLDevice::isLowPowerGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLowPower]));
  }
}

NAN_GETTER(NMTLDevice::isHeadlessGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHeadless]));
  }
}

NAN_GETTER(NMTLDevice::isRemovableGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRemovable]));
  }
}

NAN_GETTER(NMTLDevice::recommendedMaxWorkingSetSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint64_t([self recommendedMaxWorkingSetSize]));
  }
}

NAN_GETTER(NMTLDevice::isDepth24Stencil8PixelFormatSupportedGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDepth24Stencil8PixelFormatSupported]));
  }
}
#endif

NAN_GETTER(NMTLDevice::readWriteTextureSupportGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLReadWriteTextureTier([self readWriteTextureSupport]));
  }
}

NAN_GETTER(NMTLDevice::argumentBuffersSupportGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLArgumentBuffersTier([self argumentBuffersSupport]));
  }
}

NAN_GETTER(NMTLDevice::areRasterOrderGroupsSupportedGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self areRasterOrderGroupsSupported]));
  }
}

NAN_GETTER(NMTLDevice::currentAllocatedSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self currentAllocatedSize]));
  }
}

NAN_GETTER(NMTLDevice::maxThreadgroupMemoryLengthGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxThreadgroupMemoryLength]));
  }
}

NAN_GETTER(NMTLDevice::maxArgumentBufferSamplerCountGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxArgumentBufferSamplerCount]));
  }
}

NAN_GETTER(NMTLDevice::areProgrammableSamplePositionsSupportedGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self areProgrammableSamplePositionsSupported]));
  }
}

NAN_GETTER(NMTLDevice::maxBufferLengthGetter) {
  JS_UNWRAP_PROTOCOL(MTLDevice, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self maxBufferLength]));
  }
}
