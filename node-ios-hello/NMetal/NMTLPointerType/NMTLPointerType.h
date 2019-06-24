//
//  NMTLPointerType.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLPointerType_h
#define NMTLPointerType_h    

#include "NMTLType.h"

#define js_value_MTLPointerType(x) js_value_wrapper(x, MTLPointerType)
#define to_value_MTLPointerType(x) to_value_wrapper(x, MTLPointerType)
#define is_value_MTLPointerType(x) is_value_wrapper(x, MTLPointerType)

JS_WRAP_CLASS(MTLPointerType, MTLType);
  // TODO: declare MTLPointerType methods and properties
JS_WRAP_CLASS_END(MTLPointerType);

#endif /* NMTLPointerType_h */