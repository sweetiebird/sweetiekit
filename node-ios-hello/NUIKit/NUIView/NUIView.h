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

JS_WRAP_CLASS(UIView);
  CGRect GetFrame();
  static NAN_METHOD(AddSubview);
  static NAN_GETTER(FrameGetter);
  static NAN_SETTER(FrameSetter);
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
