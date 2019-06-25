//
//  NMTLPipeline.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLPipeline_h
#define NMTLPipeline_h    

#include "NNSObject.h"

#define js_value_MTLMutability(x) JS_ENUM(MTLMutability, NSUInteger, x)
#define to_value_MTLMutability(x) TO_ENUM(MTLMutability, NSUInteger, x)
#define is_value_MTLMutability(x) IS_ENUM(MTLMutability, NSUInteger, x)

JS_WRAP_GLOBALS(MTLPipeline);
JS_WRAP_GLOBALS_END(MTLPipeline);

#endif /* NMTLPipeline_h */
