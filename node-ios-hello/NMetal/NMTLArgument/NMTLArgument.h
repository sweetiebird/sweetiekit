//
//  NMTLArgument.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLArgument_h
#define NMTLArgument_h    

#include "NNSObject.h"

#define js_value_MTLArgument(x) js_value_wrapper(x, MTLArgument)
#define to_value_MTLArgument(x) to_value_wrapper(x, MTLArgument)
#define is_value_MTLArgument(x) is_value_wrapper(x, MTLArgument)

#define js_value_MTLDataType(x) JS_ENUM(MTLDataType, NSUInteger, x)
#define to_value_MTLDataType(x) TO_ENUM(MTLDataType, NSUInteger, x)
#define is_value_MTLDataType(x) IS_ENUM(MTLDataType, NSUInteger, x)

#define js_value_MTLArgumentType(x) JS_ENUM(MTLArgumentType, NSUInteger, x)
#define to_value_MTLArgumentType(x) TO_ENUM(MTLArgumentType, NSUInteger, x)
#define is_value_MTLArgumentType(x) IS_ENUM(MTLArgumentType, NSUInteger, x)

#define js_value_MTLArgumentAccess(x) JS_ENUM(MTLArgumentAccess, NSUInteger, x)
#define to_value_MTLArgumentAccess(x) TO_ENUM(MTLArgumentAccess, NSUInteger, x)
#define is_value_MTLArgumentAccess(x) IS_ENUM(MTLArgumentAccess, NSUInteger, x)

JS_WRAP_CLASS(MTLArgument, NSObject);
  // TODO: declare MTLArgument methods and properties
JS_WRAP_CLASS_END(MTLArgument);

#endif /* NMTLArgument_h */
