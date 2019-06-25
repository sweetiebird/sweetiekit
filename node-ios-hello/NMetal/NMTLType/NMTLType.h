//
//  NMTLType.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLType_h
#define NMTLType_h    

#include "NNSObject.h"

#define js_value_MTLType(x) js_value_wrapper(x, MTLType)
#define to_value_MTLType(x) to_value_wrapper(x, MTLType)
#define is_value_MTLType(x) is_value_wrapper(x, MTLType)

JS_WRAP_CLASS(MTLType, NSObject);
  // TODO: declare MTLType methods and properties
JS_WRAP_CLASS_END(MTLType);

#endif /* NMTLType_h */