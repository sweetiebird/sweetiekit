//
//  NMTLDepthStencil.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLDepthStencil.h"

#define instancetype MTLDepthStencil
#define js_value_instancetype js_value_MTLDepthStencil

JS_INIT_GLOBALS(MTLDepthStencil);

  //typedef NS_ENUM(NSUInteger, MTLCompareFunction) {
    JS_ASSIGN_ENUM(MTLCompareFunctionNever, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLCompareFunctionLess, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLCompareFunctionEqual, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLCompareFunctionLessEqual, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLCompareFunctionGreater, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLCompareFunctionNotEqual, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLCompareFunctionGreaterEqual, NSUInteger); // = 6,
    JS_ASSIGN_ENUM(MTLCompareFunctionAlways, NSUInteger); // = 7,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

  //typedef NS_ENUM(NSUInteger, MTLStencilOperation) {
    JS_ASSIGN_ENUM(MTLStencilOperationKeep, NSUInteger); // = 0,
    JS_ASSIGN_ENUM(MTLStencilOperationZero, NSUInteger); // = 1,
    JS_ASSIGN_ENUM(MTLStencilOperationReplace, NSUInteger); // = 2,
    JS_ASSIGN_ENUM(MTLStencilOperationIncrementClamp, NSUInteger); // = 3,
    JS_ASSIGN_ENUM(MTLStencilOperationDecrementClamp, NSUInteger); // = 4,
    JS_ASSIGN_ENUM(MTLStencilOperationInvert, NSUInteger); // = 5,
    JS_ASSIGN_ENUM(MTLStencilOperationIncrementWrap, NSUInteger); // = 6,
    JS_ASSIGN_ENUM(MTLStencilOperationDecrementWrap, NSUInteger); // = 7,
  //} API_AVAILABLE(macos(10.11), ios(8.0));

JS_INIT_GLOBALS_END(MTLDepthStencil);
