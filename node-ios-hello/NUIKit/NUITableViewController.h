//
//  NUITableViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/20/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewController_h
#define NUITableViewController_h

#include "defines.h"
using namespace v8;
using namespace node;

#include "NUITableViewController.h"

JS_WRAP_CLASS(UITextField, UIControl);
  static NAN_METHOD(Alloc);
  static NAN_GETTER(TextGetter);
  static NAN_SETTER(TextSetter);
  static NAN_GETTER(DelegateGetter);
  static NAN_SETTER(DelegateSetter);
  static NAN_GETTER(CallbackGetter);
  static NAN_SETTER(CallbackSetter);
  Nan::Persistent<Function>* _callback;
JS_WRAP_CLASS_END(UITextField);

#endif /* NUITableViewController_h */
