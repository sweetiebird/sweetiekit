//
//  NUIPresentationController.h
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPresentationController_h
#define NUIPresentationController_h

#include "NNSObject.h"

#define js_value_UIPresentationController(x) js_value_wrapper(x, UIPresentationController)
#define to_value_UIPresentationController(x) to_value_wrapper(x, UIPresentationController)
#define is_value_UIPresentationController(x) is_value_wrapper(x, UIPresentationController)

JS_WRAP_CLASS(UIPresentationController, NSObject);
  JS_METHOD(initWithPresentedViewControllerPresentingViewController);
  JS_METHOD(adaptivePresentationStyle);
  JS_METHOD(adaptivePresentationStyleForTraitCollection);
  JS_METHOD(containerViewWillLayoutSubviews);
  JS_METHOD(containerViewDidLayoutSubviews);
  JS_METHOD(presentedView);
  JS_METHOD(frameOfPresentedViewInContainerView);
  JS_METHOD(shouldPresentInFullscreen);
  JS_METHOD(shouldRemovePresentersView);
  JS_METHOD(presentationTransitionWillBegin);
  JS_METHOD(presentationTransitionDidEnd);
  JS_METHOD(dismissalTransitionWillBegin);
  JS_METHOD(dismissalTransitionDidEnd);
  JS_PROP_READONLY(presentingViewController);
  JS_PROP_READONLY(presentedViewController);
  JS_PROP_READONLY(presentationStyle);
  JS_PROP_READONLY(containerView);
  JS_PROP(delegate);
  JS_PROP_READONLY(adaptivePresentationStyle);
  JS_PROP_READONLY(presentedView);
  JS_PROP_READONLY(frameOfPresentedViewInContainerView);
  JS_PROP_READONLY(shouldPresentInFullscreen);
  JS_PROP_READONLY(shouldRemovePresentersView);
  JS_PROP(overrideTraitCollection);

JS_WRAP_CLASS_END(UIPresentationController);

#endif /* NUIPresentationController_h */
