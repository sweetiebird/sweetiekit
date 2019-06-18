//
//  NCATransaction.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCATransaction_h
#define NCATransaction_h    

#include "NNSObject.h"

#define js_value_CATransaction(x) js_value_wrapper(x, CATransaction)
#define to_value_CATransaction(x) to_value_wrapper(x, CATransaction)
#define is_value_CATransaction(x) is_value_wrapper(x, CATransaction)

JS_WRAP_CLASS(CATransaction, NSObject);
  JS_STATIC_METHOD(begin);
  JS_STATIC_METHOD(commit);
  JS_STATIC_METHOD(flush);
  JS_STATIC_METHOD(lock);
  JS_STATIC_METHOD(unlock);
  JS_STATIC_METHOD(animationDuration);
  JS_STATIC_METHOD(setAnimationDuration);
  JS_STATIC_METHOD(animationTimingFunction);
  JS_STATIC_METHOD(setAnimationTimingFunction);
  JS_STATIC_METHOD(disableActions);
  JS_STATIC_METHOD(setDisableActions);
  JS_STATIC_METHOD(completionBlock);
  JS_STATIC_METHOD(setCompletionBlock);
  JS_STATIC_METHOD(valueForKey);
  JS_STATIC_METHOD(setValueForKey);
JS_WRAP_CLASS_END(CATransaction);

#endif /* NCATransaction_h */
