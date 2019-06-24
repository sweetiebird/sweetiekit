//
//  NNSTimer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSTimer_h
#define NNSTimer_h    

#include "NNSObject.h"

#define js_value_NSTimer(x) js_value_wrapper(x, NSTimer)
#define to_value_NSTimer(x) to_value_wrapper(x, NSTimer)
#define is_value_NSTimer(x) is_value_wrapper(x, NSTimer)

JS_WRAP_CLASS(NSTimer, NSObject);
  JS_STATIC_METHOD(timerWithTimeIntervalInvocationRepeats);
  JS_STATIC_METHOD(scheduledTimerWithTimeIntervalInvocationRepeats);
  JS_STATIC_METHOD(timerWithTimeIntervalTargetSelectorUserInfoRepeats);
  JS_STATIC_METHOD(scheduledTimerWithTimeIntervalTargetSelectorUserInfoRepeats);
  JS_STATIC_METHOD(timerWithTimeIntervalRepeatsBlock);
  JS_STATIC_METHOD(scheduledTimerWithTimeIntervalRepeatsBlock);
  JS_METHOD(initWithFireDateIntervalRepeatsBlock);
  JS_METHOD(initWithFireDateIntervalTargetSelectorUserInfoRepeats);
  JS_METHOD(fire);
  JS_METHOD(invalidate);
  JS_PROP(fireDate);
  JS_PROP_READONLY(timeInterval);
  JS_PROP(tolerance);
  JS_PROP_READONLY(isValid);
  JS_PROP_READONLY(userInfo);
JS_WRAP_CLASS_END(NSTimer);

#endif /* NNSTimer_h */
