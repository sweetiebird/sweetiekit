//
//  NMTLTileRenderPipelineColorAttachmentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTileRenderPipelineColorAttachmentDescriptor_h
#define NMTLTileRenderPipelineColorAttachmentDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLTileRenderPipelineColorAttachmentDescriptor(x) js_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptor)
#define to_value_MTLTileRenderPipelineColorAttachmentDescriptor(x) to_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptor)
#define is_value_MTLTileRenderPipelineColorAttachmentDescriptor(x) is_value_wrapper(x, MTLTileRenderPipelineColorAttachmentDescriptor)

JS_WRAP_CLASS(MTLTileRenderPipelineColorAttachmentDescriptor, NSObject);
  JS_PROP(pixelFormat);
JS_WRAP_CLASS_END(MTLTileRenderPipelineColorAttachmentDescriptor);

#endif /* NMTLTileRenderPipelineColorAttachmentDescriptor_h */
