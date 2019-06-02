//
//  NUIImage.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImageView_h
#define NUIImageView_h

#include "NUIView.h"

#define js_value_UIImageView(x) js_value_wrapper(x, UIImageView)
#define to_value_UIImageView(x) to_value_wrapper(x, UIImageView)
#define is_value_UIImageView(x) is_value_wrapper(x, UIImageView)

JS_WRAP_CLASS(UIImageView, UIView);
  JS_PROP(image);
JS_WRAP_CLASS_END(UIImageView);

#endif /* NUIImageView_h */
