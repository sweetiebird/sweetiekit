//
//  NGCControllerButtonInput.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCControllerButtonInput_h
#define NGCControllerButtonInput_h    

#include "NGCControllerElement.h"

#define js_value_GCControllerButtonInput(x) js_value_wrapper(x, GCControllerButtonInput)
#define to_value_GCControllerButtonInput(x) to_value_wrapper(x, GCControllerButtonInput)
#define is_value_GCControllerButtonInput(x) is_value_wrapper(x, GCControllerButtonInput)

JS_WRAP_CLASS(GCControllerButtonInput, GCControllerElement);
  JS_METHOD(setValue);
  JS_PROP(valueChangedHandler);
  JS_PROP(pressedChangedHandler);
  JS_PROP_READONLY(value);
  JS_PROP_READONLY(isPressed);
JS_WRAP_CLASS_END(GCControllerButtonInput);

#endif /* NGCControllerButtonInput_h */
