//
//  NMTLPipeline.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMTLPipeline.h"

JS_INIT_GLOBALS(MTLPipeline);
  // global values (exports)

  /*!
   * @enum MTLMutability
   * @abstract Specifies whether a buffer will be modified between the time it is bound and a compute
   * or render pipeline is executed in a draw or dispatch.
   */
  //typedef NS_ENUM(NSUInteger, MTLMutability) {
    JS_ASSIGN_ENUM(MTLMutabilityDefault, NSUInteger); //   = 0,
    JS_ASSIGN_ENUM(MTLMutabilityMutable, NSUInteger); //   = 1,
    JS_ASSIGN_ENUM(MTLMutabilityImmutable, NSUInteger); // = 2,
  //} API_AVAILABLE(macos(10.13), ios(11.0));

JS_INIT_GLOBALS_END(MTLPipeline);
