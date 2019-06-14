//
//  NUISplitViewController.h
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUISplitViewController_h
#define NUISplitViewController_h    

#include "NUIViewController.h"

#define js_value_UISplitViewController(x) js_value_wrapper(x, UISplitViewController)
#define to_value_UISplitViewController(x) to_value_wrapper(x, UISplitViewController)
#define is_value_UISplitViewController(x) is_value_wrapper(x, UISplitViewController)

#define js_value_UISplitViewControllerDisplayMode(x) JS_ENUM(UISplitViewControllerDisplayMode, NSInteger, x)
#define to_value_UISplitViewControllerDisplayMode(x) TO_ENUM(UISplitViewControllerDisplayMode, NSInteger, x)
#define is_value_UISplitViewControllerDisplayMode(x) IS_ENUM(UISplitViewControllerDisplayMode, NSInteger, x)

#define js_value_UISplitViewControllerPrimaryEdge(x) JS_ENUM(UISplitViewControllerPrimaryEdge, NSInteger, x)
#define to_value_UISplitViewControllerPrimaryEdge(x) TO_ENUM(UISplitViewControllerPrimaryEdge, NSInteger, x)
#define is_value_UISplitViewControllerPrimaryEdge(x) IS_ENUM(UISplitViewControllerPrimaryEdge, NSInteger, x)

#define js_value_UIInterfaceOrientationMask(x) JS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define to_value_UIInterfaceOrientationMask(x) TO_OPTS(UIInterfaceOrientationMask, NSUInteger, x)
#define is_value_UIInterfaceOrientationMask(x) IS_OPTS(UIInterfaceOrientationMask, NSUInteger, x)

#define js_value_UIInterfaceOrientation(x) JS_ENUM(UIInterfaceOrientation, NSInteger, x)
#define to_value_UIInterfaceOrientation(x) TO_ENUM(UIInterfaceOrientation, NSInteger, x)
#define is_value_UIInterfaceOrientation(x) IS_ENUM(UIInterfaceOrientation, NSInteger, x)

JS_WRAP_CLASS(UISplitViewController, UIViewController);
// UISplitViewController
  JS_METHOD(displayModeButtonItem);
  JS_METHOD(showViewControllerSender);
  JS_METHOD(showDetailViewControllerSender);
// UISplitViewController
  JS_PROP(viewControllers);
  JS_PROP(delegate);
  JS_PROP(presentsWithGesture);
  JS_PROP_READONLY(isCollapsed);
  JS_PROP(preferredDisplayMode);
  JS_PROP_READONLY(displayMode);
  JS_PROP_READONLY(displayModeButtonItem);
  JS_PROP(preferredPrimaryColumnWidthFraction);
  JS_PROP(minimumPrimaryColumnWidth);
  JS_PROP(maximumPrimaryColumnWidth);
  JS_PROP_READONLY(primaryColumnWidth);
  JS_PROP(primaryEdge);
JS_WRAP_CLASS_END(UISplitViewController);

#define JS_EXTEND_CLASS(name, category) \
  JS_WRAP_CLASS(name##_##category, NSObject)

#define JS_EXTEND_CLASS_END(name, category) \
  JS_WRAP_CLASS_END(name##_##category)

// UIViewController
JS_EXTEND_CLASS(UIViewController, UISplitViewController);
  JS_PROP_READONLY(splitViewController);
  JS_METHOD(collapseSecondaryViewControllerForSplitViewController);
  JS_METHOD(separateSecondaryViewControllerForSplitViewController);
JS_EXTEND_CLASS_END(UIViewController, UISplitViewController);

// UISplitViewControllerDelegate
JS_WRAP_PROTOCOL(UISplitViewControllerDelegate, NSObject);
  JS_METHOD(splitViewControllerWillChangeToDisplayMode);
  JS_METHOD(targetDisplayModeForActionInSplitViewController);
  JS_METHOD(splitViewControllerShowViewControllerSender);
  JS_METHOD(splitViewControllerShowDetailViewControllerSender);
  JS_METHOD(primaryViewControllerForCollapsingSplitViewController);
  JS_METHOD(primaryViewControllerForExpandingSplitViewController);
  JS_METHOD(splitViewControllerCollapseSecondaryViewControllerOntoPrimaryViewController);
  JS_METHOD(splitViewControllerSeparateSecondaryViewControllerFromPrimaryViewController);
  JS_METHOD(splitViewControllerSupportedInterfaceOrientations);
  JS_METHOD(splitViewControllerPreferredInterfaceOrientationForPresentation);
  JS_METHOD(splitViewControllerWillHideViewControllerWithBarButtonItemForPopoverController);
  JS_METHOD(splitViewControllerWillShowViewControllerInvalidatingBarButtonItem);
  JS_METHOD(splitViewControllerPopoverControllerWillPresentViewController);
  JS_METHOD(splitViewControllerShouldHideViewControllerInOrientation);
JS_WRAP_PROTOCOL_END(UISplitViewControllerDelegate, NSObject);

#endif /* NUISplitViewController_h */
