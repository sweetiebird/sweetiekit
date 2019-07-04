//
//  NUINavigationControllerDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationControllerDelegate_h
#define NUINavigationControllerDelegate_h    

#include "NNSObject.h"

#define js_value_UINavigationControllerDelegate(x) js_protocol_wrapper(x, UINavigationControllerDelegate)
#define to_value_UINavigationControllerDelegate(x) to_protocol_wrapper(x, UINavigationControllerDelegate)
#define is_value_UINavigationControllerDelegate(x) is_protocol_wrapper(x, UINavigationControllerDelegate)

JS_WRAP_PROTOCOL(UINavigationControllerDelegate, NSObject);
  JS_PROP(navigationControllerWillShowViewControllerAnimated);
  JS_PROP(navigationControllerDidShowViewControllerAnimated);
  JS_PROP(navigationControllerSupportedInterfaceOrientations);
  JS_PROP(navigationControllerPreferredInterfaceOrientationForPresentation);
  JS_PROP(navigationControllerInteractionControllerForAnimationController);
  JS_PROP(navigationControllerAnimationControllerForOperationFromViewControllerToViewController);
JS_WRAP_PROTOCOL_END(UINavigationControllerDelegate, NSObject);

#if __OBJC__
@interface UINavigationControllerDelegateType : NSObject<UINavigationControllerDelegate>

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0);

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0);

@end
#endif

#endif /* NUINavigationControllerDelegate_h */
