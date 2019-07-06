//
//  NCGPDFPage.mm
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGPDFPage.h"

JS_INIT_GLOBALS(CGPDFPage);
  // global values (exports)

  //typedef CF_ENUM (int32_t, CGPDFBox) {
    JS_ASSIGN_ENUM(kCGPDFMediaBox, int32_t); //  = 0,
    JS_ASSIGN_ENUM(kCGPDFCropBox, int32_t); //  = 1,
    JS_ASSIGN_ENUM(kCGPDFBleedBox, int32_t); //  = 2,
    JS_ASSIGN_ENUM(kCGPDFTrimBox, int32_t); //  = 3,
    JS_ASSIGN_ENUM(kCGPDFArtBox, int32_t); //  = 4
  //};

JS_INIT_GLOBALS_END(CGPDFPage);
