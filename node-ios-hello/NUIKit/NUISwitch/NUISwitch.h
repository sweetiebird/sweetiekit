//
//  NUISwitch.h
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISwitch_h
#define NUISwitch_h

#include "NUIControl.h"

#define js_value_UISwitch(x) js_value_wrapper(x, UISwitch)
#define to_value_UISwitch(x) to_value_wrapper(x, UISwitch)
#define is_value_UISwitch(x) is_value_wrapper(x, UISwitch)

JS_WRAP_CLASS(UISwitch, UIControl);
  JS_METHOD(initWithFrame);
  JS_METHOD(initWithCoder);
  JS_METHOD(setOnAnimated);
  JS_PROP(onTintColor);
  JS_PROP(tintColor);
  JS_PROP(thumbTintColor);
  JS_PROP(onImage);
  JS_PROP(offImage);
  JS_PROP(isOn);
JS_WRAP_CLASS_END(UISwitch);

#endif /* NUISwitch_h */
