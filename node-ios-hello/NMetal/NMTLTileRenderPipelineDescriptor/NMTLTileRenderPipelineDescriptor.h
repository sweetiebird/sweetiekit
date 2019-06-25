//
//  NMTLTileRenderPipelineDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTileRenderPipelineDescriptor_h
#define NMTLTileRenderPipelineDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLTileRenderPipelineDescriptor(x) js_value_wrapper(x, MTLTileRenderPipelineDescriptor)
#define to_value_MTLTileRenderPipelineDescriptor(x) to_value_wrapper(x, MTLTileRenderPipelineDescriptor)
#define is_value_MTLTileRenderPipelineDescriptor(x) is_value_wrapper(x, MTLTileRenderPipelineDescriptor)

JS_WRAP_CLASS(MTLTileRenderPipelineDescriptor, NSObject);
  JS_METHOD(reset);
  JS_PROP(label);
  JS_PROP(tileFunction);
  JS_PROP(rasterSampleCount);
  JS_PROP_READONLY(colorAttachments);
  JS_PROP(threadgroupSizeMatchesTileSize);
  JS_PROP_READONLY(tileBuffers);
  JS_PROP(maxTotalThreadsPerThreadgroup);
JS_WRAP_CLASS_END(MTLTileRenderPipelineDescriptor);

#endif /* NMTLTileRenderPipelineDescriptor_h */
