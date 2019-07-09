//
//  NCVPixelBuffer.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCVPixelBuffer_h
#define NCVPixelBuffer_h    

#include "NCVImageBuffer.h"

#define js_value_CVPixelBufferLockFlags(x) JS_ENUM(CVPixelBufferLockFlags, CVOptionFlags, x)
#define to_value_CVPixelBufferLockFlags(x) TO_ENUM(CVPixelBufferLockFlags, CVOptionFlags, x)
#define is_value_CVPixelBufferLockFlags(x) IS_ENUM(CVPixelBufferLockFlags, CVOptionFlags, x)

#define js_value_CVPixelBufferRef js_value_CVImageBufferRef
#define to_value_CVPixelBufferRef to_value_CVImageBufferRef
#define is_value_CVPixelBufferRef is_value_CVImageBufferRef

JS_WRAP_GLOBALS(CVPixelBuffer);
JS_WRAP_GLOBALS_END(CVPixelBuffer);

#endif /* NCVPixelBuffer_h */
