//
//  NCGColorSpace.mm
//
//  Created by Shawn Presser on 7/5/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGColorSpace.h"

JS_INIT_GLOBALS(CGColorSpace);
  // global values (exports)

  /* Color rendering intents. */

  //typedef CF_ENUM (int32_t, CGColorRenderingIntent) {
    JS_ASSIGN_ENUM(kCGRenderingIntentDefault, int32_t);
    JS_ASSIGN_ENUM(kCGRenderingIntentAbsoluteColorimetric, int32_t);
    JS_ASSIGN_ENUM(kCGRenderingIntentRelativeColorimetric, int32_t);
    JS_ASSIGN_ENUM(kCGRenderingIntentPerceptual, int32_t);
    JS_ASSIGN_ENUM(kCGRenderingIntentSaturation, int32_t);
  //};

  /* The model of a color space. */

  //typedef CF_ENUM (int32_t,  CGColorSpaceModel) {
    JS_ASSIGN_ENUM(kCGColorSpaceModelUnknown, int32_t); //  = -1,
    JS_ASSIGN_ENUM(kCGColorSpaceModelMonochrome, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelRGB, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelCMYK, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelLab, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelDeviceN, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelIndexed, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelPattern, int32_t);
    JS_ASSIGN_ENUM(kCGColorSpaceModelXYZ, int32_t);
  //};
JS_INIT_GLOBALS_END(CGColorSpace);
