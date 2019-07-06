//
//  NCGPath.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGPath_h
#define NCGPath_h    

#include "NNSObject.h"

#define js_value_CGLineJoin(x) JS_ENUM(CGLineJoin, int32_t, x)
#define to_value_CGLineJoin(x) TO_ENUM(CGLineJoin, int32_t, x)
#define is_value_CGLineJoin(x) IS_ENUM(CGLineJoin, int32_t, x)

#define js_value_CGLineCap(x) JS_ENUM(CGLineCap, int32_t, x)
#define to_value_CGLineCap(x) TO_ENUM(CGLineCap, int32_t, x)
#define is_value_CGLineCap(x) IS_ENUM(CGLineCap, int32_t, x)

#define js_value_CGPathElementType(x) JS_ENUM(CGPathElementType, int32_t, x)
#define to_value_CGPathElementType(x) TO_ENUM(CGPathElementType, int32_t, x)
#define is_value_CGPathElementType(x) IS_ENUM(CGPathElementType, int32_t, x)

JS_WRAP_GLOBALS(CGPath);
JS_WRAP_GLOBALS_END(CGPath);

#endif /* NCGPath_h */
