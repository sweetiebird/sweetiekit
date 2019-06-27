//
//  NUISlider.h
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISlider_h
#define NUISlider_h

#include "NUIControl.h"

#define js_value_UISlider(x) js_value_wrapper(x, UISlider)
#define to_value_UISlider(x) to_value_wrapper(x, UISlider)
#define is_value_UISlider(x) is_value_wrapper(x, UISlider)

JS_WRAP_CLASS(UISlider, UIControl);
  JS_METHOD(setValueAnimated);
  JS_METHOD(setThumbImageForState);
  JS_METHOD(setMinimumTrackImageForState);
  JS_METHOD(setMaximumTrackImageForState);
  JS_METHOD(thumbImageForState);
  JS_METHOD(minimumTrackImageForState);
  JS_METHOD(maximumTrackImageForState);
  JS_METHOD(minimumValueImageRectForBounds);
  JS_METHOD(maximumValueImageRectForBounds);
  JS_METHOD(trackRectForBounds);
  JS_METHOD(thumbRectForBoundsTrackRectValue);
  JS_PROP(value);
  JS_PROP(minimumValue);
  JS_PROP(maximumValue);
  JS_PROP(minimumValueImage);
  JS_PROP(maximumValueImage);
  JS_PROP(isContinuous);
  JS_PROP(minimumTrackTintColor);
  JS_PROP(maximumTrackTintColor);
  JS_PROP(thumbTintColor);
  JS_PROP_READONLY(currentThumbImage);
  JS_PROP_READONLY(currentMinimumTrackImage);
  JS_PROP_READONLY(currentMaximumTrackImage);
JS_WRAP_CLASS_END(UISlider);

#endif /* NUISlider_h */
