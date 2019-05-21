//
//  NUIImage.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImageView_h
#define NUIImageView_h

#include "defines.h"
using namespace v8;
using namespace node;
#include "NUIView.h"

JS_WRAP_CLASS(UIImageView, UIView);
  JS_PROP(image);
JS_WRAP_CLASS_END(UIImageView);

#endif /* NUIImageView_h */
