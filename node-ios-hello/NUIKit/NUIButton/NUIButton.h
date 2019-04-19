//
//  NUIButton.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIButton_h
#define NUIButton_h

#import <UIKit/UIKit.h>
#include "defines.h"

JS_WRAP_CLASS(UIButton);
  const CGRect& GetFrame();
  static NAN_METHOD(Alloc);
  static NAN_GETTER(FrameGetter);
  static NAN_SETTER(FrameSetter);
  CGRect _rect;
JS_WRAP_CLASS_END(UIButton);

#endif /* NUIButton_h */
