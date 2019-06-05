//
//  NUIControl.h
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIControl_h
#define NUIControl_h

#include "NUIView.h"

#define js_value_UIControl(x) js_value_wrapper(x, UIControl)
#define to_value_UIControl(x) to_value_wrapper(x, UIControl)
#define is_value_UIControl(x) is_value_wrapper(x, UIControl)

JS_WRAP_CLASS(UIControl, UIView);
  JS_METHOD(addTarget);
  JS_METHOD(removeTarget);
  JS_PROP(State);
  JS_PROP(Enabled);
  JS_PROP(Selected);
  JS_PROP(Highlighted);
  JS_PROP(Tracking);
  JS_PROP(TouchInside);
JS_WRAP_CLASS_END(UIControl);

#endif /* NUIControl_h */
