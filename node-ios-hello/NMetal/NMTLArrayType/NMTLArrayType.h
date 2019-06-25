//
//  NMTLArrayType.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLArrayType_h
#define NMTLArrayType_h    

#include "NMTLType.h"

#define js_value_MTLArrayType(x) js_value_wrapper(x, MTLArrayType)
#define to_value_MTLArrayType(x) to_value_wrapper(x, MTLArrayType)
#define is_value_MTLArrayType(x) is_value_wrapper(x, MTLArrayType)

JS_WRAP_CLASS(MTLArrayType, MTLType);
  // TODO: declare MTLArrayType methods and properties
JS_WRAP_CLASS_END(MTLArrayType);

#endif /* NMTLArrayType_h */