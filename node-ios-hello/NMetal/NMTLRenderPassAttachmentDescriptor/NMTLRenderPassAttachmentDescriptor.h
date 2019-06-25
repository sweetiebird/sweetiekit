//
//  NMTLRenderPassAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPassAttachmentDescriptor_h
#define NMTLRenderPassAttachmentDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLRenderPassAttachmentDescriptor(x) js_value_wrapper(x, MTLRenderPassAttachmentDescriptor)
#define to_value_MTLRenderPassAttachmentDescriptor(x) to_value_wrapper(x, MTLRenderPassAttachmentDescriptor)
#define is_value_MTLRenderPassAttachmentDescriptor(x) is_value_wrapper(x, MTLRenderPassAttachmentDescriptor)

JS_WRAP_CLASS(MTLRenderPassAttachmentDescriptor, NSObject);
  JS_PROP(texture);
  JS_PROP(level);
  JS_PROP(slice);
  JS_PROP(depthPlane);
  JS_PROP(resolveTexture);
  JS_PROP(resolveLevel);
  JS_PROP(resolveSlice);
  JS_PROP(resolveDepthPlane);
  JS_PROP(loadAction);
  JS_PROP(storeAction);
  JS_PROP(storeActionOptions);
JS_WRAP_CLASS_END(MTLRenderPassAttachmentDescriptor);

#endif /* NMTLRenderPassAttachmentDescriptor_h */
