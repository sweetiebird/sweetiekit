//
//  NMTLRenderPipelineDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLRenderPipelineDescriptor_h
#define NMTLRenderPipelineDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLRenderPipelineDescriptor(x) js_value_wrapper(x, MTLRenderPipelineDescriptor)
#define to_value_MTLRenderPipelineDescriptor(x) to_value_wrapper(x, MTLRenderPipelineDescriptor)
#define is_value_MTLRenderPipelineDescriptor(x) is_value_wrapper(x, MTLRenderPipelineDescriptor)

JS_WRAP_CLASS(MTLRenderPipelineDescriptor, NSObject);
  // TODO: declare MTLRenderPipelineDescriptor methods and properties
JS_WRAP_CLASS_END(MTLRenderPipelineDescriptor);

#endif /* NMTLRenderPipelineDescriptor_h */