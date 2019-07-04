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
  JS_PROP(animationControllerForPresentedControllerPresentingControllerSourceController);
  JS_PROP(animationControllerForDismissedController);
  JS_PROP(interactionControllerForPresentation);
  JS_PROP(interactionControllerForDismissal);
  JS_PROP(presentationControllerForPresentedViewControllerPresentingViewControllerSourceViewController);
JS_WRAP_CLASS_END(UIViewControllerTransitioningDelegate);

#if __OBJC__
@interface UIViewControllerTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0);

@end
#endif

#endif /* NUIViewControllerTransitioningDelegate_h */
