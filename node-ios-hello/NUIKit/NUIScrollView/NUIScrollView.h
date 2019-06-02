//
//  NUIScrollView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollView_h
#define NUIScrollView_h

#include "NUIView.h"

#define js_value_UIScrollView(x) js_value_wrapper(x, UIScrollView)
#define to_value_UIScrollView(x) to_value_wrapper(x, UIScrollView)
#define is_value_UIScrollView(x) is_value_wrapper(x, UIScrollView)

JS_WRAP_CLASS(UIScrollView, UIView);
  JS_METHOD(setContentOffset);
  JS_PROP(delegate);
  JS_PROP(contentOffset);
  JS_PROP(contentSize);
  JS_PROP(showsHorizontalScrollIndicator);
  JS_PROP(showsVerticalScrollIndicator);
  
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(UIScrollView);

#endif /* NUIScrollView_h */
