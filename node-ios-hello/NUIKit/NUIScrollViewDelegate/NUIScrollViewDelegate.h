//
//  NUIScrollViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollViewDelegate_h
#define NUIScrollViewDelegate_h    

#include "NNSObject.h"

#define js_value_UIScrollViewDelegate(x) js_value_wrapper(x, UIScrollViewDelegate)
#define to_value_UIScrollViewDelegate(x) to_value_wrapper(x, UIScrollViewDelegate)
#define is_value_UIScrollViewDelegate(x) is_value_wrapper(x, UIScrollViewDelegate)

JS_WRAP_CLASS(UIScrollViewDelegate, NSObject);
  JS_PROP(didScroll);
  JS_PROP(didEndDecelerating);
  JS_PROP(didScrollToTop);
  JS_PROP(shouldScrollToTop);
  JS_PROP(willBeginDecelerating);
  JS_PROP(didEndDragging);

  sweetiekit::JSFunction _didScroll;
  sweetiekit::JSFunction _didEndDecelerating;
  sweetiekit::JSFunction _willBeginDecelerating;
  sweetiekit::JSFunction _didScrollToTop;
  sweetiekit::JSFunction _shouldScrollToTop;
  sweetiekit::JSFunction _didEndDragging;
JS_WRAP_CLASS_END(UIScrollViewDelegate);

#endif /* NUIScrollViewDelegate_h */
