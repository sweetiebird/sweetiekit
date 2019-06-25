//
//  NMTLArgumentDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLArgumentDescriptor_h
#define NMTLArgumentDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLArgumentDescriptor(x) js_value_wrapper(x, MTLArgumentDescriptor)
#define to_value_MTLArgumentDescriptor(x) to_value_wrapper(x, MTLArgumentDescriptor)
#define is_value_MTLArgumentDescriptor(x) is_value_wrapper(x, MTLArgumentDescriptor)

JS_WRAP_CLASS(MTLArgumentDescriptor, NSObject);
  JS_STATIC_METHOD(argumentDescriptor);
  JS_PROP(dataType);
  JS_PROP(index);
  JS_PROP(arrayLength);
  JS_PROP(access);
  JS_PROP(textureType);
  JS_PROP(constantBlockAlignment);
JS_WRAP_CLASS_END(MTLArgumentDescriptor);

#endif /* NMTLArgumentDescriptor_h */
