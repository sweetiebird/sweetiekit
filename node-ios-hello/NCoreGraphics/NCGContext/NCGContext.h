//
//  NCGContext.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGContext_h
#define NCGContext_h    

#include "NNSObject.h"

#define js_value_CGContextRef(x) js_value_bridged(x, CGContextRef)
#define to_value_CGContextRef(x) to_value_bridged(x, CGContextRef)
#define is_value_CGContextRef(x) is_value_bridged(x, CGContextRef)

#define js_value_CGPathDrawingMode(x) JS_ENUM(CGPathDrawingMode, int32_t, x)
#define to_value_CGPathDrawingMode(x) TO_ENUM(CGPathDrawingMode, int32_t, x)
#define is_value_CGPathDrawingMode(x) IS_ENUM(CGPathDrawingMode, int32_t, x)

#define js_value_CGTextDrawingMode(x) JS_ENUM(CGTextDrawingMode, int32_t, x)
#define to_value_CGTextDrawingMode(x) TO_ENUM(CGTextDrawingMode, int32_t, x)
#define is_value_CGTextDrawingMode(x) IS_ENUM(CGTextDrawingMode, int32_t, x)

#define js_value_CGTextEncoding(x) JS_ENUM(CGTextEncoding, int32_t, x)
#define to_value_CGTextEncoding(x) TO_ENUM(CGTextEncoding, int32_t, x)
#define is_value_CGTextEncoding(x) IS_ENUM(CGTextEncoding, int32_t, x)

#define js_value_CGInterpolationQuality(x) JS_ENUM(CGInterpolationQuality, int32_t, x)
#define to_value_CGInterpolationQuality(x) TO_ENUM(CGInterpolationQuality, int32_t, x)
#define is_value_CGInterpolationQuality(x) IS_ENUM(CGInterpolationQuality, int32_t, x)

#define js_value_CGBlendMode(x) JS_ENUM(CGBlendMode, int32_t, x)
#define to_value_CGBlendMode(x) TO_ENUM(CGBlendMode, int32_t, x)
#define is_value_CGBlendMode(x) IS_ENUM(CGBlendMode, int32_t, x)

JS_WRAP_GLOBALS(CGContext);
  // TODO: declare CGContext globals
JS_WRAP_GLOBALS_END(CGContext);

#endif /* NCGContext_h */
