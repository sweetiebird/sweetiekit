//
//  NMTLAttributeDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLAttributeDescriptor_h
#define NMTLAttributeDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLAttributeDescriptor(x) js_value_wrapper(x, MTLAttributeDescriptor)
#define to_value_MTLAttributeDescriptor(x) to_value_wrapper(x, MTLAttributeDescriptor)
#define is_value_MTLAttributeDescriptor(x) is_value_wrapper(x, MTLAttributeDescriptor)

JS_WRAP_CLASS(MTLAttributeDescriptor, NSObject);
  JS_PROP(format);
  JS_PROP(offset);
  JS_PROP(bufferIndex);
JS_WRAP_CLASS_END(MTLAttributeDescriptor);

#endif /* NMTLAttributeDescriptor_h */
