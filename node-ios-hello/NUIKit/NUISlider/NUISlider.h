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
  JS_METHOD(setValue);
  JS_PROP(value);
  JS_METHOD(setThumbImage);
  JS_PROP(currentThumbImage);
  JS_PROP(thumbTintColor);
  JS_PROP(continuous);
JS_WRAP_CLASS_END(UISlider);

#endif /* NUISlider_h */
