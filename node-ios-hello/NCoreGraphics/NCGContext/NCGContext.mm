//
//  NCGContext.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCGContext.h"

JS_INIT_GLOBALS(CGContext);
  // global values (exports)

  //typedef CF_ENUM (int32_t, CGPathDrawingMode) {
    JS_ASSIGN_ENUM(kCGPathFill, int32_t);
    JS_ASSIGN_ENUM(kCGPathEOFill, int32_t);
    JS_ASSIGN_ENUM(kCGPathStroke, int32_t);
    JS_ASSIGN_ENUM(kCGPathFillStroke, int32_t);
    JS_ASSIGN_ENUM(kCGPathEOFillStroke, int32_t);
  //};

  //typedef CF_ENUM (int32_t, CGTextDrawingMode) {
    JS_ASSIGN_ENUM(kCGTextFill, int32_t);
    JS_ASSIGN_ENUM(kCGTextStroke, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillStroke, int32_t);
    JS_ASSIGN_ENUM(kCGTextInvisible, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextStrokeClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextFillStrokeClip, int32_t);
    JS_ASSIGN_ENUM(kCGTextClip, int32_t);
  //};

  //typedef CF_ENUM (int32_t, CGTextEncoding) {
    JS_ASSIGN_ENUM(kCGEncodingFontSpecific, int32_t);
    JS_ASSIGN_ENUM(kCGEncodingMacRoman, int32_t);
  //} CG_AVAILABLE_BUT_DEPRECATED(10.0, 10.9, 2.0, 7.0);

  //typedef CF_ENUM (int32_t, CGInterpolationQuality) {
    JS_ASSIGN_ENUM(kCGInterpolationDefault, int32_t); //  = 0,  
    JS_ASSIGN_ENUM(kCGInterpolationNone, int32_t); //  = 1,     
    JS_ASSIGN_ENUM(kCGInterpolationLow, int32_t); //  = 2,      
    JS_ASSIGN_ENUM(kCGInterpolationMedium, int32_t); //  = 4,   
    JS_ASSIGN_ENUM(kCGInterpolationHigh, int32_t); //  = 3      
  //};

  //typedef CF_ENUM (int32_t, CGBlendMode) {
      
    JS_ASSIGN_ENUM(kCGBlendModeNormal, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeMultiply, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeScreen, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeOverlay, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDarken, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeLighten, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColorDodge, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColorBurn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSoftLight, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeHardLight, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDifference, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeExclusion, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeHue, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSaturation, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeColor, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeLuminosity, int32_t);

    JS_ASSIGN_ENUM(kCGBlendModeClear, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeCopy, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceIn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceOut, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeSourceAtop, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationOver, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationIn, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationOut, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeDestinationAtop, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModeXOR, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModePlusDarker, int32_t);
    JS_ASSIGN_ENUM(kCGBlendModePlusLighter, int32_t);
  //};

JS_INIT_GLOBALS_END(CGContext);
