//
//  NUIVisualEffectView.h
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIVisualEffectView_h
#define NUIVisualEffectView_h    

#include "NUIView.h"

#define js_value_UIVisualEffectView(x) js_value_wrapper(x, UIVisualEffectView)
#define to_value_UIVisualEffectView(x) to_value_wrapper(x, UIVisualEffectView)
#define is_value_UIVisualEffectView(x) is_value_wrapper(x, UIVisualEffectView)

JS_WRAP_CLASS(UIVisualEffectView, UIView);
  JS_STATIC_METHOD(initWithEffect);
  JS_STATIC_METHOD(initWithCoder);
  JS_PROP_READONLY(contentView);
  JS_PROP(effect);
JS_WRAP_CLASS_END(UIVisualEffectView);

#endif /* NUIVisualEffectView_h */
