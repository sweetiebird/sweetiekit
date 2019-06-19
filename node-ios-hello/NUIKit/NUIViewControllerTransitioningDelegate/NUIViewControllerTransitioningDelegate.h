//
//  NUIViewControllerTransitioningDelegate.h
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewControllerTransitioningDelegate_h
#define NUIViewControllerTransitioningDelegate_h

#include "NNSObject.h"

#define js_value_UIViewControllerTransitioningDelegate(x) js_value_wrapper(x, UIViewControllerTransitioningDelegate)
#define to_value_UIViewControllerTransitioningDelegate(x) to_value_wrapper(x, UIViewControllerTransitioningDelegate)
#define is_value_UIViewControllerTransitioningDelegate(x) is_value_wrapper(x, UIViewControllerTransitioningDelegate)

JS_WRAP_CLASS(UIViewControllerTransitioningDelegate, NSObject);
  JS_PROP(PresentationControllerFor);
  sweetiekit::JSFunction _presentationControllerFor;
JS_WRAP_CLASS_END(UIViewControllerTransitioningDelegate);

#if __OBJC__
typedef SUIViewControllerTransitioningDelegate UIViewControllerTransitioningDelegate;
#endif

#endif /* NUIViewControllerTransitioningDelegate_h */
