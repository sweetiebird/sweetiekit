//
//  NUIViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#import <UIKit/UIKit.h>
#include "defines.h"

JS_WRAP_CLASS(UIViewController);
  static NAN_GETTER(ViewGetter);
JS_WRAP_CLASS_END(UIViewController);

#endif /* NUIViewController_h */
