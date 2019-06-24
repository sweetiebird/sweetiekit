//
//  NMTLBufferLayoutDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLBufferLayoutDescriptor_h
#define NMTLBufferLayoutDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLBufferLayoutDescriptor(x) js_value_wrapper(x, MTLBufferLayoutDescriptor)
#define to_value_MTLBufferLayoutDescriptor(x) to_value_wrapper(x, MTLBufferLayoutDescriptor)
#define is_value_MTLBufferLayoutDescriptor(x) is_value_wrapper(x, MTLBufferLayoutDescriptor)

JS_WRAP_CLASS(MTLBufferLayoutDescriptor, NSObject);
  JS_PROP(stride);
  JS_PROP(stepFunction);
  JS_PROP(stepRate);
JS_WRAP_CLASS_END(MTLBufferLayoutDescriptor);

#endif /* NMTLBufferLayoutDescriptor_h */
