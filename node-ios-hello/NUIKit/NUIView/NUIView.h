//
//  NUIView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIView_h
#define NUIView_h

#import <UIKit/UIKit.h>

#include "defines.h"
#include "NUIResponder.h"

using namespace v8;
using namespace node;

JS_WRAP_CLASS(UIView, UIResponder);
  CGRect GetFrame();
  static NAN_METHOD(AddSubview);
  static NAN_GETTER(FrameGetter);
  static NAN_SETTER(FrameSetter);
  static NAN_GETTER(XGetter);
  static NAN_SETTER(XSetter);
  static NAN_GETTER(YGetter);
  static NAN_SETTER(YSetter);
  static NAN_METHOD(SetBackgroundColor);
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
