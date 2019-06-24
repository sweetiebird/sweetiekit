//
//  NMTLDepthStencilDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLDepthStencilDescriptor_h
#define NMTLDepthStencilDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLDepthStencilDescriptor(x) js_value_wrapper(x, MTLDepthStencilDescriptor)
#define to_value_MTLDepthStencilDescriptor(x) to_value_wrapper(x, MTLDepthStencilDescriptor)
#define is_value_MTLDepthStencilDescriptor(x) is_value_wrapper(x, MTLDepthStencilDescriptor)

JS_WRAP_CLASS(MTLDepthStencilDescriptor, NSObject);
  JS_PROP(depthCompareFunction);
  JS_PROP(isDepthWriteEnabled);
  JS_PROP(frontFaceStencil);
  JS_PROP(backFaceStencil);
  JS_PROP(label);
JS_WRAP_CLASS_END(MTLDepthStencilDescriptor);

#endif /* NMTLDepthStencilDescriptor_h */
