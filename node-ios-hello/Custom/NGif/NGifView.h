//
//  NGifView.h
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGifView_h
#define NGifView_h

#include "NUIImageView.h"

#define js_value_GifView(x) js_value_wrapper(x, GifView)
#define to_value_GifView(x) to_value_wrapper(x, GifView)
#define is_value_GifView(x) is_value_wrapper(x, GifView)

JS_WRAP_CLASS(GifView, UIImageView);
  JS_METHOD(setGifImage);
  JS_METHOD(setGifFromUrl);
JS_WRAP_CLASS_END(GifView);

#endif /* NGifView_h */
