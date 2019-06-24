//
//  NMTLAttributeDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLAttributeDescriptorArray_h
#define NMTLAttributeDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLAttributeDescriptorArray(x) js_value_wrapper(x, MTLAttributeDescriptorArray)
#define to_value_MTLAttributeDescriptorArray(x) to_value_wrapper(x, MTLAttributeDescriptorArray)
#define is_value_MTLAttributeDescriptorArray(x) is_value_wrapper(x, MTLAttributeDescriptorArray)

JS_WRAP_CLASS(MTLAttributeDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLAttributeDescriptorArray);

#endif /* NMTLAttributeDescriptorArray_h */
