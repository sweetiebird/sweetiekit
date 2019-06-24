//
//  NMTLBufferLayoutDescriptorArray.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLBufferLayoutDescriptorArray_h
#define NMTLBufferLayoutDescriptorArray_h    

#include "NNSObject.h"

#define js_value_MTLBufferLayoutDescriptorArray(x) js_value_wrapper(x, MTLBufferLayoutDescriptorArray)
#define to_value_MTLBufferLayoutDescriptorArray(x) to_value_wrapper(x, MTLBufferLayoutDescriptorArray)
#define is_value_MTLBufferLayoutDescriptorArray(x) is_value_wrapper(x, MTLBufferLayoutDescriptorArray)

JS_WRAP_CLASS(MTLBufferLayoutDescriptorArray, NSObject);
  JS_METHOD(objectAtIndexedSubscript);
  JS_METHOD(setObjectAtIndexedSubscript);
JS_WRAP_CLASS_END(MTLBufferLayoutDescriptorArray);

#endif /* NMTLBufferLayoutDescriptorArray_h */
