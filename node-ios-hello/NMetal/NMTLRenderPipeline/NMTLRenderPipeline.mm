//
//  NMTLRenderPipeline.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLRenderPipeline.h"

JS_INIT_GLOBALS(MTLRenderPipeline);

  //typedef NS_ENUM(NSUInteger, MTLBlendFactor) {
    JS_ASSIGN_ENUM(MTLBlendFactorZero, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLBlendFactorOne, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLBlendFactorSourceColor, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSourceColor, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLBlendFactorSourceAlpha, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSourceAlpha, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLBlendFactorDestinationColor, NSUInteger); // = 6,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusDestinationColor, NSUInteger); // = 7,
    JS_ASSIGN_ENUM(MTLBlendFactorDestinationAlpha, NSUInteger); // = 8,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusDestinationAlpha, NSUInteger); // = 9,
    JS_ASSIGN_ENUM(MTLBlendFactorSourceAlphaSaturated, NSUInteger); // = 10,
    JS_ASSIGN_ENUM(MTLBlendFactorBlendColor, NSUInteger); // = 11,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusBlendColor, NSUInteger); // = 12,
    JS_ASSIGN_ENUM(MTLBlendFactorBlendAlpha, NSUInteger); // = 13,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusBlendAlpha, NSUInteger); // = 14,
    JS_ASSIGN_ENUM(MTLBlendFactorSource1Color, NSUInteger); //              API_AVAILABLE(macos(10.12), ios(10.11)) = 15,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSource1Color, NSUInteger); //      API_AVAILABLE(macos(10.12), ios(10.11)) = 16,
    JS_ASSIGN_ENUM(MTLBlendFactorSource1Alpha, NSUInteger); //              API_AVAILABLE(macos(10.12), ios(10.11)) = 17,
    JS_ASSIGN_ENUM(MTLBlendFactorOneMinusSource1Alpha, NSUInteger); //      API_AVAILABLE(macos(10.12), ios(10.11)) = 18,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLBlendOperation) {
    JS_ASSIGN_ENUM(MTLBlendOperationAdd, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLBlendOperationSubtract, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLBlendOperationReverseSubtract, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLBlendOperationMin, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLBlendOperationMax, NSUInteger); // = 4,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_OPTIONS(NSUInteger, MTLColorWriteMask) {
    JS_ASSIGN_ENUM(MTLColorWriteMaskNone, NSUInteger); //  = 0,
    JS_ASSIGN_ENUM(MTLColorWriteMaskRed, NSUInteger); //   = 0x1 << 3,
    JS_ASSIGN_ENUM(MTLColorWriteMaskGreen, NSUInteger); // = 0x1 << 2,
    JS_ASSIGN_ENUM(MTLColorWriteMaskBlue, NSUInteger); //  = 0x1 << 1,
    JS_ASSIGN_ENUM(MTLColorWriteMaskAlpha, NSUInteger); // = 0x1 << 0,
    JS_ASSIGN_ENUM(MTLColorWriteMaskAll, NSUInteger); //   = 0xf
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLPrimitiveTopologyClass) {
    JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassUnspecified, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassPoint, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassLine, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLPrimitiveTopologyClassTriangle, NSUInteger); // = 3,
  //} API_AVAILABLE(macos(10.11), ios(12.0));

  //typedef NS_ENUM(NSUInteger, MTLTessellationPartitionMode) {
    JS_ASSIGN_ENUM(MTLTessellationPartitionModePow2, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLTessellationPartitionModeInteger, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLTessellationPartitionModeFractionalOdd, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLTessellationPartitionModeFractionalEven, NSUInteger); // = 3,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

  //typedef NS_ENUM(NSUInteger, MTLTessellationFactorStepFunction) {
    JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionConstant, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerPatch, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerInstance, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLTessellationFactorStepFunctionPerPatchAndPerInstance, NSUInteger); // = 3,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

  //typedef NS_ENUM(NSUInteger, MTLTessellationFactorFormat) {
    JS_ASSIGN_ENUM(MTLTessellationFactorFormatHalf, NSUInteger); // = 0,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

  //typedef NS_ENUM(NSUInteger, MTLTessellationControlPointIndexType) {
    JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeNone, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeUInt16, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLTessellationControlPointIndexTypeUInt32, NSUInteger); // = 2,
  //} API_AVAILABLE(macos(10.12), ios(10.0));

JS_INIT_GLOBALS_END(MTLRenderPipeline);
