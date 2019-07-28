//
//  NMTKModel.mm
//
//  Created by Shawn Presser on 7/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTKModel.h"


/*!
 @group MTKModelFunctions
 */

#include "NMTLVertexDescriptor.h"
#include "NMDLVertexDescriptor.h"

/*!
 @function MTKModelIOVertexDescriptorFromMetal
 @abstract Partially converts a Metal vertex descriptor to a Model I/O vertex descriptor
 @discussion This method can only set vertex format, offset, bufferIndex, and stride information in the produced Model I/O vertex descriptor.  It does not add any semantic information such at attributes names.  Names must be set in the returned Model I/O vertex descriptor before it can be applied to a a Model I/O mesh.
 */
//MTK_EXTERN MDLVertexDescriptor* __nonnull MTKModelIOVertexDescriptorFromMetal(MTLVertexDescriptor* __nonnull metalDescriptor) NS_AVAILABLE(10_11, 9_0);
NAN_METHOD(MTKModelIOVertexDescriptorFromMetal) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLVertexDescriptor, modelIODescriptor);
    JS_SET_RETURN(js_value_MDLVertexDescriptor(::MTKModelIOVertexDescriptorFromMetal(modelIODescriptor)));
  }
}

/*!
 @function MTKModelIOVertexDescriptorFromMetalWithError
 @abstract Partially converts a Metal vertex descriptor to a Model I/O vertex descriptor
 @discussion This method can only set vertex format, offset, bufferIndex, and stride information in the produced Model I/O vertex descriptor.  It does not add any semantic information such at attributes names.  Names must be set in the returned Model I/O vertex descriptor before it can be applied to a a Model I/O mesh. If error is nonnull, and the conversion cannot be made, it will be set.
 */
/*
MTK_EXTERN MDLVertexDescriptor* __nonnull MTKModelIOVertexDescriptorFromMetalWithError(MTLVertexDescriptor* __nonnull metalDescriptor, NSError * __nullable * __nullable error) NS_AVAILABLE(10_12, 10_0);
*/
NAN_METHOD(MTKModelIOVertexDescriptorFromMetalWithError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MTLVertexDescriptor, modelIODescriptor);
    declare_error();
    JS_SET_RETURN(js_value_MDLVertexDescriptor(::MTKModelIOVertexDescriptorFromMetalWithError(modelIODescriptor, &error)));
    js_panic_NSError(error);
  }
}

/*!
 @function MTKMetalVertexDescriptorFromModelIO
 @abstract Partially converts a Model I/O vertex descriptor to a Metal vertex descriptor
 @discussion This method can only set vertex format, offset, bufferIndex, and stride information in the produced Metal vertex descriptor. It simply copies attributes 1 for 1. Thus attributes in the given Model I/O vertex descriptor must be arranged in the correct order for the resulting descriptor to properly map mesh data to vertex shader inputs.  Layout stepFunction and stepRates for the resulting MTLVertexDescriptor must also be set by application.
 */
/*
MTK_EXTERN MTLVertexDescriptor* __nullable MTKMetalVertexDescriptorFromModelIO(MDLVertexDescriptor* __nonnull modelIODescriptor) NS_AVAILABLE(10_11, 9_0);
*/
NAN_METHOD(MTKMetalVertexDescriptorFromModelIO) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLVertexDescriptor, modelIODescriptor);
    JS_SET_RETURN(js_value_MTLVertexDescriptor(::MTKMetalVertexDescriptorFromModelIO(modelIODescriptor)));
  }
}

/*!
 @function MTKMetalVertexDescriptorFromModelIOWithError
 @abstract Partially converts a Model I/O vertex descriptor to a Metal vertex descriptor
 @discussion This method can only set vertex format, offset, bufferIndex, and stride information in the produced Metal vertex descriptor. It simply copies attributes 1 for 1. Thus attributes in the given Model I/O vertex descriptor must be arranged in the correct order for the resulting descriptor to properly map mesh data to vertex shader inputs.  Layout stepFunction and stepRates for the resulting MTLVertexDescriptor must also be set by application.  If error is nonnull, and the conversion cannot be made, it will be set.
 */
/*
MTK_EXTERN MTLVertexDescriptor* __nullable MTKMetalVertexDescriptorFromModelIOWithError(MDLVertexDescriptor* __nonnull modelIODescriptor, NSError * __nullable * __nullable error) NS_AVAILABLE(10_12, 10_0);
*/
NAN_METHOD(MTKMetalVertexDescriptorFromModelIOWithError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MDLVertexDescriptor, modelIODescriptor);
    declare_error();
    JS_SET_RETURN(js_value_MTLVertexDescriptor(::MTKMetalVertexDescriptorFromModelIOWithError(modelIODescriptor, &error)));
    js_panic_NSError(error);
  }
}

/*!
 @function MTKModelIOVertexFormatFromMetal
 @abstract Converts a Metal vertex format to a Model I/O vertex format
 @return A Model I/O vertexformat correspoinding to the given Metal vertex format.  Returns MDLVertexFormatInvalid if no matching Model I/O vertex format exists.
 */
/*
MTK_EXTERN MDLVertexFormat MTKModelIOVertexFormatFromMetal(MTLVertexFormat vertexFormat) NS_AVAILABLE(10_11, 9_0);
*/
NAN_METHOD(MTKModelIOVertexFormatFromMetal) {
  declare_autoreleasepool {
    declare_args();
    declare_value(MTLVertexFormat, vertexFormat);
    JS_SET_RETURN(js_value_MDLVertexFormat(::MTKModelIOVertexFormatFromMetal(vertexFormat)));
  }
}

/*!
@function MTKMetalVertexFormatFromModelIO
@abstract Converts a Model I/O vertex format to a Metal vertex format
@return A Metal vertexformat correspoinding to the given Model I/O vertex format.  Returns MTLVertexFormatInvalid if no matching Metal vertex format exists.
*/
/*
MTK_EXTERN MTLVertexFormat MTKMetalVertexFormatFromModelIO(MDLVertexFormat vertexFormat) NS_AVAILABLE(10_11, 9_0);
*/
NAN_METHOD(MTKMetalVertexFormatFromModelIO) {
  declare_autoreleasepool {
    declare_args();
    declare_value(MDLVertexFormat, vertexFormat);
    JS_SET_RETURN(js_value_MTLVertexFormat(::MTKMetalVertexFormatFromModelIO(vertexFormat)));
  }
}

JS_INIT_GLOBALS(MTKModel);
  JS_ASSIGN_GLOBAL_METHOD(MTKModelIOVertexDescriptorFromMetal);
  JS_ASSIGN_GLOBAL_METHOD(MTKModelIOVertexDescriptorFromMetalWithError);
  JS_ASSIGN_GLOBAL_METHOD(MTKMetalVertexDescriptorFromModelIO);
  JS_ASSIGN_GLOBAL_METHOD(MTKMetalVertexDescriptorFromModelIOWithError);
  JS_ASSIGN_GLOBAL_METHOD(MTKModelIOVertexFormatFromMetal);
  JS_ASSIGN_GLOBAL_METHOD(MTKMetalVertexFormatFromModelIO);
JS_INIT_GLOBALS_END(MTKModel);
