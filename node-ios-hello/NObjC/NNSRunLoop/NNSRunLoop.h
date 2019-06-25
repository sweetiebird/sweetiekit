//
//  NNSRunLoop.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSRunLoop_h
#define NNSRunLoop_h    

#include "NNSObject.h"

#define js_value_NSRunLoop(x) js_value_wrapper(x, NSRunLoop)
#define to_value_NSRunLoop(x) to_value_wrapper(x, NSRunLoop)
#define is_value_NSRunLoop(x) is_value_wrapper(x, NSRunLoop)

//typedef struct CF_BRIDGED_MUTABLE_TYPE(id) __CFRunLoop * CFRunLoopRef;
#define js_value_CFRunLoopRef(x) js_value_bridged(x, CFRunLoopRef)
#define to_value_CFRunLoopRef(x) to_value_bridged(x, CFRunLoopRef)
#define is_value_CFRunLoopRef(x) is_value_bridged(x, CFRunLoopRef)

JS_WRAP_CLASS(NSRunLoop, NSObject);
  JS_METHOD(getCFRunLoop);
  JS_METHOD(addTimerForMode);
  JS_METHOD(addPortForMode);
  JS_METHOD(removePortForMode);
  JS_METHOD(limitDateForMode);
  JS_METHOD(acceptInputForModeBeforeDate);
  JS_METHOD(run);
  JS_METHOD(runUntilDate);
  JS_METHOD(runModeBeforeDate);
  JS_METHOD(configureAsServer);
  JS_METHOD(performInModesBlock);
  JS_METHOD(performBlock);
  JS_METHOD(performSelectorTargetArgumentOrderModes);
  JS_METHOD(cancelPerformSelectorTargetArgument);
  JS_METHOD(cancelPerformSelectorsWithTarget);
  JS_STATIC_PROP_READONLY(currentRunLoop);
  JS_STATIC_PROP_READONLY(mainRunLoop);
  JS_PROP_READONLY(currentMode);
#if TODO
// NSObject
  JS_STATIC_METHOD(cancelPreviousPerformRequestsWithTargetSelectorObject);
  JS_STATIC_METHOD(cancelPreviousPerformRequestsWithTarget);
  JS_METHOD(performSelectorWithObjectAfterDelayInModes);
  JS_METHOD(performSelectorWithObjectAfterDelay);
#endif
JS_WRAP_CLASS_END(NSRunLoop);

#endif /* NNSRunLoop_h */
