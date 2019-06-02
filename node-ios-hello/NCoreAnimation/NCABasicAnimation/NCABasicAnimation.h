//
//  NCABasicAnimation.h
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCABasicAnimation_h
#define NCABasicAnimation_h

#include "NNSObject.h"

JS_WRAP_CLASS(CABasicAnimation, NSObject);
  JS_PROP(FromValue);
  JS_PROP(ToValue);
  JS_PROP(Duration);
JS_WRAP_CLASS_END(CABasicAnimation);

#endif /* NCABasicAnimation_h */
