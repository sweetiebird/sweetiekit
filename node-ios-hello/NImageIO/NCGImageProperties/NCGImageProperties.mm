//
//  NCGImageProperties.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGImageProperties.h"

JS_INIT_GLOBALS(CGImageProperties);
  // global values (exports)

  /* Possible int values for kCGImagePropertyTIFFOrientation */
  //typedef CF_ENUM(uint32_t, CGImagePropertyOrientation) {
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUp, uint32_t); //  = 1,        // 0th row at top,    0th column on left   - default orientation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationUpMirrored, uint32_t); // ,    // 0th row at top,    0th column on right  - horizontal flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDown, uint32_t); // ,          // 0th row at bottom, 0th column on right  - 180 deg rotation
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationDownMirrored, uint32_t); // ,  // 0th row at bottom, 0th column on left   - vertical flip
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeftMirrored, uint32_t); // ,  // 0th row on left,   0th column at top
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRight, uint32_t); // ,         // 0th row on right,  0th column at top    - 90 deg CW
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationRightMirrored, uint32_t); // , // 0th row on right,  0th column on bottom
    JS_ASSIGN_ENUM(kCGImagePropertyOrientationLeft, uint32_t); //            // 0th row on left,   0th column at bottom - 90 deg CCW
  //};
JS_INIT_GLOBALS_END(CGImageProperties);
