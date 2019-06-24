//
//  NMTLRenderPipelineColorAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineColorAttachmentDescriptor_h
#define NMTLRenderPipelineColorAttachmentDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineColorAttachmentDescriptor(x) js_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptor)
#define to_value_MTLRenderPipelineColorAttachmentDescriptor(x) to_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptor)
#define is_value_MTLRenderPipelineColorAttachmentDescriptor(x) is_value_wrapper(x, MTLRenderPipelineColorAttachmentDescriptor)

JS_WRAP_CLASS(MTLRenderPipelineColorAttachmentDescriptor, NSObject);
  JS_PROP(pixelFormat);
  JS_PROP(isBlendingEnabled);
  JS_PROP(sourceRGBBlendFactor);
  JS_PROP(destinationRGBBlendFactor);
  JS_PROP(rgbBlendOperation);
  JS_PROP(sourceAlphaBlendFactor);
  JS_PROP(destinationAlphaBlendFactor);
  JS_PROP(alphaBlendOperation);
  JS_PROP(writeMask);
JS_WRAP_CLASS_END(MTLRenderPipelineColorAttachmentDescriptor);

#endif /* NMTLRenderPipelineColorAttachmentDescriptor_h */
