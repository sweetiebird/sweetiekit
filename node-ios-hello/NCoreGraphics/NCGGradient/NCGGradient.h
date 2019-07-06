//
//  NCGGradient.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGGradient_h
#define NCGGradient_h    

#include "NNSObject.h"

#define js_value_CGGradientRef(x) js_value_bridged(x, CGGradientRef)
#define to_value_CGGradientRef(x) to_value_bridged(x, CGGradientRef)
#define is_value_CGGradientRef(x) is_value_bridged(x, CGGradientRef)

#define js_value_CGGradientDrawingOptions(x) JS_OPTS(CGGradientDrawingOptions, uint32_t, x)
#define to_value_CGGradientDrawingOptions(x) TO_OPTS(CGGradientDrawingOptions, uint32_t, x)
#define is_value_CGGradientDrawingOptions(x) IS_OPTS(CGGradientDrawingOptions, uint32_t, x)

JS_WRAP_GLOBALS(CGGradient);
JS_WRAP_GLOBALS_END(CGGradient);

#endif /* NCGGradient_h */
