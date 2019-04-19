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
  const CGRect& GetFrame();
  static NAN_METHOD(Alloc);
  static NAN_GETTER(TitleGetter);
  static NAN_SETTER(TitleSetter);
  static NAN_GETTER(CallbackGetter);
  static NAN_SETTER(CallbackSetter);
  Nan::Persistent<Function>* _callback;
  CGRect _rect;
JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
