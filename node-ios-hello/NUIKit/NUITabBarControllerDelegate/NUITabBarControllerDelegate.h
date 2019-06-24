//
//  NUITabBarControllerDelegate.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITabBarControllerDelegate_h
#define NUITabBarControllerDelegate_h    

#include "NNSObject.h"

#define js_value_UITabBarControllerDelegate(x) js_value_wrapper(x, UITabBarControllerDelegate)
#define to_value_UITabBarControllerDelegate(x) to_value_wrapper(x, UITabBarControllerDelegate)
#define is_value_UITabBarControllerDelegate(x) is_value_wrapper(x, UITabBarControllerDelegate)

JS_WRAP_CLASS(UITabBarControllerDelegate, NSObject);
  JS_PROP(tabBarControllerShouldSelectViewController);
  JS_PROP(tabBarControllerDidSelectViewController);
  JS_PROP(tabBarControllerWillBeginCustomizingViewControllers);
  JS_PROP(tabBarControllerWillEndCustomizingViewControllersChanged);
  JS_PROP(tabBarControllerDidEndCustomizingViewControllersChanged);
  JS_PROP(tabBarControllerSupportedInterfaceOrientations);
  JS_PROP(tabBarControllerPreferredInterfaceOrientationForPresentation);
  JS_PROP(tabBarControllerInteractionControllerForAnimationController);
  JS_PROP(tabBarControllerAnimationControllerForTransitionFromViewControllerToViewController);
JS_WRAP_CLASS_END(UITabBarControllerDelegate);

#if __OBJC__
@interface UITabBarControllerDelegate : NSObject<UITabBarControllerDelegate>

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0);
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED;
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed __TVOS_PROHIBITED;

- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;

- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                      interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController NS_AVAILABLE_IOS(7_0);

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0);

@end
#endif

#endif /* NUITabBarControllerDelegate_h */
