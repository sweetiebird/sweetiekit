//
//  NMTLRenderPipelineColorAttachmentDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineColorAttachmentDescriptorArray_h
#define NMTLRenderPipelineColorAttachmentDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineColorAttachmentDescriptorArray(x) js_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptorArray)
#define to_value_MTLRenderPipelineColorAttachmentDescriptorArray(x) to_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptorArray)
#define is_value_MTLRenderPipelineColorAttachmentDescriptorArray(x) is_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptorArray)

JS_WRAP_CLASS(MTLRenderPipelineColorAttachmentDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLRenderPipelineColorAttachmentDescriptorArray);

#endif /* NMTLRenderPipelineColorAttachmentDescriptorArray_h */
