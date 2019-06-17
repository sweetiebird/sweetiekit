//
//  NUIStepper.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStepper_h
#define NUIStepper_h    

#include "NUIControl.h"

#define js_value_UIStepper(x) js_value_wrapper(x, UIStepper)
#define to_value_UIStepper(x) to_value_wrapper(x, UIStepper)
#define is_value_UIStepper(x) is_value_wrapper(x, UIStepper)

JS_WRAP_CLASS(UIStepper, UIControl);
  JS_METHOD(setBackgroundImageForState);
  JS_METHOD(backgroundImageForState);
  JS_METHOD(setDividerImageForLeftSegmentStateRightSegmentState);
  JS_METHOD(dividerImageForLeftSegmentStateRightSegmentState);
  JS_METHOD(setIncrementImageForState);
  JS_METHOD(incrementImageForState);
  JS_METHOD(setDecrementImageForState);
  JS_METHOD(decrementImageForState);
  JS_PROP(isContinuous);
  JS_PROP(autorepeat);
  JS_PROP(wraps);
  JS_PROP(value);
  JS_PROP(minimumValue);
  JS_PROP(maximumValue);
  JS_PROP(stepValue);
  JS_PROP(tintColor);
JS_WRAP_CLASS_END(UIStepper);

#endif /* NUIStepper_h */
