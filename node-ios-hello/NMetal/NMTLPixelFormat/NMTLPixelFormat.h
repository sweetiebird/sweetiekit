//
//  NMTLPixelFormat.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLPixelFormat_h
#define NMTLPixelFormat_h    

#include "NNSObject.h"

#define js_value_MTLPixelFormat(x) JS_ENUM(MTLPixelFormat, NSUInteger, x)
#define to_value_MTLPixelFormat(x) TO_ENUM(MTLPixelFormat, NSUInteger, x)
#define is_value_MTLPixelFormat(x) IS_ENUM(MTLPixelFormat, NSUInteger, x)


JS_WRAP_GLOBALS(MTLPixelFormat);
JS_WRAP_GLOBALS_END(MTLPixelFormat);

#endif /* NMTLPixelFormat_h */
