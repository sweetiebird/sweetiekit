//
//  NUIScreenMode.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScreenMode_h
#define NUIScreenMode_h    

#include "NNSObject.h"

#define js_value_UIScreenMode(x) js_value_wrapper(x, UIScreenMode)
#define to_value_UIScreenMode(x) to_value_wrapper(x, UIScreenMode)
#define is_value_UIScreenMode(x) is_value_wrapper(x, UIScreenMode)

JS_WRAP_CLASS(UIScreenMode, NSObject);
  JS_PROP_READONLY(size);
  JS_PROP_READONLY(pixelAspectRatio);
JS_WRAP_CLASS_END(UIScreenMode);

#endif /* NUIScreenMode_h */
