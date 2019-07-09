//
//  NCVBuffer.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCVBuffer_h
#define NCVBuffer_h    

#include "NNSObject.h"

#define js_value_CVBufferRef(x) js_value_bridged(x, CVBufferRef)
#define to_value_CVBufferRef(x) to_value_bridged(x, CVBufferRef)
#define is_value_CVBufferRef(x) is_value_bridged(x, CVBufferRef)

JS_WRAP_GLOBALS(CVBuffer);
  // TODO: declare CVBuffer globals
JS_WRAP_GLOBALS_END(CVBuffer);

#endif /* NCVBuffer_h */
