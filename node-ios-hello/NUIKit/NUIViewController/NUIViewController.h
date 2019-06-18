//
//  NUIViewController.h
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#include "NUIResponder.h"

#define js_value_UIViewController(x) js_value_wrapper(x, UIViewController)
#define to_value_UIViewController(x) to_value_wrapper(x, UIViewController)
#define is_value_UIViewController(x) is_value_wrapper(x, UIViewController)

// UIKit enums
#define js_value_UIModalTransitionStyle(x) JS_ENUM(UIModalTransitionStyle, NSInteger, x)
#define to_value_UIModalTransitionStyle(x) TO_ENUM(UIModalTransitionStyle, NSInteger, x)
#define is_value_UIModalTransitionStyle(x) IS_ENUM(UIModalTransitionStyle, NSInteger, x)

#define js_value_UIModalPresentationStyle(x) JS_ENUM(UIModalPresentationStyle, NSInteger, x)
#define to_value_UIModalPresentationStyle(x) TO_ENUM(UIModalPresentationStyle, NSInteger, x)
#define is_value_UIModalPresentationStyle(x) IS_ENUM(UIModalPresentationStyle, NSInteger, x)

JS_WRAP_CLASS(UIViewController, UIResponder);
#if OLD
  JS_PROP(View);
  JS_METHOD(PresentViewController);
  JS_METHOD(DismissViewController);
  JS_PROP(TransitioningDelegate);
  JS_PROP(ModalPresentationStyle);
  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
  JS_PROP(toolbarItems);
  JS_PROP(tabBarItem);
  JS_PROP(navigationController);
  JS_PROP(navigationItem);
  JS_PROP(modalPresentationStyle);
  JS_PROP(popoverPresentationController);
  JS_PROP(preferredContentSize);
#endif

  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
  JS_PROP(viewWillLayoutSubviews);
  JS_PROP(viewDidLayoutSubviews);
  
// UIViewController
  JS_STATIC_METHOD(attemptRotationToDeviceOrientation);
#if TODO
// UIPreviewAction
  JS_STATIC_METHOD(actionWithTitleStyleHandler);
// UIPreviewActionGroup
  JS_STATIC_METHOD(actionGroupWithTitleStyleActions);
// UIContentContainer
  JS_METHOD(preferredContentSizeDidChangeForChildContentContainer);
  JS_METHOD(systemLayoutFittingSizeDidChangeForChildContentContainer);
  JS_METHOD(sizeForChildContentContainerWithParentContainerSize);
  JS_METHOD(viewWillTransitionToSizeWithTransitionCoordinator);
  JS_METHOD(willTransitionToTraitCollectionWithTransitionCoordinator);
#endif
// UIViewController
  JS_STATIC_METHOD(initWithNibNameBundle);
  JS_STATIC_METHOD(initWithCoder);
  JS_METHOD(loadView);
  JS_METHOD(loadViewIfNeeded);
  JS_METHOD(viewWillUnload);
  JS_METHOD(viewDidUnload);
  JS_METHOD(viewDidLoad);
  JS_METHOD(isViewLoaded);
  JS_METHOD(performSegueWithIdentifierSender);
  JS_METHOD(shouldPerformSegueWithIdentifierSender);
  JS_METHOD(prepareForSegueSender);
  JS_METHOD(canPerformUnwindSegueActionFromViewControllerWithSender);
  JS_METHOD(allowedChildViewControllersForUnwindingFromSource);
  JS_METHOD(childViewControllerContainingSegueSource);
  JS_METHOD(viewControllerForUnwindSegueActionFromViewControllerWithSender);
  JS_METHOD(unwindForSegueTowardsViewController);
  JS_METHOD(segueForUnwindingToViewControllerFromViewControllerIdentifier);
#if OVERRIDE
  JS_METHOD(viewWillAppear);
  JS_METHOD(viewDidAppear);
  JS_METHOD(viewWillDisappear);
  JS_METHOD(viewDidDisappear);
  JS_METHOD(viewWillLayoutSubviews);
  JS_METHOD(viewDidLayoutSubviews);
#endif
  JS_METHOD(didReceiveMemoryWarning);
//  JS_METHOD(isBeingPresented);
//  JS_METHOD(isBeingDismissed);
//  JS_METHOD(isMovingToParentViewController);
//  JS_METHOD(isMovingFromParentViewController);
  JS_METHOD(presentViewControllerAnimatedCompletion);
  JS_METHOD(dismissViewControllerAnimatedCompletion);
  JS_METHOD(presentModalViewControllerAnimated);
  JS_METHOD(dismissModalViewControllerAnimated);
  JS_METHOD(disablesAutomaticKeyboardDismissal);
  JS_METHOD(preferredStatusBarStyle);
  JS_METHOD(prefersStatusBarHidden);
  JS_METHOD(preferredStatusBarUpdateAnimation);
  JS_METHOD(setNeedsStatusBarAppearanceUpdate);
  JS_METHOD(targetViewControllerForActionSender);
  JS_METHOD(showViewControllerSender);
  JS_METHOD(showDetailViewControllerSender);
  JS_METHOD(setNeedsUserInterfaceAppearanceUpdate);
  JS_METHOD(shouldAutorotateToInterfaceOrientation);
  JS_METHOD(shouldAutorotate);
  JS_METHOD(supportedInterfaceOrientations);
  JS_METHOD(preferredInterfaceOrientationForPresentation);
  JS_METHOD(rotatingHeaderView);
  JS_METHOD(rotatingFooterView);
  JS_METHOD(willRotateToInterfaceOrientationDuration);
  JS_METHOD(didRotateFromInterfaceOrientation);
  JS_METHOD(willAnimateRotationToInterfaceOrientationDuration);
  JS_METHOD(willAnimateFirstHalfOfRotationToInterfaceOrientationDuration);
  JS_METHOD(didAnimateFirstHalfOfRotationToInterfaceOrientation);
  JS_METHOD(willAnimateSecondHalfOfRotationFromInterfaceOrientationDuration);
  JS_METHOD(setEditingAnimated);
  JS_METHOD(editButtonItem);
  JS_METHOD(addChildViewController);
  JS_METHOD(removeFromParentViewController);
  JS_METHOD(transitionFromViewControllerToViewControllerDurationOptionsAnimationsCompletion);
  JS_METHOD(beginAppearanceTransitionAnimated);
  JS_METHOD(endAppearanceTransition);
  JS_METHOD(childViewControllerForStatusBarStyle);
  JS_METHOD(childViewControllerForStatusBarHidden);
  JS_METHOD(setOverrideTraitCollectionForChildViewController);
  JS_METHOD(overrideTraitCollectionForChildViewController);
  JS_METHOD(automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers);
  JS_METHOD(shouldAutomaticallyForwardRotationMethods);
  JS_METHOD(shouldAutomaticallyForwardAppearanceMethods);
  JS_METHOD(willMoveToParentViewController);
  JS_METHOD(didMoveToParentViewController);
  JS_METHOD(encodeRestorableStateWithCoder);
  JS_METHOD(decodeRestorableStateWithCoder);
  JS_METHOD(applicationFinishedRestoringState);
  JS_METHOD(updateViewConstraints);
  JS_METHOD(viewLayoutMarginsDidChange);
  JS_METHOD(viewSafeAreaInsetsDidChange);
  JS_METHOD(addKeyCommand);
  JS_METHOD(removeKeyCommand);
#if TODO
// UIViewControllerPreviewingDelegate
  JS_METHOD(previewingContextViewControllerForLocation);
  JS_METHOD(previewingContextCommitViewController);
#endif
// UIViewController
  JS_METHOD(registerForPreviewingWithDelegateSourceView);
  JS_METHOD(unregisterForPreviewingWithContext);
  JS_METHOD(setNeedsUpdateOfScreenEdgesDeferringSystemGestures);
  JS_METHOD(setNeedsUpdateOfHomeIndicatorAutoHidden);
  JS_METHOD(previewActionItems);
#if TODO
// UIContentContainer
  JS_PROP_READONLY(preferredContentSize);
#endif
// UIViewController
  JS_PROP(view);
  JS_PROP_READONLY(viewIfLoaded);
  JS_PROP_READONLY(isViewLoaded);
  JS_PROP_READONLY(nibName);
  JS_PROP_READONLY(nibBundle);
  JS_PROP_READONLY(storyboard);
  JS_PROP(title);
  JS_PROP_READONLY(parentViewController);
  JS_PROP_READONLY(modalViewController);
  JS_PROP_READONLY(presentedViewController);
  JS_PROP_READONLY(presentingViewController);
  JS_PROP(definesPresentationContext);
  JS_PROP(providesPresentationContextTransitionStyle);
  JS_PROP(restoresFocusAfterTransition);
  JS_PROP_READONLY(isBeingPresented);
  JS_PROP_READONLY(isBeingDismissed);
  JS_PROP_READONLY(isMovingToParentViewController);
  JS_PROP_READONLY(isMovingFromParentViewController);
  JS_PROP(modalTransitionStyle);
  JS_PROP(modalPresentationStyle);
  JS_PROP(modalPresentationCapturesStatusBarAppearance);
  JS_PROP_READONLY(disablesAutomaticKeyboardDismissal);
  JS_PROP(wantsFullScreenLayout);
  JS_PROP(edgesForExtendedLayout);
  JS_PROP(extendedLayoutIncludesOpaqueBars);
  JS_PROP(automaticallyAdjustsScrollViewInsets);
  JS_PROP(preferredContentSize);
  JS_PROP_READONLY(preferredStatusBarStyle);
  JS_PROP_READONLY(prefersStatusBarHidden);
  JS_PROP_READONLY(preferredStatusBarUpdateAnimation);
  JS_PROP_READONLY(preferredUserInterfaceStyle);
  JS_PROP_READONLY(shouldAutorotate);
  JS_PROP_READONLY(supportedInterfaceOrientations);
  JS_PROP_READONLY(preferredInterfaceOrientationForPresentation);
  JS_PROP_READONLY(interfaceOrientation);
  JS_PROP(isEditing);
  JS_PROP_READONLY(editButtonItem);
  JS_PROP_READONLY(searchDisplayController);
  JS_PROP_READONLY(childViewControllers);
  JS_PROP_READONLY(childViewControllerForStatusBarStyle);
  JS_PROP_READONLY(childViewControllerForStatusBarHidden);
  JS_PROP_READONLY(childViewControllerForUserInterfaceStyle);
  JS_PROP_READONLY(shouldAutomaticallyForwardAppearanceMethods);
  JS_PROP(restorationIdentifier);
  JS_PROP(restorationClass);
  JS_PROP(transitioningDelegate);
  JS_PROP_READONLY(topLayoutGuide);
  JS_PROP_READONLY(bottomLayoutGuide);
  JS_PROP(additionalSafeAreaInsets);
  JS_PROP_READONLY(systemMinimumLayoutMargins);
  JS_PROP(viewRespectsSystemMinimumLayoutMargins);
  JS_PROP_READONLY(extensionContext);
  JS_PROP_READONLY(presentationController);
  JS_PROP_READONLY(popoverPresentationController);
#if TODO
// UIViewControllerPreviewing
  JS_PROP_READONLY(previewingGestureRecognizerForFailureRelationship);
  JS_PROP_READONLY(delegate);
  JS_PROP_READONLY(sourceView);
  JS_PROP(sourceRect);
#endif
// UIViewController
  JS_PROP_READONLY(childViewControllerForScreenEdgesDeferringSystemGestures);
  JS_PROP_READONLY(preferredScreenEdgesDeferringSystemGestures);
  JS_PROP_READONLY(childViewControllerForHomeIndicatorAutoHidden);
  JS_PROP_READONLY(prefersHomeIndicatorAutoHidden);
  JS_PROP_READONLY(previewActionItems);
#if TODO
// UIPreviewActionItem
  JS_PROP_READONLY(title);
// UIPreviewAction
  JS_PROP_READONLY(id<UIPreviewActionItem>(action, UIViewController, previewViewController));
#endif

JS_WRAP_CLASS_END(UIViewController);

#endif /* NUIViewController_h */
