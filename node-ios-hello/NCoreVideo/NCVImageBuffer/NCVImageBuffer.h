//
//  NCVImageBuffer.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCVImageBuffer_h
#define NCVImageBuffer_h    

#include "NCVBuffer.h"

#define js_value_CVImageBufferRef js_value_CVBufferRef
#define to_value_CVImageBufferRef to_value_CVBufferRef
#define is_value_CVImageBufferRef is_value_CVBufferRef

JS_WRAP_GLOBALS(CVImageBuffer);
  // TODO: declare CVImageBuffer globals
JS_WRAP_GLOBALS_END(CVImageBuffer);

#endif /* NCVImageBuffer_h */
