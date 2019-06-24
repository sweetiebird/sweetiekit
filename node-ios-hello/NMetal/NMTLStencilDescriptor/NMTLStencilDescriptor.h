//
//  NMTLStencilDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLStencilDescriptor_h
#define NMTLStencilDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLStencilDescriptor(x) js_value_wrapper(x, MTLStencilDescriptor)
#define to_value_MTLStencilDescriptor(x) to_value_wrapper(x, MTLStencilDescriptor)
#define is_value_MTLStencilDescriptor(x) is_value_wrapper(x, MTLStencilDescriptor)

JS_WRAP_CLASS(MTLStencilDescriptor, NSObject);
  JS_PROP(stencilCompareFunction);
  JS_PROP(stencilFailureOperation);
  JS_PROP(depthFailureOperation);
  JS_PROP(depthStencilPassOperation);
  JS_PROP(readMask);
  JS_PROP(writeMask);
JS_WRAP_CLASS_END(MTLStencilDescriptor);

#endif /* NMTLStencilDescriptor_h */
