//
//  NMTLRenderPassColorAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassColorAttachmentDescriptor_h
#define NMTLRenderPassColorAttachmentDescriptor_h    

#include "NMTLRenderPassAttachmentDescriptor.h"

#define js_value_MTLRenderPassColorAttachmentDescriptor(x) js_value_wrapper(x, MTLRenderPassColorAttachmentDescriptor)
#define to_value_MTLRenderPassColorAttachmentDescriptor(x) to_value_wrapper(x, MTLRenderPassColorAttachmentDescriptor)
#define is_value_MTLRenderPassColorAttachmentDescriptor(x) is_value_wrapper(x, MTLRenderPassColorAttachmentDescriptor)

JS_WRAP_CLASS(MTLRenderPassColorAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_PROP(clearColor);
JS_WRAP_CLASS_END(MTLRenderPassColorAttachmentDescriptor);

#endif /* NMTLRenderPassColorAttachmentDescriptor_h */
