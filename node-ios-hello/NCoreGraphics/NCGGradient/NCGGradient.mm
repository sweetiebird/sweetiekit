//
//  NCGGradient.mm
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGGradient.h"

JS_INIT_GLOBALS(CGGradient);
  // global values (exports)

  //typedef CF_OPTIONS (uint32_t, CGGradientDrawingOptions) {
    JS_ASSIGN_ENUM(kCGGradientDrawsBeforeStartLocation, uint32_t); //  = (1 << 0),
    JS_ASSIGN_ENUM(kCGGradientDrawsAfterEndLocation, uint32_t); //  = (1 << 1)
  //};

JS_INIT_GLOBALS_END(CGGradient);
