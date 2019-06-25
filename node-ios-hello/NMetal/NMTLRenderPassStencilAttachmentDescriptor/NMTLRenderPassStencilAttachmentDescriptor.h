//
//  NMTLRenderPassStencilAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassStencilAttachmentDescriptor_h
#define NMTLRenderPassStencilAttachmentDescriptor_h    

#include "NMTLRenderPassAttachmentDescriptor.h"

#define js_value_MTLRenderPassStencilAttachmentDescriptor(x) js_value_wrapper(x, MTLRenderPassStencilAttachmentDescriptor)
#define to_value_MTLRenderPassStencilAttachmentDescriptor(x) to_value_wrapper(x, MTLRenderPassStencilAttachmentDescriptor)
#define is_value_MTLRenderPassStencilAttachmentDescriptor(x) is_value_wrapper(x, MTLRenderPassStencilAttachmentDescriptor)

JS_WRAP_CLASS(MTLRenderPassStencilAttachmentDescriptor, MTLRenderPassAttachmentDescriptor);
  JS_PROP(clearStencil);
  JS_PROP(stencilResolveFilter);
JS_WRAP_CLASS_END(MTLRenderPassStencilAttachmentDescriptor);

#endif /* NMTLRenderPassStencilAttachmentDescriptor_h */
