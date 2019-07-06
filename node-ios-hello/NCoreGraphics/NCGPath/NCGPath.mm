//
//  NCGPath.mm
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGPath.h"

JS_INIT_GLOBALS(CGPath);
  // global values (exports)

  /* Line join styles. */

  //typedef CF_ENUM(int32_t, CGLineJoin)
  {
    JS_ASSIGN_ENUM(kCGLineJoinMiter, int32_t);
    JS_ASSIGN_ENUM(kCGLineJoinRound, int32_t);
    JS_ASSIGN_ENUM(kCGLineJoinBevel, int32_t);
  };

  /* Line cap styles. */

  //typedef CF_ENUM(int32_t, CGLineCap)
  {
    JS_ASSIGN_ENUM(kCGLineCapButt, int32_t);
    JS_ASSIGN_ENUM(kCGLineCapRound, int32_t);
    JS_ASSIGN_ENUM(kCGLineCapSquare, int32_t);
  };

  //typedef CF_ENUM(int32_t, CGPathElementType) {
    JS_ASSIGN_ENUM(kCGPathElementMoveToPoint, int32_t);
    JS_ASSIGN_ENUM(kCGPathElementAddLineToPoint, int32_t);
    JS_ASSIGN_ENUM(kCGPathElementAddQuadCurveToPoint, int32_t);
    JS_ASSIGN_ENUM(kCGPathElementAddCurveToPoint, int32_t);
    JS_ASSIGN_ENUM(kCGPathElementCloseSubpath, int32_t);
  //};

JS_INIT_GLOBALS_END(CGPath);
