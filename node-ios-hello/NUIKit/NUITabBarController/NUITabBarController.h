//
//  NUITabBarController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarController_h
#define NUITabBarController_h

#import <UIKit/UIKit.h>
#include "defines.h"

JS_WRAP_CLASS(UITabBarController);
  static NAN_METHOD(SetViewControllers);
JS_WRAP_CLASS_END(UITabBarController);

#endif /* NUITabBarController_h */
