//
//  NUIButton.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIButton_h
#define NUIButton_h

#include "NUIControl.h"

#define js_value_UIButon(x) js_value_wrapper(x, UIButon)
#define to_value_UIButon(x) to_value_wrapper(x, UIButon)
#define is_value_UIButon(x) is_value_wrapper(x, UIButon)

JS_WRAP_CLASS(UIButton, UIControl);
  JS_METHOD(setTitleColorForState);
  JS_METHOD(setTitleForState);
  JS_METHOD(setBackgroundImageForState);

  JS_PROP(Title);
  JS_PROP(Callback);
  JS_PROP(titleLabel);
  JS_PROP(titleEdgeInsets);
  JS_PROP(contentEdgeInsets);
  JS_PROP(imageEdgeInsets);
  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
