//
//  NUIInputView.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIInputView_h
#define NUIInputView_h    

#include "NUIView.h"

#define js_value_UIInputView(x) js_value_wrapper(x, UIInputView)
#define to_value_UIInputView(x) to_value_wrapper(x, UIInputView)
#define is_value_UIInputView(x) is_value_wrapper(x, UIInputView)

#define js_value_UIInputViewStyle(x) JS_ENUM(UIInputViewStyle, NSInteger, x)
#define to_value_UIInputViewStyle(x) TO_ENUM(UIInputViewStyle, NSInteger, x)
#define is_value_UIInputViewStyle(x) IS_ENUM(UIInputViewStyle, NSInteger, x)

JS_WRAP_CLASS(UIInputView, UIView);
  JS_METHOD(initWithFrameInputViewStyle);
  JS_METHOD(initWithCoder);
  JS_PROP_READONLY(inputViewStyle);
  JS_PROP(allowsSelfSizing);
JS_WRAP_CLASS_END(UIInputView);

#endif /* NUIInputView_h */
