//
//  NUIStoryboard.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStoryboard_h
#define NUIStoryboard_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

JS_WRAP_CLASS(UIStoryboard, NSObject);
  static NAN_METHOD(InstantiateViewController);
JS_WRAP_CLASS_END(UIStoryboard);


#endif /* NUIStoryboard_h */
