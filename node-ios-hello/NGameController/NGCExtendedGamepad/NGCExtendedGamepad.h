//
//  NGCExtendedGamepad.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCExtendedGamepad_h
#define NGCExtendedGamepad_h    

#include "NNSObject.h"

#define js_value_GCExtendedGamepad(x) js_value_wrapper(x, GCExtendedGamepad)
#define to_value_GCExtendedGamepad(x) to_value_wrapper(x, GCExtendedGamepad)
#define is_value_GCExtendedGamepad(x) is_value_wrapper(x, GCExtendedGamepad)

JS_WRAP_CLASS(GCExtendedGamepad, NSObject);
  JS_METHOD(saveSnapshot);
  JS_METHOD(setStateFromExtendedGamepad);
  JS_PROP_READONLY(controller);
  JS_PROP(valueChangedHandler);
  JS_PROP_READONLY(dpad);
  JS_PROP_READONLY(buttonA);
  JS_PROP_READONLY(buttonB);
  JS_PROP_READONLY(buttonX);
  JS_PROP_READONLY(buttonY);
  JS_PROP_READONLY(buttonMenu);
  JS_PROP_READONLY(buttonOptions);
  JS_PROP_READONLY(leftThumbstick);
  JS_PROP_READONLY(rightThumbstick);
  JS_PROP_READONLY(leftShoulder);
  JS_PROP_READONLY(rightShoulder);
  JS_PROP_READONLY(leftTrigger);
  JS_PROP_READONLY(rightTrigger);
  JS_PROP_READONLY(leftThumbstickButton);
  JS_PROP_READONLY(rightThumbstickButton);
JS_WRAP_CLASS_END(GCExtendedGamepad);

#endif /* NGCExtendedGamepad_h */
