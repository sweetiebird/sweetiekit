//
//  NMDLTypes.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMDLTypes_h
#define NMDLTypes_h    

#include "NNSObject.h"

#define js_value_MDLTypes(x) js_value_wrapper(x, MDLTypes)
#define to_value_MDLTypes(x) to_value_wrapper(x, MDLTypes)
#define is_value_MDLTypes(x) is_value_wrapper(x, MDLTypes)

// ModelIO constants
#define js_value_MDLIndexBitDepth(x) JS_ENUM(MDLIndexBitDepth, NSUInteger, x)
#define to_value_MDLIndexBitDepth(x) TO_ENUM(MDLIndexBitDepth, NSUInteger, x)
#define is_value_MDLIndexBitDepth(x) IS_ENUM(MDLIndexBitDepth, NSUInteger, x)

#define js_value_MDLGeometryType(x) JS_ENUM(MDLGeometryType, NSInteger, x)
#define to_value_MDLGeometryType(x) TO_ENUM(MDLGeometryType, NSInteger, x)
#define is_value_MDLGeometryType(x) IS_ENUM(MDLGeometryType, NSInteger, x)

#define js_value_MDLProbePlacement(x) JS_ENUM(MDLProbePlacement, NSInteger, x)
#define to_value_MDLProbePlacement(x) TO_ENUM(MDLProbePlacement, NSInteger, x)
#define is_value_MDLProbePlacement(x) IS_ENUM(MDLProbePlacement, NSInteger, x)

#define js_value_MDLMeshBufferType(x) JS_ENUM(MDLMeshBufferType, NSUInteger, x)
#define to_value_MDLMeshBufferType(x) TO_ENUM(MDLMeshBufferType, NSUInteger, x)
#define is_value_MDLMeshBufferType(x) IS_ENUM(MDLMeshBufferType, NSUInteger, x)

/*
typedef struct MDL_CLASS_EXPORT {
    vector_float3 maxBounds;
    vector_float3 minBounds;
} MDLAxisAlignedBoundingBox;
*/

Local<Value> js_value_MDLAxisAlignedBoundingBox(const MDLAxisAlignedBoundingBox& value);
MDLAxisAlignedBoundingBox to_value_MDLAxisAlignedBoundingBox(Local<Value> value, bool* _Nullable failed = nullptr);
bool is_value_MDLAxisAlignedBoundingBox(Local<Value> value);

#ifdef __OBJC__
@interface MDLTypes : NSObject
@end
#endif

JS_WRAP_CLASS(MDLTypes, NSObject);
JS_WRAP_CLASS_END(MDLTypes);

#endif /* NMDLTypes_h */
