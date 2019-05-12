//
//  NUISwitch.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISwitch_h
#define NUISwitch_h

#include "NUIControl.h"

JS_WRAP_CLASS(UISwitch, UIControl);
  JS_PROP(IsOn);
  JS_PROP(OnTintColor);
  static NAN_METHOD(SetOn);
JS_WRAP_CLASS_END(UISwitch);

#endif /* NUISwitch_h */
