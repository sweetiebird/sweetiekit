//
//  NMTLRenderPassColorAttachmentDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassColorAttachmentDescriptorArray_h
#define NMTLRenderPassColorAttachmentDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLRenderPassColorAttachmentDescriptorArray(x) js_value_wrapper(x, MTLRenderPassColorAttachmentDescriptorArray)
#define to_value_MTLRenderPassColorAttachmentDescriptorArray(x) to_value_wrapper(x, MTLRenderPassColorAttachmentDescriptorArray)
#define is_value_MTLRenderPassColorAttachmentDescriptorArray(x) is_value_wrapper(x, MTLRenderPassColorAttachmentDescriptorArray)

JS_WRAP_CLASS(MTLRenderPassColorAttachmentDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLRenderPassColorAttachmentDescriptorArray);

#endif /* NMTLRenderPassColorAttachmentDescriptorArray_h */
