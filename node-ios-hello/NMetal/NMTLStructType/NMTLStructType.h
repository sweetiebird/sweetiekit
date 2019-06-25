//
//  NMTLStructType.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLStructType_h
#define NMTLStructType_h    

#include "NMTLType.h"

#define js_value_MTLStructType(x) js_value_wrapper(x, MTLStructType)
#define to_value_MTLStructType(x) to_value_wrapper(x, MTLStructType)
#define is_value_MTLStructType(x) is_value_wrapper(x, MTLStructType)

JS_WRAP_CLASS(MTLStructType, MTLType);
  // TODO: declare MTLStructType methods and properties
JS_WRAP_CLASS_END(MTLStructType);

#endif /* NMTLStructType_h */