//
//  NCGShading.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGShading_h
#define NCGShading_h    

#include "NNSObject.h"

#define js_value_CGShadingRef(x) js_value_bridged(x, CGShadingRef)
#define to_value_CGShadingRef(x) to_value_bridged(x, CGShadingRef)
#define is_value_CGShadingRef(x) is_value_bridged(x, CGShadingRef)

JS_WRAP_GLOBALS(CGShading);
JS_WRAP_GLOBALS_END(CGShading);

#endif /* NCGShading_h */
