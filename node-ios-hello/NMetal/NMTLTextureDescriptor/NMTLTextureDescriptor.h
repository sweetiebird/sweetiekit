//
//  NMTLTextureDescriptor.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLTextureDescriptor_h
#define NMTLTextureDescriptor_h    

#include "NNSObject.h"

#define js_value_MTLTextureDescriptor(x) js_value_wrapper(x, MTLTextureDescriptor)
#define to_value_MTLTextureDescriptor(x) to_value_wrapper(x, MTLTextureDescriptor)
#define is_value_MTLTextureDescriptor(x) is_value_wrapper(x, MTLTextureDescriptor)

JS_WRAP_CLASS(MTLTextureDescriptor, NSObject);
  // TODO: declare MTLTextureDescriptor methods and properties
JS_WRAP_CLASS_END(MTLTextureDescriptor);

#endif /* NMTLTextureDescriptor_h */