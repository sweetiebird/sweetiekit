//
//  NCGFont.mm
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGFont.h"

JS_INIT_GLOBALS(CGFont);
  // global values (exports)

  //typedef CF_ENUM(int32_t, CGFontPostScriptFormat) {
    JS_ASSIGN_ENUM(kCGFontPostScriptFormatType1, int32_t); //  = 1,
    JS_ASSIGN_ENUM(kCGFontPostScriptFormatType3, int32_t); //  = 3,
    JS_ASSIGN_ENUM(kCGFontPostScriptFormatType42, int32_t); //  = 42
  //};
JS_INIT_GLOBALS_END(CGFont);
