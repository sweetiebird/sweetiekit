//
//  NUITextField.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextField_h
#define NUITextField_h

#include "defines.h"
using namespace v8;
using namespace node;

#include "NUIControl.h"

JS_WRAP_CLASS(UITextField, UIControl);
  static NAN_METHOD(Alloc);
  static NAN_GETTER(TextGetter);
  static NAN_SETTER(TextSetter);
  static NAN_GETTER(DelegateGetter);
  static NAN_SETTER(DelegateSetter);
JS_WRAP_CLASS_END(UITextField);

#endif /* NUITextField_h */
