//
//  NMTLRenderPassDepthAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassDepthAttachmentDescriptor_h
#define NMTLRenderPassDepthAttachmentDescriptor_h    

#include "NMTLRenderPassAttachmentDescriptor.h"

#define js_value_MTLRenderPassDepthAttachmentDescriptor(x) js_value_wrapper(x, MTLRenderPassDepthAttachmentDescriptor)
#define to_value_MTLRenderPassDepthAttachmentDescriptor(x) to_value_wrapper(x, MTLRenderPassDepthAttachmentDescriptor)
#define is_value_MTLRenderPassDepthAttachmentDescriptor(x) is_value_wrapper(x, MTLRenderPassDepthAttachmentDescriptor)

JS_WRAP_CLASS(MTLRenderPassDepthAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_PROP(clearDepth);
  JS_PROP(depthResolveFilter);
JS_WRAP_CLASS_END(MTLRenderPassDepthAttachmentDescriptor);

#endif /* NMTLRenderPassDepthAttachmentDescriptor_h */
