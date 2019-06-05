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
  JS_PROP(isOn);
  JS_PROP(onTintColor);
  JS_METHOD(setOn);
JS_WRAP_CLASS_END(UISwitch);

#endif /* NUISwitch_h */
