//
//  NUIPageControl.h
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPageControl_h
#define NUIPageControl_h    

#include "NUIControl.h"

#define js_value_UIPageControl(x) js_value_wrapper(x, UIPageControl)
#define to_value_UIPageControl(x) to_value_wrapper(x, UIPageControl)
#define is_value_UIPageControl(x) is_value_wrapper(x, UIPageControl)

JS_WRAP_CLASS(UIPageControl, UIControl);
  JS_METHOD(updateCurrentPageDisplay);
  JS_METHOD(sizeForNumberOfPages);
  JS_PROP(numberOfPages);
  JS_PROP(currentPage);
  JS_PROP(hidesForSinglePage);
  JS_PROP(defersCurrentPageDisplay);
  JS_PROP(pageIndicatorTintColor);
  JS_PROP(currentPageIndicatorTintColor);
JS_WRAP_CLASS_END(UIPageControl);

#endif /* NUIPageControl_h */
