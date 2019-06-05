//
//  NUITextField.h
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
  JS_METHOD(Alloc);
  JS_PROP(Text);
  JS_PROP(Delegate);
  JS_PROP(Callback);
  JS_PROP(textColor);
  JS_PROP(placeholder);
  JS_PROP(attributedPlaceholder);
  JS_PROP(autocorrectionType);
  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UITextField);

#endif /* NUITextField_h */
