//
//  NUIProgressView.h
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIProgressView_h
#define NUIProgressView_h    

#include "NUIView.h"

#define js_value_UIProgressView(x) js_value_wrapper(x, UIProgressView)
#define to_value_UIProgressView(x) to_value_wrapper(x, UIProgressView)
#define is_value_UIProgressView(x) is_value_wrapper(x, UIProgressView)

#define js_value_UIProgressViewStyle(x) JS_ENUM(UIProgressViewStyle, NSInteger, x)
#define to_value_UIProgressViewStyle(x) TO_ENUM(UIProgressViewStyle, NSInteger, x)
#define is_value_UIProgressViewStyle(x) IS_ENUM(UIProgressViewStyle, NSInteger, x)

JS_WRAP_CLASS(UIProgressView, UIView);
  JS_METHOD(setProgress);
  JS_PROP(progress);
  JS_PROP(progressTintColor);
  JS_PROP(trackTintColor);
JS_WRAP_CLASS_END(UIProgressView);

#endif /* NUIProgressView_h */
