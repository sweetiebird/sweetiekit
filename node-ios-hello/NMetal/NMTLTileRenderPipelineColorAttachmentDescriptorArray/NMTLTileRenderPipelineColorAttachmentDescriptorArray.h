//
//  NMTLTileRenderPipelineColorAttachmentDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTileRenderPipelineColorAttachmentDescriptorArray_h
#define NMTLTileRenderPipelineColorAttachmentDescriptorArray_h    

#include "NNSObject.h"

#if !(TARGET_OS_MAC || TARGET_OS_UIKITFORMAC)

#define js_value_MTLTileRenderPipelineColorAttachmentDescriptorArray(x) js_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptorArray)
#define to_value_MTLTileRenderPipelineColorAttachmentDescriptorArray(x) to_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptorArray)
#define is_value_MTLTileRenderPipelineColorAttachmentDescriptorArray(x) is_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptorArray)

JS_WRAP_CLASS(MTLTileRenderPipelineColorAttachmentDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLTileRenderPipelineColorAttachmentDescriptorArray);

#endif

#endif /* NMTLTileRenderPipelineColorAttachmentDescriptorArray_h */
