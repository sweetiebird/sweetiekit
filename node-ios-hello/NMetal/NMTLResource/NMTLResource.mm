//
//  NMTLResource.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLResource.h"

#define instancetype MTLResource
#define js_value_instancetype js_value_MTLResource

#import <Metal/MTLResource.h>

NMTLResource::NMTLResource() {}
NMTLResource::~NMTLResource() {}

JS_INIT_PROTOCOL(MTLResource, NSObject);
  JS_ASSIGN_PROTO_METHOD(setPurgeableState);
  JS_ASSIGN_PROTO_METHOD(makeAliasable);
  JS_ASSIGN_PROTO_METHOD(isAliasable);
  JS_ASSIGN_PROTO_PROP(label);
  JS_ASSIGN_PROTO_PROP_READONLY(device);
  JS_ASSIGN_PROTO_PROP_READONLY(cpuCacheMode);
  JS_ASSIGN_PROTO_PROP_READONLY(storageMode);
  JS_ASSIGN_PROTO_PROP_READONLY(heap);
  JS_ASSIGN_PROTO_PROP_READONLY(allocatedSize);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MTLResource, NSObject);
  // constant values (exports)

  /*!
   @enum MTLPurgeableOption
   @abstract Options for setPurgeable call.
   
   @constant MTLPurgeableStateNonVolatile
   The contents of this resource may not be discarded.

   @constant MTLPurgeableStateVolatile
   The contents of this resource may be discarded.

   @constant MTLPurgeableStateEmpty
   The contents of this are discarded.
   
   @constant MTLPurgeableStateKeepCurrent
   The purgeabelity state is not changed.
   */

  //typedef NS_ENUM(NSUInteger, MTLPurgeableState) {
    JS_ASSIGN_ENUM(MTLPurgeableStateKeepCurrent, NSUInteger); // = 1,
    
    JS_ASSIGN_ENUM(MTLPurgeableStateNonVolatile, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLPurgeableStateVolatile, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLPurgeableStateEmpty, NSUInteger); // = 4,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  /*!
   @enum MTLCPUCacheMode
   @abstract Describes what CPU cache mode is used for the CPU's mapping of a texture resource.
   @constant MTLCPUCacheModeDefaultCache
   The default cache mode for the system.
   
   @constant MTLCPUCacheModeWriteCombined
   Write combined memory is optimized for resources that the CPU will write into, but never read.  On some implementations, writes may bypass caches avoiding cache pollution, and reads perform very poorly.
   
   @discussion
   Applications should only investigate changing the cache mode if writing to normally cached buffers is known to cause performance issues due to cache pollution, as write combined memory can have surprising performance pitfalls.  Another approach is to use non-temporal stores to normally cached memory (STNP on ARMv8, _mm_stream_* on x86_64).
   */

  //typedef NS_ENUM(NSUInteger, MTLCPUCacheMode) {
    JS_ASSIGN_ENUM(MTLCPUCacheModeDefaultCache, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLCPUCacheModeWriteCombined, NSUInteger); // = 1,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  /*!
   @enum MTLStorageMode
   @abstract Describes location and CPU mapping of MTLTexture.
   @constant MTLStorageModeShared
   In this mode, CPU and device will nominally both use the same underlying memory when accessing the contents of the texture resource.
   However, coherency is only guaranteed at command buffer boundaries to minimize the required flushing of CPU and GPU caches.
   This is the default storage mode for iOS Textures.

   @constant MTLStorageModeManaged
   This mode relaxes the coherency requirements and requires that the developer make explicit requests to maintain
   coherency between a CPU and GPU version of the texture resource.  In order for CPU to access up to date GPU results,
   first, a blit synchronizations must be completed (see synchronize methods of MTLBlitCommandEncoder).
   Blit overhead is only incurred if GPU has modified the resource.
   This is the default storage mode for OS X Textures.

   @constant MTLStorageModePrivate
   This mode allows the texture resource data to be kept entirely to GPU (or driver) private memory that will never be accessed by the CPU directly, so no
   conherency of any kind must be maintained.
   
   @constant MTLStorageModeMemoryless
   This mode allows creation of resources that do not have a GPU or CPU memory backing, but do have on-chip storage for TBDR
   devices. The contents of the on-chip storage is undefined and does not persist, but its configuration is controlled by the
   MTLTexture descriptor. Textures created with MTLStorageModeMemoryless dont have an IOAccelResource at any point in their
   lifetime. The only way to populate such resource is to perform rendering operations on it. Blit operations are disallowed.
  */

  //typedef NS_ENUM(NSUInteger, MTLStorageMode) {
    JS_ASSIGN_ENUM(MTLStorageModeShared, NSUInteger); //  = 0,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLStorageModeManaged, NSUInteger); // API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios) = 1,
#endif
    JS_ASSIGN_ENUM(MTLStorageModePrivate, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLStorageModeMemoryless, NSUInteger); // API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = 3,
  //} API_AVAILABLE(macos(10.11), ios(9.0));


  /*!
   @enum MTLResourceOptions
   @abstract A set of optional arguments to influence the creation of a MTLResource (MTLTexture or MTLBuffer)

   @constant MTLResourceCPUCacheModeDefault
   The default CPU cache mode for the resource.
   Applications should only investigate changing the cache mode if writing to normally cached buffers is known to
   cause performance issues due to cache pollution, as write combined memory can have surprising performance pitfalls.
   Another approach is to use non-temporal stores to normally cached memory (STNP on ARMv8, _mm_stream_* on x86_64).
   
   @constant MTLResourceCPUCacheModeWriteCombined
   Write combined memory is optimized for resources that the CPU will write into, but never read.
   On some implementations, writes may bypass caches avoiding cache pollution, and reads perform very poorly.
   
   @constant MTLResourceStorageModeShared
   In this mode, CPU and device will nominally both use the same underlying memory when accessing the contents of the resource.
   However, coherency is only guaranteed at command buffer boundaries to minimize the required flushing of CPU and GPU caches.
   This is the default storage mode for iOS Textures.

   @constant MTLResourceStorageModeManaged
   This mode relaxes the coherency requirements and requires that the developer make explicit requests to maintain
   coherency between a CPU and GPU version of the resource.  Changes due to CPU stores outside of the Metal API must be
   indicated to Metal via MTLBuffer::didModifyRange:(NSRange)range.  In order for CPU to access up to date GPU results,
   first, a blit synchronizations must be completed (see synchronize methods of MTLBlitCommandEncoder).
   Blit overhead is only incurred if GPU has modified the resource.
   This storage mode is only defined for OS X.
   This is the default storage mode for OS X Textures.

   @constant MTLResourceStorageModePrivate
   This mode allows the data to be kept entirely to GPU (or driver) private memory that will never be accessed by the CPU directly, so no
   conherency of any kind must be maintained.

   @constant MTLResourceStorageModeMemoryless
   This mode allows creation of resources that do not have a GPU or CPU memory backing, but do have on-chip storage for TBDR
   devices. The contents of the on-chip storage is undefined and does not persist, but its configuration is controlled by the
   MTLTexture descriptor. Textures created with MTLStorageModeMemoryless dont have an IOAccelResource at any point in their
   lifetime. The only way to populate such resource is to perform rendering operations on it. Blit operations are disallowed.
   
   @constant MTLResourceHazardTrackingModeUntracked
   In this mode, Command encoder dependencies for this resource are tracked manually with MTLFence.
   This value is always set for resources sub-allocated from a MTLHeap and may optionally be specified
   for non-heap resources.
   
   @discussion
   Note that resource options are a property of MTLTextureDescriptor (resourceOptions), so apply to texture creation.
   they are also passed directly into MTLBuffer creation methods.
  */

  JS_ASSIGN_ENUM(MTLResourceCPUCacheModeShift, NSUInteger); //            0
  JS_ASSIGN_ENUM(MTLResourceCPUCacheModeMask, NSUInteger); //             (0xfUL << MTLResourceCPUCacheModeShift)

  JS_ASSIGN_ENUM(MTLResourceStorageModeShift, NSUInteger); //             4
  JS_ASSIGN_ENUM(MTLResourceStorageModeMask, NSUInteger); //              (0xfUL << MTLResourceStorageModeShift)

  JS_ASSIGN_ENUM(MTLResourceHazardTrackingModeShift, NSUInteger); //      8
  JS_ASSIGN_ENUM(MTLResourceHazardTrackingModeMask, NSUInteger); //       (0x1UL << MTLResourceHazardTrackingModeShift)

  //typedef NS_OPTIONS(NSUInteger, MTLResourceOptions) {
    JS_ASSIGN_ENUM(MTLResourceCPUCacheModeDefaultCache, NSUInteger); //  = MTLCPUCacheModeDefaultCache  << MTLResourceCPUCacheModeShift,
    JS_ASSIGN_ENUM(MTLResourceCPUCacheModeWriteCombined, NSUInteger); // = MTLCPUCacheModeWriteCombined << MTLResourceCPUCacheModeShift,

    JS_ASSIGN_ENUM(MTLResourceStorageModeShared, NSUInteger); //     API_AVAILABLE(macos(10.11), ios(9.0))  = MTLStorageModeShared     << MTLResourceStorageModeShift,
#if !TARGET_OS_IPHONE
    JS_ASSIGN_ENUM(MTLResourceStorageModeManaged, NSUInteger); //    API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios)   = MTLStorageModeManaged    << MTLResourceStorageModeShift,
#endif
    JS_ASSIGN_ENUM(MTLResourceStorageModePrivate, NSUInteger); //    API_AVAILABLE(macos(10.11), ios(9.0))  = MTLStorageModePrivate    << MTLResourceStorageModeShift,
    JS_ASSIGN_ENUM(MTLResourceStorageModeMemoryless, NSUInteger); // API_AVAILABLE(ios(10.0)) API_UNAVAILABLE(macos) = MTLStorageModeMemoryless << MTLResourceStorageModeShift,

    JS_ASSIGN_ENUM(MTLResourceHazardTrackingModeUntracked, NSUInteger); // API_AVAILABLE(macos(10.13), ios(10.0)) = 0x1UL << MTLResourceHazardTrackingModeShift,
    
    // Deprecated spellings
    JS_ASSIGN_ENUM(MTLResourceOptionCPUCacheModeDefault, NSUInteger); //       = MTLResourceCPUCacheModeDefaultCache,
    JS_ASSIGN_ENUM(MTLResourceOptionCPUCacheModeWriteCombined, NSUInteger); // = MTLResourceCPUCacheModeWriteCombined,
  //} API_AVAILABLE(macos(10.11), ios(8.0));


JS_INIT_PROTOCOL_END(MTLResource, NSObject);

NAN_METHOD(NMTLResource::New) {
  JS_RECONSTRUCT_PROTOCOL(MTLResource);
  @autoreleasepool {
    id<MTLResource> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<MTLResource>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<MTLResource> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], MTLResource, value);
      self = value;
    }
    if (self) {
      NMTLResource *wrapper = new NMTLResource();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MTLResource::New: invalid arguments");
    }
  }
}

NAN_METHOD(NMTLResource::setPurgeableState) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLPurgeableState, state);
    JS_SET_RETURN(js_value_MTLPurgeableState([self setPurgeableState: state]));
  }
}

NAN_METHOD(NMTLResource::makeAliasable) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    [self makeAliasable];
  }
}

NAN_METHOD(NMTLResource::isAliasable) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAliasable]));
  }
}

NAN_GETTER(NMTLResource::labelGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self label]));
  }
}

NAN_SETTER(NMTLResource::labelSetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setLabel: input];
  }
}

#include "NMTLDevice.h"

NAN_GETTER(NMTLResource::deviceGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLDevice([self device]));
  }
}

NAN_GETTER(NMTLResource::cpuCacheModeGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLCPUCacheMode([self cpuCacheMode]));
  }
}

NAN_GETTER(NMTLResource::storageModeGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLStorageMode([self storageMode]));
  }
}

#include "NMTLHeap.h"

NAN_GETTER(NMTLResource::heapGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MTLHeap([self heap]));
  }
}

NAN_GETTER(NMTLResource::allocatedSizeGetter) {
  JS_UNWRAP_PROTOCOL(MTLResource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self allocatedSize]));
  }
}

