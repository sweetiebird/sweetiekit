//
//  NUIToolbar.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIToolbar_h
#define NUIToolbar_h    

#include "NUIView.h"

#define js_value_UIToolbar(x) js_value_wrapper(x, UIToolbar)
#define to_value_UIToolbar(x) to_value_wrapper(x, UIToolbar)
#define is_value_UIToolbar(x) is_value_wrapper(x, UIToolbar)

JS_WRAP_CLASS(UIToolbar, UIView);
JS_WRAP_CLASS_END(UIView);

#endif /* NUIToolbar_h */
