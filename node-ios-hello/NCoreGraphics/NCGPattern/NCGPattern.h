//
//  NCGPattern.h
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGPattern_h
#define NCGPattern_h    

#include "NNSObject.h"

#define js_value_CGPatternRef(x) js_value_bridged(x, CGPatternRef)
#define to_value_CGPatternRef(x) to_value_bridged(x, CGPatternRef)
#define is_value_CGPatternRef(x) is_value_bridged(x, CGPatternRef)

JS_WRAP_GLOBALS(CGPattern);
JS_WRAP_GLOBALS_END(CGPattern);

#endif /* NCGPattern_h */
