//
//  NGCControllerAxisInput.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCControllerAxisInput_h
#define NGCControllerAxisInput_h    

#include "NGCControllerElement.h"

#define js_value_GCControllerAxisInput(x) js_value_wrapper(x, GCControllerAxisInput)
#define to_value_GCControllerAxisInput(x) to_value_wrapper(x, GCControllerAxisInput)
#define is_value_GCControllerAxisInput(x) is_value_wrapper(x, GCControllerAxisInput)

JS_WRAP_CLASS(GCControllerAxisInput, GCControllerElement);
  JS_METHOD(setValue);
  JS_PROP(valueChangedHandler);
  JS_PROP_READONLY(value);
JS_WRAP_CLASS_END(GCControllerAxisInput);

#endif /* NGCControllerAxisInput_h */
