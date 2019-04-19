//
//  NUIWindow.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIWindow_h
#define NUIWindow_h

#import <UIKit/UIKit.h>

#include "defines.h"

JS_WRAP_CLASS(UIWindow);
  static NAN_METHOD(SetRootViewController);
JS_WRAP_CLASS_END(UIWindow);

#endif /* NUIWindow_h */
