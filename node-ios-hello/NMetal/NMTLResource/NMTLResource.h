//
//  NMTLResource.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLResource_h
#define NMTLResource_h    

#include "NNSObject.h"

#define js_value_MTLResource(x) js_protocol_wrapper(x, MTLResource)
#define to_value_MTLResource(x) to_protocol_wrapper(x, MTLResource)
#define is_value_MTLResource(x) is_protocol_wrapper(x, MTLResource)

#define js_value_MTLPurgeableState(x) JS_ENUM(MTLPurgeableState, NSUInteger, x)
#define to_value_MTLPurgeableState(x) TO_ENUM(MTLPurgeableState, NSUInteger, x)
#define is_value_MTLPurgeableState(x) IS_ENUM(MTLPurgeableState, NSUInteger, x)

#define js_value_MTLCPUCacheMode(x) JS_ENUM(MTLCPUCacheMode, NSUInteger, x)
#define to_value_MTLCPUCacheMode(x) TO_ENUM(MTLCPUCacheMode, NSUInteger, x)
#define is_value_MTLCPUCacheMode(x) IS_ENUM(MTLCPUCacheMode, NSUInteger, x)

#define js_value_MTLStorageMode(x) JS_ENUM(MTLStorageMode, NSUInteger, x)
#define to_value_MTLStorageMode(x) TO_ENUM(MTLStorageMode, NSUInteger, x)
#define is_value_MTLStorageMode(x) IS_ENUM(MTLStorageMode, NSUInteger, x)

#define js_value_MTLHazardTrackingMode(x) JS_ENUM(MTLHazardTrackingMode, NSUInteger, x)
#define to_value_MTLHazardTrackingMode(x) TO_ENUM(MTLHazardTrackingMode, NSUInteger, x)
#define is_value_MTLHazardTrackingMode(x) IS_ENUM(MTLHazardTrackingMode, NSUInteger, x)

#define js_value_MTLResourceOptions(x) JS_ENUM(MTLResourceOptions, NSUInteger, x)
#define to_value_MTLResourceOptions(x) TO_ENUM(MTLResourceOptions, NSUInteger, x)
#define is_value_MTLResourceOptions(x) IS_ENUM(MTLResourceOptions, NSUInteger, x)

JS_WRAP_PROTOCOL(MTLResource, NSObject);
  JS_METHOD(setPurgeableState);
  JS_METHOD(makeAliasable);
  JS_METHOD(isAliasable);
  JS_PROP(label);
  JS_PROP_READONLY(device);
  JS_PROP_READONLY(cpuCacheMode);
  JS_PROP_READONLY(storageMode);
  JS_PROP_READONLY(heap);
  JS_PROP_READONLY(allocatedSize);
JS_WRAP_PROTOCOL_END(MTLResource, NSObject);

#endif /* NMTLResource_h */
