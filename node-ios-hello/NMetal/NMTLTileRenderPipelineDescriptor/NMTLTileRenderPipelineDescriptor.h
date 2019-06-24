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
  // TODO: declare MTLTileRenderPipelineDescriptor methods and properties
JS_WRAP_CLASS_END(MTLTileRenderPipelineDescriptor);

#endif /* NMTLTileRenderPipelineDescriptor_h */