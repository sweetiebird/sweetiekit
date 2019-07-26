//
//  NGCControllerElement.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCControllerElement_h
#define NGCControllerElement_h    

#include "NNSObject.h"

#define js_value_GCControllerElement(x) js_value_wrapper(x, GCControllerElement)
#define to_value_GCControllerElement(x) to_value_wrapper(x, GCControllerElement)
#define is_value_GCControllerElement(x) is_value_wrapper(x, GCControllerElement)

JS_WRAP_CLASS(GCControllerElement, NSObject);
  JS_PROP_READONLY(collection);
  JS_PROP_READONLY(isAnalog);
JS_WRAP_CLASS_END(GCControllerElement);

#endif /* NGCControllerElement_h */
