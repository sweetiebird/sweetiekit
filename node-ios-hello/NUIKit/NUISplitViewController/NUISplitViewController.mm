//
//  NUISplitViewController.mm
//
//  Created by Shawn Presser on 6/12/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISplitViewController.h"

#define instancetype UISplitViewController
#define js_value_instancetype js_value_UISplitViewController

NUISplitViewController::NUISplitViewController() {}
NUISplitViewController::~NUISplitViewController() {}

#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUISplitViewControllerDelegate::type;

JS_INIT_CLASS(UISplitViewController, UIViewController);
  // instance members (proto)

// UISplitViewController
  JS_ASSIGN_PROTO_METHOD(displayModeButtonItem);
  JS_ASSIGN_PROTO_METHOD(showViewControllerSender);
  JS_ASSIGN_PROTO_METHOD(showDetailViewControllerSender);
// UISplitViewControllerDelegate
  {
    JS_WITH_TYPE(UISplitViewControllerDelegate);
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerWillChangeToDisplayMode, "splitViewControllerWillChangeToDisplayMode");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::targetDisplayModeForActionInSplitViewController, "targetDisplayModeForActionInSplitViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerShowViewControllerSender, "splitViewControllerShowViewControllerSender");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerShowDetailViewControllerSender, "splitViewControllerShowDetailViewControllerSender");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::primaryViewControllerForCollapsingSplitViewController, "primaryViewControllerForCollapsingSplitViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::primaryViewControllerForExpandingSplitViewController, "primaryViewControllerForExpandingSplitViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerCollapseSecondaryViewControllerOntoPrimaryViewController, "splitViewControllerCollapseSecondaryViewControllerOntoPrimaryViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerSeparateSecondaryViewControllerFromPrimaryViewController, "splitViewControllerSeparateSecondaryViewControllerFromPrimaryViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerSupportedInterfaceOrientations, "splitViewControllerSupportedInterfaceOrientations");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerPreferredInterfaceOrientationForPresentation, "splitViewControllerPreferredInterfaceOrientationForPresentation");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerWillHideViewControllerWithBarButtonItemForPopoverController, "splitViewControllerWillHideViewControllerWithBarButtonItemForPopoverController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerWillShowViewControllerInvalidatingBarButtonItem, "splitViewControllerWillShowViewControllerInvalidatingBarButtonItem");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerPopoverControllerWillPresentViewController, "splitViewControllerPopoverControllerWillPresentViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUISplitViewControllerDelegate::splitViewControllerShouldHideViewControllerInOrientation, "splitViewControllerShouldHideViewControllerInOrientation");
  }
// UIViewController
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_METHOD_AS(NUIViewController_UISplitViewController::collapseSecondaryViewControllerForSplitViewController, "collapseSecondaryViewControllerForSplitViewController");
    JS_ASSIGN_PROTO_METHOD_AS(NUIViewController_UISplitViewController::separateSecondaryViewControllerForSplitViewController, "separateSecondaryViewControllerForSplitViewController");
  }
// UISplitViewController
  JS_ASSIGN_PROTO_PROP(viewControllers);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(presentsWithGesture);
  JS_ASSIGN_PROTO_PROP_READONLY(isCollapsed);
  JS_ASSIGN_PROTO_PROP(preferredDisplayMode);
  JS_ASSIGN_PROTO_PROP_READONLY(displayMode);
  JS_ASSIGN_PROTO_PROP_READONLY(displayModeButtonItem);
  JS_ASSIGN_PROTO_PROP(preferredPrimaryColumnWidthFraction);
  JS_ASSIGN_PROTO_PROP(minimumPrimaryColumnWidth);
  JS_ASSIGN_PROTO_PROP(maximumPrimaryColumnWidth);
  JS_ASSIGN_PROTO_PROP_READONLY(primaryColumnWidth);
  JS_ASSIGN_PROTO_PROP(primaryEdge);
// UIViewController
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NUIViewController_UISplitViewController::splitViewController, "splitViewController");
  }

  // static members (ctor)
  JS_INIT_CTOR(UISplitViewController, UIViewController);
  // constant values (exports)

//typedef NS_ENUM(NSInteger, UISplitViewControllerDisplayMode) {
  JS_ASSIGN_ENUM(UISplitViewControllerDisplayModeAutomatic, NSInteger);
  JS_ASSIGN_ENUM(UISplitViewControllerDisplayModePrimaryHidden, NSInteger);
  JS_ASSIGN_ENUM(UISplitViewControllerDisplayModeAllVisible, NSInteger);
  JS_ASSIGN_ENUM(UISplitViewControllerDisplayModePrimaryOverlay, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(8_0);

//typedef NS_ENUM(NSInteger, UISplitViewControllerPrimaryEdge) {
  JS_ASSIGN_ENUM(UISplitViewControllerPrimaryEdgeLeading, NSInteger);
  JS_ASSIGN_ENUM(UISplitViewControllerPrimaryEdgeTrailing, NSInteger);
//} API_AVAILABLE(ios(11.0), tvos(11.0));

JS_INIT_CLASS_END(UISplitViewController, UIViewController);

NAN_METHOD(NUISplitViewController::New) {
  JS_RECONSTRUCT(UISplitViewController);
  @autoreleasepool {
    UISplitViewController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UISplitViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UISplitViewController alloc] init];
    }
    if (self) {
      NUISplitViewController *wrapper = new NUISplitViewController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISplitViewController::New: invalid arguments");
    }
  }
}

#include "NUIBarButtonItem.h"

NAN_METHOD(NUISplitViewController::displayModeButtonItem) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self displayModeButtonItem]));
  }
}

NAN_METHOD(NUISplitViewController::showViewControllerSender) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    [self showViewController: vc sender: sender];
  }
}

NAN_METHOD(NUISplitViewController::showDetailViewControllerSender) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    [self showDetailViewController: vc sender: sender];
  }
}
/*
@interface UISplitViewControllerDelegate : NSObject<UISplitViewControllerDelegate>
@end

@implementation UISplitViewControllerDelegate
@end*/

#define JS_UNWRAP_PROTOCOL(type, name) \
  JS_UNWRAP_(id, name##_); \
  id<type> name(name##_);
  

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerWillChangeToDisplayMode) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    declare_value(UISplitViewControllerDisplayMode, displayMode);
    [self splitViewController: svc willChangeToDisplayMode: displayMode];
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::targetDisplayModeForActionInSplitViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    JS_SET_RETURN(js_value_UISplitViewControllerDisplayMode([self targetDisplayModeForActionInSplitViewController: svc]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerShowViewControllerSender) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self splitViewController: splitViewController showViewController: vc sender: sender]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerShowDetailViewControllerSender) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self splitViewController: splitViewController showDetailViewController: vc sender: sender]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::primaryViewControllerForCollapsingSplitViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    JS_SET_RETURN(js_value_UIViewController([self primaryViewControllerForCollapsingSplitViewController: splitViewController]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::primaryViewControllerForExpandingSplitViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    JS_SET_RETURN(js_value_UIViewController([self primaryViewControllerForExpandingSplitViewController: splitViewController]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerCollapseSecondaryViewControllerOntoPrimaryViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    declare_pointer(UIViewController, secondaryViewController);
    declare_pointer(UIViewController, primaryViewController);
    JS_SET_RETURN(js_value_BOOL([self splitViewController: splitViewController collapseSecondaryViewController: secondaryViewController ontoPrimaryViewController: primaryViewController]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerSeparateSecondaryViewControllerFromPrimaryViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    declare_pointer(UIViewController, primaryViewController);
    JS_SET_RETURN(js_value_UIViewController([self splitViewController: splitViewController separateSecondaryViewControllerFromPrimaryViewController: primaryViewController]));
  }
}

#include "NUIApplication.h"

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerSupportedInterfaceOrientations) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    JS_SET_RETURN(js_value_UIInterfaceOrientationMask([self splitViewControllerSupportedInterfaceOrientations: splitViewController]));
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerPreferredInterfaceOrientationForPresentation) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self splitViewControllerPreferredInterfaceOrientationForPresentation: splitViewController]));
  }
}

#include "NUIPopoverController.h"

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerWillHideViewControllerWithBarButtonItemForPopoverController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    declare_pointer(UIViewController, aViewController);
    declare_pointer(UIBarButtonItem, barButtonItem);
    declare_pointer(UIPopoverController, pc);
    [self splitViewController: svc willHideViewController: aViewController withBarButtonItem: barButtonItem forPopoverController: pc];
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerWillShowViewControllerInvalidatingBarButtonItem) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    declare_pointer(UIViewController, aViewController);
    declare_pointer(UIBarButtonItem, barButtonItem);
    [self splitViewController: svc willShowViewController: aViewController invalidatingBarButtonItem: barButtonItem];
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerPopoverControllerWillPresentViewController) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    declare_pointer(UIPopoverController, pc);
    declare_pointer(UIViewController, aViewController);
    [self splitViewController: svc popoverController: pc willPresentViewController: aViewController];
  }
}

NAN_METHOD(NUISplitViewControllerDelegate::splitViewControllerShouldHideViewControllerInOrientation) {
  JS_UNWRAP_PROTOCOL(UISplitViewControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, svc);
    declare_pointer(UIViewController, vc);
    declare_value(UIInterfaceOrientation, orientation);
    JS_SET_RETURN(js_value_BOOL([self splitViewController: svc shouldHideViewController: vc inOrientation: orientation]));
  }
}

NAN_METHOD(NUIViewController_UISplitViewController::collapseSecondaryViewControllerForSplitViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, secondaryViewController);
    declare_pointer(UISplitViewController, splitViewController);
    [self collapseSecondaryViewController: secondaryViewController forSplitViewController: splitViewController];
  }
}

NAN_METHOD(NUIViewController_UISplitViewController::separateSecondaryViewControllerForSplitViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UISplitViewController, splitViewController);
    JS_SET_RETURN(js_value_UIViewController([self separateSecondaryViewControllerForSplitViewController: splitViewController]));
  }
}

NAN_GETTER(NUISplitViewController::viewControllersGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self viewControllers]));
  }
}

NAN_SETTER(NUISplitViewController::viewControllersSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIViewController*>, input);
    [self setViewControllers: input];
  }
}

NAN_GETTER(NUISplitViewController::delegateGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id /*<UISplitViewControllerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUISplitViewController::delegateSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UISplitViewControllerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUISplitViewController::presentsWithGestureGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self presentsWithGesture]));
  }
}

NAN_SETTER(NUISplitViewController::presentsWithGestureSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPresentsWithGesture: input];
  }
}

NAN_GETTER(NUISplitViewController::isCollapsedGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCollapsed]));
  }
}

NAN_GETTER(NUISplitViewController::preferredDisplayModeGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISplitViewControllerDisplayMode([self preferredDisplayMode]));
  }
}

NAN_SETTER(NUISplitViewController::preferredDisplayModeSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UISplitViewControllerDisplayMode, input);
    [self setPreferredDisplayMode: input];
  }
}

NAN_GETTER(NUISplitViewController::displayModeGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISplitViewControllerDisplayMode([self displayMode]));
  }
}

NAN_GETTER(NUISplitViewController::displayModeButtonItemGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self displayModeButtonItem]));
  }
}

NAN_GETTER(NUISplitViewController::preferredPrimaryColumnWidthFractionGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self preferredPrimaryColumnWidthFraction]));
  }
}

NAN_SETTER(NUISplitViewController::preferredPrimaryColumnWidthFractionSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setPreferredPrimaryColumnWidthFraction: input];
  }
}

NAN_GETTER(NUISplitViewController::minimumPrimaryColumnWidthGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumPrimaryColumnWidth]));
  }
}

NAN_SETTER(NUISplitViewController::minimumPrimaryColumnWidthSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumPrimaryColumnWidth: input];
  }
}

NAN_GETTER(NUISplitViewController::maximumPrimaryColumnWidthGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumPrimaryColumnWidth]));
  }
}

NAN_SETTER(NUISplitViewController::maximumPrimaryColumnWidthSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumPrimaryColumnWidth: input];
  }
}

NAN_GETTER(NUISplitViewController::primaryColumnWidthGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self primaryColumnWidth]));
  }
}

NAN_GETTER(NUISplitViewController::primaryEdgeGetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISplitViewControllerPrimaryEdge([self primaryEdge]));
  }
}

NAN_SETTER(NUISplitViewController::primaryEdgeSetter) {
  JS_UNWRAP(UISplitViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UISplitViewControllerPrimaryEdge, input);
    [self setPrimaryEdge: input];
  }
}

NAN_GETTER(NUIViewController_UISplitViewController::splitViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISplitViewController([self splitViewController]));
  }
}

