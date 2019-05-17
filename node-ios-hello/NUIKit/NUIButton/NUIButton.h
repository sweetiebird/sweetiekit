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

JS_WRAP_CLASS(UIButton, UIControl);
  static NAN_METHOD(Alloc);
  static NAN_METHOD(setTitleColor);
  JS_PROP(Title);
  JS_PROP(Callback);
  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
