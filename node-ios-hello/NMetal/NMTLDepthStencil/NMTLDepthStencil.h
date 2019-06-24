//
//  NMTLDepthStencil.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLDepthStencil_h
#define NMTLDepthStencil_h    

#include "NNSObject.h"

#define js_value_MTLCompareFunction(x) JS_ENUM(MTLCompareFunction, NSUInteger, x)
#define to_value_MTLCompareFunction(x) TO_ENUM(MTLCompareFunction, NSUInteger, x)
#define is_value_MTLCompareFunction(x) IS_ENUM(MTLCompareFunction, NSUInteger, x)

#define js_value_MTLStencilOperation(x) JS_ENUM(MTLStencilOperation, NSUInteger, x)
#define to_value_MTLStencilOperation(x) TO_ENUM(MTLStencilOperation, NSUInteger, x)
#define is_value_MTLStencilOperation(x) IS_ENUM(MTLStencilOperation, NSUInteger, x)

JS_WRAP_GLOBALS(MTLDepthStencil);
JS_WRAP_GLOBALS_END(MTLDepthStencil);

#endif /* NMTLDepthStencil_h */
