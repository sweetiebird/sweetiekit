//
//  NGCControllerDirectionPad.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCControllerDirectionPad_h
#define NGCControllerDirectionPad_h    

#include "NGCControllerElement.h"

#define js_value_GCControllerDirectionPad(x) js_value_wrapper(x, GCControllerDirectionPad)
#define to_value_GCControllerDirectionPad(x) to_value_wrapper(x, GCControllerDirectionPad)
#define is_value_GCControllerDirectionPad(x) is_value_wrapper(x, GCControllerDirectionPad)

JS_WRAP_CLASS(GCControllerDirectionPad, GCControllerElement);
  JS_METHOD(setValueForXAxisYAxis);
  JS_PROP(valueChangedHandler);
  JS_PROP_READONLY(xAxis);
  JS_PROP_READONLY(yAxis);
  JS_PROP_READONLY(up);
  JS_PROP_READONLY(down);
  JS_PROP_READONLY(left);
  JS_PROP_READONLY(right);
JS_WRAP_CLASS_END(GCControllerDirectionPad);

#endif /* NGCControllerDirectionPad_h */
