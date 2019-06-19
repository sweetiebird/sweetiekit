//
//  NUIViewController.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewController.h"

#define instancetype UIViewController
#define js_value_instancetype js_value_UIViewController

NUIViewController::NUIViewController() {}
NUIViewController::~NUIViewController() {}

JS_INIT_CLASS(UIViewController, UIResponder);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(viewDidAppear);
  JS_ASSIGN_PROTO_PROP(viewWillAppear);
  JS_ASSIGN_PROTO_PROP(viewDidDisappear);
  JS_ASSIGN_PROTO_PROP(viewWillDisappear);
  JS_ASSIGN_PROTO_PROP(viewWillLayoutSubviews);
  JS_ASSIGN_PROTO_PROP(viewDidLayoutSubviews);

// UIViewController
  JS_ASSIGN_STATIC_METHOD(attemptRotationToDeviceOrientation);
#if TODO
// UIPreviewAction
  JS_ASSIGN_STATIC_METHOD(actionWithTitleStyleHandler);
// UIPreviewActionGroup
  JS_ASSIGN_STATIC_METHOD(actionGroupWithTitleStyleActions);
// UIContentContainer
  JS_ASSIGN_PROTO_METHOD(preferredContentSizeDidChangeForChildContentContainer);
  JS_ASSIGN_PROTO_METHOD(systemLayoutFittingSizeDidChangeForChildContentContainer);
  JS_ASSIGN_PROTO_METHOD(sizeForChildContentContainerWithParentContainerSize);
  JS_ASSIGN_PROTO_METHOD(viewWillTransitionToSizeWithTransitionCoordinator);
  JS_ASSIGN_PROTO_METHOD(willTransitionToTraitCollectionWithTransitionCoordinator);
#endif
// UIViewController
  JS_ASSIGN_PROTO_METHOD(initWithNibNameBundle);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
  JS_ASSIGN_PROTO_METHOD(loadView);
  JS_ASSIGN_PROTO_METHOD(loadViewIfNeeded);
  JS_ASSIGN_PROTO_METHOD(viewWillUnload);
  JS_ASSIGN_PROTO_METHOD(viewDidUnload);
  JS_ASSIGN_PROTO_METHOD(viewDidLoad);
  JS_ASSIGN_PROTO_METHOD(isViewLoaded);
  JS_ASSIGN_PROTO_METHOD(performSegueWithIdentifierSender);
  JS_ASSIGN_PROTO_METHOD(shouldPerformSegueWithIdentifierSender);
  JS_ASSIGN_PROTO_METHOD(prepareForSegueSender);
  JS_ASSIGN_PROTO_METHOD(canPerformUnwindSegueActionFromViewControllerWithSender);
  JS_ASSIGN_PROTO_METHOD(allowedChildViewControllersForUnwindingFromSource);
  JS_ASSIGN_PROTO_METHOD(childViewControllerContainingSegueSource);
  JS_ASSIGN_PROTO_METHOD(viewControllerForUnwindSegueActionFromViewControllerWithSender);
  JS_ASSIGN_PROTO_METHOD(unwindForSegueTowardsViewController);
  JS_ASSIGN_PROTO_METHOD(segueForUnwindingToViewControllerFromViewControllerIdentifier);
#if OVERRIDE
  JS_ASSIGN_PROTO_METHOD(viewWillAppear);
  JS_ASSIGN_PROTO_METHOD(viewDidAppear);
  JS_ASSIGN_PROTO_METHOD(viewWillDisappear);
  JS_ASSIGN_PROTO_METHOD(viewDidDisappear);
  JS_ASSIGN_PROTO_METHOD(viewWillLayoutSubviews);
  JS_ASSIGN_PROTO_METHOD(viewDidLayoutSubviews);
#endif
  JS_ASSIGN_PROTO_METHOD(didReceiveMemoryWarning);
//  JS_ASSIGN_PROTO_METHOD(isBeingPresented);
//  JS_ASSIGN_PROTO_METHOD(isBeingDismissed);
//  JS_ASSIGN_PROTO_METHOD(isMovingToParentViewController);
//  JS_ASSIGN_PROTO_METHOD(isMovingFromParentViewController);
  JS_ASSIGN_PROTO_METHOD(presentViewControllerAnimatedCompletion);
  JS_ASSIGN_PROTO_METHOD(dismissViewControllerAnimatedCompletion);
  JS_ASSIGN_PROTO_METHOD(presentModalViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(dismissModalViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(disablesAutomaticKeyboardDismissal);
  JS_ASSIGN_PROTO_METHOD(preferredStatusBarStyle);
  JS_ASSIGN_PROTO_METHOD(prefersStatusBarHidden);
  JS_ASSIGN_PROTO_METHOD(preferredStatusBarUpdateAnimation);
  JS_ASSIGN_PROTO_METHOD(setNeedsStatusBarAppearanceUpdate);
  JS_ASSIGN_PROTO_METHOD(targetViewControllerForActionSender);
  JS_ASSIGN_PROTO_METHOD(showViewControllerSender);
  JS_ASSIGN_PROTO_METHOD(showDetailViewControllerSender);
#ifndef __IPHONEOS__
  JS_ASSIGN_PROTO_METHOD(setNeedsUserInterfaceAppearanceUpdate);
#endif
  JS_ASSIGN_PROTO_METHOD(shouldAutorotateToInterfaceOrientation);
  JS_ASSIGN_PROTO_METHOD(shouldAutorotate);
  JS_ASSIGN_PROTO_METHOD(supportedInterfaceOrientations);
  JS_ASSIGN_PROTO_METHOD(preferredInterfaceOrientationForPresentation);
  JS_ASSIGN_PROTO_METHOD(rotatingHeaderView);
  JS_ASSIGN_PROTO_METHOD(rotatingFooterView);
  JS_ASSIGN_PROTO_METHOD(willRotateToInterfaceOrientationDuration);
  JS_ASSIGN_PROTO_METHOD(didRotateFromInterfaceOrientation);
  JS_ASSIGN_PROTO_METHOD(willAnimateRotationToInterfaceOrientationDuration);
  JS_ASSIGN_PROTO_METHOD(willAnimateFirstHalfOfRotationToInterfaceOrientationDuration);
  JS_ASSIGN_PROTO_METHOD(didAnimateFirstHalfOfRotationToInterfaceOrientation);
  JS_ASSIGN_PROTO_METHOD(willAnimateSecondHalfOfRotationFromInterfaceOrientationDuration);
  JS_ASSIGN_PROTO_METHOD(setEditingAnimated);
  JS_ASSIGN_PROTO_METHOD(editButtonItem);
  JS_ASSIGN_PROTO_METHOD(addChildViewController);
  JS_ASSIGN_PROTO_METHOD(removeFromParentViewController);
  JS_ASSIGN_PROTO_METHOD(transitionFromViewControllerToViewControllerDurationOptionsAnimationsCompletion);
  JS_ASSIGN_PROTO_METHOD(beginAppearanceTransitionAnimated);
  JS_ASSIGN_PROTO_METHOD(endAppearanceTransition);
  JS_ASSIGN_PROTO_METHOD(childViewControllerForStatusBarStyle);
  JS_ASSIGN_PROTO_METHOD(childViewControllerForStatusBarHidden);
  JS_ASSIGN_PROTO_METHOD(setOverrideTraitCollectionForChildViewController);
  JS_ASSIGN_PROTO_METHOD(overrideTraitCollectionForChildViewController);
  JS_ASSIGN_PROTO_METHOD(automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers);
  JS_ASSIGN_PROTO_METHOD(shouldAutomaticallyForwardRotationMethods);
  JS_ASSIGN_PROTO_METHOD(shouldAutomaticallyForwardAppearanceMethods);
  JS_ASSIGN_PROTO_METHOD(willMoveToParentViewController);
  JS_ASSIGN_PROTO_METHOD(didMoveToParentViewController);
  JS_ASSIGN_PROTO_METHOD(encodeRestorableStateWithCoder);
  JS_ASSIGN_PROTO_METHOD(decodeRestorableStateWithCoder);
  JS_ASSIGN_PROTO_METHOD(applicationFinishedRestoringState);
  JS_ASSIGN_PROTO_METHOD(updateViewConstraints);
  JS_ASSIGN_PROTO_METHOD(viewLayoutMarginsDidChange);
  JS_ASSIGN_PROTO_METHOD(viewSafeAreaInsetsDidChange);
  JS_ASSIGN_PROTO_METHOD(addKeyCommand);
  JS_ASSIGN_PROTO_METHOD(removeKeyCommand);
#if TODO
// UIViewControllerPreviewingDelegate
  JS_ASSIGN_PROTO_METHOD(previewingContextViewControllerForLocation);
  JS_ASSIGN_PROTO_METHOD(previewingContextCommitViewController);
#endif
// UIViewController
  JS_ASSIGN_PROTO_METHOD(registerForPreviewingWithDelegateSourceView);
  JS_ASSIGN_PROTO_METHOD(unregisterForPreviewingWithContext);
  JS_ASSIGN_PROTO_METHOD(setNeedsUpdateOfScreenEdgesDeferringSystemGestures);
  JS_ASSIGN_PROTO_METHOD(setNeedsUpdateOfHomeIndicatorAutoHidden);
  JS_ASSIGN_PROTO_METHOD(previewActionItems);
#if TODO
// UIContentContainer
  JS_ASSIGN_PROTO_PROP_READONLY(preferredContentSize);
#endif
// UIViewController
  JS_ASSIGN_PROTO_PROP(view);
  JS_ASSIGN_PROTO_PROP_READONLY(viewIfLoaded);
  JS_ASSIGN_PROTO_PROP_READONLY(isViewLoaded);
  JS_ASSIGN_PROTO_PROP_READONLY(nibName);
  JS_ASSIGN_PROTO_PROP_READONLY(nibBundle);
  JS_ASSIGN_PROTO_PROP_READONLY(storyboard);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP_READONLY(parentViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(modalViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(presentedViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(presentingViewController);
  JS_ASSIGN_PROTO_PROP(definesPresentationContext);
  JS_ASSIGN_PROTO_PROP(providesPresentationContextTransitionStyle);
  JS_ASSIGN_PROTO_PROP(restoresFocusAfterTransition);
  JS_ASSIGN_PROTO_PROP_READONLY(isBeingPresented);
  JS_ASSIGN_PROTO_PROP_READONLY(isBeingDismissed);
  JS_ASSIGN_PROTO_PROP_READONLY(isMovingToParentViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(isMovingFromParentViewController);
  JS_ASSIGN_PROTO_PROP(modalTransitionStyle);
  JS_ASSIGN_PROTO_PROP(modalPresentationStyle);
  JS_ASSIGN_PROTO_PROP(modalPresentationCapturesStatusBarAppearance);
  JS_ASSIGN_PROTO_PROP_READONLY(disablesAutomaticKeyboardDismissal);
  JS_ASSIGN_PROTO_PROP(wantsFullScreenLayout);
  JS_ASSIGN_PROTO_PROP(edgesForExtendedLayout);
  JS_ASSIGN_PROTO_PROP(extendedLayoutIncludesOpaqueBars);
  JS_ASSIGN_PROTO_PROP(automaticallyAdjustsScrollViewInsets);
  JS_ASSIGN_PROTO_PROP(preferredContentSize);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredStatusBarStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(prefersStatusBarHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredStatusBarUpdateAnimation);
#ifdef __TVOS__
  JS_ASSIGN_PROTO_PROP_READONLY(preferredUserInterfaceStyle);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(shouldAutorotate);
  JS_ASSIGN_PROTO_PROP_READONLY(supportedInterfaceOrientations);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredInterfaceOrientationForPresentation);
  JS_ASSIGN_PROTO_PROP_READONLY(interfaceOrientation);
  JS_ASSIGN_PROTO_PROP(isEditing);
  JS_ASSIGN_PROTO_PROP_READONLY(editButtonItem);
#if DEPRECATED
  JS_ASSIGN_PROTO_PROP_READONLY(searchDisplayController);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllers);
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllerForStatusBarStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllerForStatusBarHidden);
#ifdef __TVOS__
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllerForUserInterfaceStyle);
#endif
  JS_ASSIGN_PROTO_PROP_READONLY(shouldAutomaticallyForwardAppearanceMethods);
  JS_ASSIGN_PROTO_PROP(restorationIdentifier);
  JS_ASSIGN_PROTO_PROP(restorationClass);
  JS_ASSIGN_PROTO_PROP(transitioningDelegate);
  JS_ASSIGN_PROTO_PROP_READONLY(topLayoutGuide);
  JS_ASSIGN_PROTO_PROP_READONLY(bottomLayoutGuide);
  JS_ASSIGN_PROTO_PROP(additionalSafeAreaInsets);
  JS_ASSIGN_PROTO_PROP_READONLY(systemMinimumLayoutMargins);
  JS_ASSIGN_PROTO_PROP(viewRespectsSystemMinimumLayoutMargins);
  JS_ASSIGN_PROTO_PROP_READONLY(extensionContext);
  JS_ASSIGN_PROTO_PROP_READONLY(presentationController);
  JS_ASSIGN_PROTO_PROP_READONLY(popoverPresentationController);
#if TODO
// UIViewControllerPreviewing
  JS_ASSIGN_PROTO_PROP_READONLY(previewingGestureRecognizerForFailureRelationship);
  JS_ASSIGN_PROTO_PROP_READONLY(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(sourceView);
  JS_ASSIGN_PROTO_PROP(sourceRect);
#endif
// UIViewController
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllerForScreenEdgesDeferringSystemGestures);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredScreenEdgesDeferringSystemGestures);
  JS_ASSIGN_PROTO_PROP_READONLY(childViewControllerForHomeIndicatorAutoHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(prefersHomeIndicatorAutoHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(previewActionItems);
#if TODO
// UIPreviewActionItem
  JS_ASSIGN_PROTO_PROP_READONLY(title);
// UIPreviewAction
  JS_ASSIGN_PROTO_PROP_READONLY(id<UIPreviewActionItem>(action, UIViewController, previewViewController));
#endif


  // static members (ctor)
  JS_INIT_CTOR(UIViewController, UIResponder);
  // constants (exports)
  
//typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
  JS_ASSIGN_ENUM(UIModalTransitionStyleCoverVertical, NSInteger); // = 0,
  JS_ASSIGN_ENUM(UIModalTransitionStyleFlipHorizontal, NSInteger); // __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalTransitionStyleCrossDissolve, NSInteger); //,
  JS_ASSIGN_ENUM(UIModalTransitionStylePartialCurl, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//};

//typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
  JS_ASSIGN_ENUM(UIModalPresentationFullScreen, NSInteger); // = 0,
  JS_ASSIGN_ENUM(UIModalPresentationPageSheet, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalPresentationFormSheet, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalPresentationCurrentContext, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2),
  JS_ASSIGN_ENUM(UIModalPresentationCustom, NSInteger); // NS_ENUM_AVAILABLE_IOS(7_0),
  JS_ASSIGN_ENUM(UIModalPresentationOverFullScreen, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0),
  JS_ASSIGN_ENUM(UIModalPresentationOverCurrentContext, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0),
  JS_ASSIGN_ENUM(UIModalPresentationPopover, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
#ifdef __TVOS__
  JS_ASSIGN_ENUM(UIModalPresentationBlurOverFullScreen, NSInteger); // __TVOS_AVAILABLE(11_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
#endif
  JS_ASSIGN_ENUM(UIModalPresentationNone, NSInteger); // NS_ENUM_AVAILABLE_IOS(7_0) = -1,
//};

JS_INIT_CLASS_END(UIViewController, UIResponder);

NAN_METHOD(NUIViewController::New) {
  JS_RECONSTRUCT(UIViewController);
  @autoreleasepool {
    UIViewController* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIViewController alloc]; // TODO: init causes layout issues
    }
    if (self) {
      NUIViewController *wrapper = new NUIViewController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewController::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIViewController::viewDidAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewDidAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidAppear"];
  }
}

NAN_GETTER(NUIViewController::viewWillAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewWillAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillAppear"];
  }
}

NAN_GETTER(NUIViewController::viewDidDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewDidDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidDisappear"];
  }
}

NAN_GETTER(NUIViewController::viewWillDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewWillDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillDisappear"];
  }
}

NAN_GETTER(NUIViewController::viewWillLayoutSubviewsGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillLayoutSubviews"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewWillLayoutSubviewsSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillLayoutSubviews"];
  }
}

NAN_GETTER(NUIViewController::viewDidLayoutSubviewsGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidLayoutSubviews"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewDidLayoutSubviewsSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidLayoutSubviews"];
  }
}

NAN_METHOD(NUIViewController::attemptRotationToDeviceOrientation) {
  declare_autoreleasepool {
    [UIViewController attemptRotationToDeviceOrientation];
  }
}

#if TODO
NAN_METHOD(NUIPreviewAction::actionWithTitleStyleHandler) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, title);
    declare_value(UIPreviewActionStyle, style);
    declare_value(void-^-UIPreviewAction-pointer,action,UIViewController-pointer,previewViewController, handler);
    JS_SET_RETURN(js_value_instancetype([UIPreviewAction actionWithTitle: title style: style handler: handler]));
  }
}

NAN_METHOD(NUIPreviewActionGroup::actionGroupWithTitleStyleActions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, title);
    declare_value(UIPreviewActionStyle, style);
    declare_pointer(NSArray<UIPreviewAction*>, actions);
    JS_SET_RETURN(js_value_instancetype([UIPreviewActionGroup actionGroupWithTitle: title style: style actions: actions]));
  }
}

NAN_METHOD(NUIContentContainer::preferredContentSizeDidChangeForChildContentContainer) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<UIContentContainer>, container);
    [self preferredContentSizeDidChangeForChildContentContainer: container];
  }
}

NAN_METHOD(NUIContentContainer::systemLayoutFittingSizeDidChangeForChildContentContainer) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<UIContentContainer>, container);
    [self systemLayoutFittingSizeDidChangeForChildContentContainer: container];
  }
}

NAN_METHOD(NUIContentContainer::sizeForChildContentContainerWithParentContainerSize) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<UIContentContainer>, container);
    declare_value(CGSize, parentSize);
    JS_SET_RETURN(js_value_CGSize([self sizeForChildContentContainer: container withParentContainerSize: parentSize]));
  }
}

NAN_METHOD(NUIContentContainer::viewWillTransitionToSizeWithTransitionCoordinator) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGSize, size);
    declare_value(id<UIViewControllerTransitionCoordinator>, coordinator);
    [self viewWillTransitionToSize: size withTransitionCoordinator: coordinator];
  }
}

NAN_METHOD(NUIContentContainer::willTransitionToTraitCollectionWithTransitionCoordinator) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITraitCollection, newCollection);
    declare_value(id<UIViewControllerTransitionCoordinator>, coordinator);
    [self willTransitionToTraitCollection: newCollection withTransitionCoordinator: coordinator];
  }
}
#endif

#include "NNSBundle.h"

NAN_METHOD(NUIViewController::initWithNibNameBundle) {
  JS_UNWRAP_OR_ALLOC(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, nibNameOrNil);
    declare_nullable_pointer(NSBundle, nibBundleOrNil);
    JS_SET_RETURN(js_value_instancetype([self initWithNibName: nibNameOrNil bundle: nibBundleOrNil]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIViewController::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NUIViewController::loadView) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self loadView];
  }
}

NAN_METHOD(NUIViewController::loadViewIfNeeded) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self loadViewIfNeeded];
  }
}

NAN_METHOD(NUIViewController::viewWillUnload) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewWillUnload];
  }
}

NAN_METHOD(NUIViewController::viewDidUnload) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewDidUnload];
  }
}

NAN_METHOD(NUIViewController::viewDidLoad) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewDidLoad];
  }
}

NAN_METHOD(NUIViewController::isViewLoaded) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isViewLoaded]));
  }
}

NAN_METHOD(NUIViewController::performSegueWithIdentifierSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    declare_nullable_value(id, sender);
    [self performSegueWithIdentifier: identifier sender: sender];
  }
}

NAN_METHOD(NUIViewController::shouldPerformSegueWithIdentifierSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self shouldPerformSegueWithIdentifier: identifier sender: sender]));
  }
}

#include "NUIStoryboardSegue.h"

NAN_METHOD(NUIViewController::prepareForSegueSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIStoryboardSegue, segue);
    declare_nullable_value(id, sender);
    [self prepareForSegue: segue sender: sender];
  }
}

NAN_METHOD(NUIViewController::canPerformUnwindSegueActionFromViewControllerWithSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(SEL, action);
    declare_pointer(UIViewController, fromViewController);
    declare_value(id, sender);
    JS_SET_RETURN(js_value_BOOL([self canPerformUnwindSegueAction: action fromViewController: fromViewController withSender: sender]));
    #endif
  }
}

#include "NUIStoryboardUnwindSegueSource.h"

NAN_METHOD(NUIViewController::allowedChildViewControllersForUnwindingFromSource) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIStoryboardUnwindSegueSource, source);
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self allowedChildViewControllersForUnwindingFromSource: source]));
  }
}

NAN_METHOD(NUIViewController::childViewControllerContainingSegueSource) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIStoryboardUnwindSegueSource, source);
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerContainingSegueSource: source]));
  }
}

NAN_METHOD(NUIViewController::viewControllerForUnwindSegueActionFromViewControllerWithSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(SEL, action);
    declare_pointer(UIViewController, fromViewController);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_UIViewController([self viewControllerForUnwindSegueAction: action fromViewController: fromViewController withSender: sender]));
    #endif
  }
}

NAN_METHOD(NUIViewController::unwindForSegueTowardsViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIStoryboardSegue, unwindSegue);
    declare_pointer(UIViewController, subsequentVC);
    [self unwindForSegue: unwindSegue towardsViewController: subsequentVC];
  }
}

NAN_METHOD(NUIViewController::segueForUnwindingToViewControllerFromViewControllerIdentifier) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, toViewController);
    declare_pointer(UIViewController, fromViewController);
    declare_nullable_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_UIStoryboardSegue([self segueForUnwindingToViewController: toViewController fromViewController: fromViewController identifier: identifier]));
  }
}

#if OVERRIDE
NAN_METHOD(NUIViewController::viewWillAppear) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    [self viewWillAppear: animated];
  }
}

NAN_METHOD(NUIViewController::viewDidAppear) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    [self viewDidAppear: animated];
  }
}

NAN_METHOD(NUIViewController::viewWillDisappear) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    [self viewWillDisappear: animated];
  }
}

NAN_METHOD(NUIViewController::viewDidDisappear) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    [self viewDidDisappear: animated];
  }
}

NAN_METHOD(NUIViewController::viewWillLayoutSubviews) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewWillLayoutSubviews];
  }
}

NAN_METHOD(NUIViewController::viewDidLayoutSubviews) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewDidLayoutSubviews];
  }
}
#endif

NAN_METHOD(NUIViewController::didReceiveMemoryWarning) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self didReceiveMemoryWarning];
  }
}

#if DUPLICATE
NAN_METHOD(NUIViewController::isBeingPresented) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBeingPresented]));
  }
}

NAN_METHOD(NUIViewController::isBeingDismissed) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBeingDismissed]));
  }
}

NAN_METHOD(NUIViewController::isMovingToParentViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMovingToParentViewController]));
  }
}

NAN_METHOD(NUIViewController::isMovingFromParentViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMovingFromParentViewController]));
  }
}
#endif

NAN_METHOD(NUIViewController::presentViewControllerAnimatedCompletion) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, viewControllerToPresent);
    declare_value(BOOL, flag);
    declare_callback(completion);
    [self presentViewController: viewControllerToPresent animated: flag completion:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::presentViewControllerAnimatedCompletion");
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewController::dismissViewControllerAnimatedCompletion) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, flag);
    declare_callback(completion);
    [self dismissViewControllerAnimated: flag completion:^{
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::dismissViewControllerAnimatedCompletion");
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewController::presentModalViewControllerAnimated) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, modalViewController);
    declare_value(BOOL, animated);
    [self presentModalViewController: modalViewController animated: animated];
  }
}

NAN_METHOD(NUIViewController::dismissModalViewControllerAnimated) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    [self dismissModalViewControllerAnimated: animated];
  }
}

NAN_METHOD(NUIViewController::disablesAutomaticKeyboardDismissal) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self disablesAutomaticKeyboardDismissal]));
  }
}

#include "NUIApplication.h"

NAN_METHOD(NUIViewController::preferredStatusBarStyle) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarStyle([self preferredStatusBarStyle]));
  }
}

NAN_METHOD(NUIViewController::prefersStatusBarHidden) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prefersStatusBarHidden]));
  }
}

NAN_METHOD(NUIViewController::preferredStatusBarUpdateAnimation) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarAnimation([self preferredStatusBarUpdateAnimation]));
  }
}

NAN_METHOD(NUIViewController::setNeedsStatusBarAppearanceUpdate) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self setNeedsStatusBarAppearanceUpdate];
  }
}

NAN_METHOD(NUIViewController::targetViewControllerForActionSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(SEL, action);
    declare_nullable_value(id, sender);
    JS_SET_RETURN(js_value_UIViewController([self targetViewControllerForAction: action sender: sender]));
    #endif
  }
}

NAN_METHOD(NUIViewController::showViewControllerSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    [self showViewController: vc sender: sender];
  }
}

NAN_METHOD(NUIViewController::showDetailViewControllerSender) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    [self showDetailViewController: vc sender: sender];
  }
}

#ifndef __IPHONEOS__
NAN_METHOD(NUIViewController::setNeedsUserInterfaceAppearanceUpdate) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self setNeedsUserInterfaceAppearanceUpdate];
  }
}
#endif

NAN_METHOD(NUIViewController::shouldAutorotateToInterfaceOrientation) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, toInterfaceOrientation);
    JS_SET_RETURN(js_value_BOOL([self shouldAutorotateToInterfaceOrientation: toInterfaceOrientation]));
  }
}

NAN_METHOD(NUIViewController::shouldAutorotate) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAutorotate]));
  }
}

NAN_METHOD(NUIViewController::supportedInterfaceOrientations) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientationMask([self supportedInterfaceOrientations]));
  }
}

NAN_METHOD(NUIViewController::preferredInterfaceOrientationForPresentation) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self preferredInterfaceOrientationForPresentation]));
  }
}

#include "NUIView.h"

NAN_METHOD(NUIViewController::rotatingHeaderView) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self rotatingHeaderView]));
  }
}

NAN_METHOD(NUIViewController::rotatingFooterView) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self rotatingFooterView]));
  }
}

NAN_METHOD(NUIViewController::willRotateToInterfaceOrientationDuration) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, toInterfaceOrientation);
    declare_value(NSTimeInterval, duration);
    [self willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
  }
}

NAN_METHOD(NUIViewController::didRotateFromInterfaceOrientation) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, fromInterfaceOrientation);
    [self didRotateFromInterfaceOrientation: fromInterfaceOrientation];
  }
}

NAN_METHOD(NUIViewController::willAnimateRotationToInterfaceOrientationDuration) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, toInterfaceOrientation);
    declare_value(NSTimeInterval, duration);
    [self willAnimateRotationToInterfaceOrientation: toInterfaceOrientation duration: duration];
  }
}

NAN_METHOD(NUIViewController::willAnimateFirstHalfOfRotationToInterfaceOrientationDuration) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, toInterfaceOrientation);
    declare_value(NSTimeInterval, duration);
    [self willAnimateFirstHalfOfRotationToInterfaceOrientation: toInterfaceOrientation duration: duration];
  }
}

NAN_METHOD(NUIViewController::didAnimateFirstHalfOfRotationToInterfaceOrientation) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, toInterfaceOrientation);
    [self didAnimateFirstHalfOfRotationToInterfaceOrientation: toInterfaceOrientation];
  }
}

NAN_METHOD(NUIViewController::willAnimateSecondHalfOfRotationFromInterfaceOrientationDuration) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIInterfaceOrientation, fromInterfaceOrientation);
    declare_value(NSTimeInterval, duration);
    [self willAnimateSecondHalfOfRotationFromInterfaceOrientation: fromInterfaceOrientation duration: duration];
  }
}

NAN_METHOD(NUIViewController::setEditingAnimated) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, editing);
    declare_value(BOOL, animated);
    [self setEditing: editing animated: animated];
  }
}

#include "NUIBarButtonItem.h"

NAN_METHOD(NUIViewController::editButtonItem) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self editButtonItem]));
  }
}

NAN_METHOD(NUIViewController::addChildViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, childController);
    [self addChildViewController: childController];
  }
}

NAN_METHOD(NUIViewController::removeFromParentViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self removeFromParentViewController];
  }
}

NAN_METHOD(NUIViewController::transitionFromViewControllerToViewControllerDurationOptionsAnimationsCompletion) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, fromViewController);
    declare_pointer(UIViewController, toViewController);
    declare_value(NSTimeInterval, duration);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    [self transitionFromViewController: fromViewController toViewController: toViewController duration: duration options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIViewController::transitionFromViewControllerToViewControllerDurationOptionsAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIViewController::transitionFromViewControllerToViewControllerDurationOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIViewController::beginAppearanceTransitionAnimated) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, isAppearing);
    declare_value(BOOL, animated);
    [self beginAppearanceTransition: isAppearing animated: animated];
  }
}

NAN_METHOD(NUIViewController::endAppearanceTransition) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self endAppearanceTransition];
  }
}

NAN_METHOD(NUIViewController::childViewControllerForStatusBarStyle) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForStatusBarStyle]));
  }
}

NAN_METHOD(NUIViewController::childViewControllerForStatusBarHidden) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForStatusBarHidden]));
  }
}

#include "NUITraitCollection.h"

NAN_METHOD(NUIViewController::setOverrideTraitCollectionForChildViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UITraitCollection, collection);
    declare_pointer(UIViewController, childViewController);
    [self setOverrideTraitCollection: collection forChildViewController: childViewController];
  }
}

NAN_METHOD(NUIViewController::overrideTraitCollectionForChildViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, childViewController);
    JS_SET_RETURN(js_value_UITraitCollection([self overrideTraitCollectionForChildViewController: childViewController]));
  }
}

NAN_METHOD(NUIViewController::automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers]));
  }
}

NAN_METHOD(NUIViewController::shouldAutomaticallyForwardRotationMethods) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAutomaticallyForwardRotationMethods]));
  }
}

NAN_METHOD(NUIViewController::shouldAutomaticallyForwardAppearanceMethods) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAutomaticallyForwardAppearanceMethods]));
  }
}

NAN_METHOD(NUIViewController::willMoveToParentViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIViewController, parent);
    [self willMoveToParentViewController: parent];
  }
}

NAN_METHOD(NUIViewController::didMoveToParentViewController) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIViewController, parent);
    [self didMoveToParentViewController: parent];
  }
}

NAN_METHOD(NUIViewController::encodeRestorableStateWithCoder) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    [self encodeRestorableStateWithCoder: coder];
  }
}

NAN_METHOD(NUIViewController::decodeRestorableStateWithCoder) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    [self decodeRestorableStateWithCoder: coder];
  }
}

NAN_METHOD(NUIViewController::applicationFinishedRestoringState) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self applicationFinishedRestoringState];
  }
}

NAN_METHOD(NUIViewController::updateViewConstraints) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self updateViewConstraints];
  }
}

NAN_METHOD(NUIViewController::viewLayoutMarginsDidChange) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewLayoutMarginsDidChange];
  }
}

NAN_METHOD(NUIViewController::viewSafeAreaInsetsDidChange) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self viewSafeAreaInsetsDidChange];
  }
}

#include "NUIKeyCommand.h"

NAN_METHOD(NUIViewController::addKeyCommand) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIKeyCommand, keyCommand);
    [self addKeyCommand: keyCommand];
  }
}

NAN_METHOD(NUIViewController::removeKeyCommand) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIKeyCommand, keyCommand);
    [self removeKeyCommand: keyCommand];
  }
}

#if TODO
NAN_METHOD(NUIViewControllerPreviewingDelegate::previewingContextViewControllerForLocation) {
  JS_UNWRAP(UIViewControllerPreviewingDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<UIViewControllerPreviewing>, previewingContext);
    declare_value(CGPoint, location);
    JS_SET_RETURN(js_value_UIViewController([self previewingContext: previewingContext viewControllerForLocation: location]));
  }
}

NAN_METHOD(NUIViewControllerPreviewingDelegate::previewingContextCommitViewController) {
  JS_UNWRAP(UIViewControllerPreviewingDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id<UIViewControllerPreviewing>, previewingContext);
    declare_pointer(UIViewController, viewControllerToCommit);
    [self previewingContext: previewingContext commitViewController: viewControllerToCommit];
  }
}
#endif

NAN_METHOD(NUIViewController::registerForPreviewingWithDelegateSourceView) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIViewControllerPreviewingDelegate>*/, delegate);
    declare_pointer(UIView, sourceView);
    JS_SET_RETURN(js_value_id/* <UIViewControllerPreviewing>*/([self registerForPreviewingWithDelegate: delegate sourceView: sourceView]));
  }
}

NAN_METHOD(NUIViewController::unregisterForPreviewingWithContext) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* <UIViewControllerPreviewing>*/, previewing);
    [self unregisterForPreviewingWithContext: previewing];
  }
}

NAN_METHOD(NUIViewController::setNeedsUpdateOfScreenEdgesDeferringSystemGestures) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  }
}

NAN_METHOD(NUIViewController::setNeedsUpdateOfHomeIndicatorAutoHidden) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    [self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

NAN_METHOD(NUIViewController::previewActionItems) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<id<UIPreviewActionItem>>([self previewActionItems]));
  }
}

#if TODO
NAN_GETTER(NUIContentContainer::preferredContentSizeGetter) {
  JS_UNWRAP(UIContentContainer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self preferredContentSize]));
  }
}
#endif

NAN_GETTER(NUIViewController::viewGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self view]));
  }
}

NAN_SETTER(NUIViewController::viewSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setView: input];
  }
}

NAN_GETTER(NUIViewController::viewIfLoadedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self viewIfLoaded]));
  }
}

NAN_GETTER(NUIViewController::isViewLoadedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isViewLoaded]));
  }
}

NAN_GETTER(NUIViewController::nibNameGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self nibName]));
  }
}

NAN_GETTER(NUIViewController::nibBundleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSBundle([self nibBundle]));
  }
}

#include "NUIStoryboard.h"

NAN_GETTER(NUIViewController::storyboardGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStoryboard([self storyboard]));
  }
}

NAN_GETTER(NUIViewController::titleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NUIViewController::titleSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NUIViewController::parentViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self parentViewController]));
  }
}

NAN_GETTER(NUIViewController::modalViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self modalViewController]));
  }
}

NAN_GETTER(NUIViewController::presentedViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self presentedViewController]));
  }
}

NAN_GETTER(NUIViewController::presentingViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self presentingViewController]));
  }
}

NAN_GETTER(NUIViewController::definesPresentationContextGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self definesPresentationContext]));
  }
}

NAN_SETTER(NUIViewController::definesPresentationContextSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDefinesPresentationContext: input];
  }
}

NAN_GETTER(NUIViewController::providesPresentationContextTransitionStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self providesPresentationContextTransitionStyle]));
  }
}

NAN_SETTER(NUIViewController::providesPresentationContextTransitionStyleSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setProvidesPresentationContextTransitionStyle: input];
  }
}

NAN_GETTER(NUIViewController::restoresFocusAfterTransitionGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self restoresFocusAfterTransition]));
  }
}

NAN_SETTER(NUIViewController::restoresFocusAfterTransitionSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRestoresFocusAfterTransition: input];
  }
}

NAN_GETTER(NUIViewController::isBeingPresentedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBeingPresented]));
  }
}

NAN_GETTER(NUIViewController::isBeingDismissedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBeingDismissed]));
  }
}

NAN_GETTER(NUIViewController::isMovingToParentViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMovingToParentViewController]));
  }
}

NAN_GETTER(NUIViewController::isMovingFromParentViewControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMovingFromParentViewController]));
  }
}

NAN_GETTER(NUIViewController::modalTransitionStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalTransitionStyle([self modalTransitionStyle]));
  }
}

NAN_SETTER(NUIViewController::modalTransitionStyleSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIModalTransitionStyle, input);
    [self setModalTransitionStyle: input];
  }
}

NAN_GETTER(NUIViewController::modalPresentationStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self modalPresentationStyle]));
  }
}

NAN_SETTER(NUIViewController::modalPresentationStyleSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIModalPresentationStyle, input);
    [self setModalPresentationStyle: input];
  }
}

NAN_GETTER(NUIViewController::modalPresentationCapturesStatusBarAppearanceGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self modalPresentationCapturesStatusBarAppearance]));
  }
}

NAN_SETTER(NUIViewController::modalPresentationCapturesStatusBarAppearanceSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setModalPresentationCapturesStatusBarAppearance: input];
  }
}

NAN_GETTER(NUIViewController::disablesAutomaticKeyboardDismissalGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self disablesAutomaticKeyboardDismissal]));
  }
}

NAN_GETTER(NUIViewController::wantsFullScreenLayoutGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self wantsFullScreenLayout]));
  }
}

NAN_SETTER(NUIViewController::wantsFullScreenLayoutSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setWantsFullScreenLayout: input];
  }
}

NAN_GETTER(NUIViewController::edgesForExtendedLayoutGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRectEdge([self edgesForExtendedLayout]));
  }
}

NAN_SETTER(NUIViewController::edgesForExtendedLayoutSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIRectEdge, input);
    [self setEdgesForExtendedLayout: input];
  }
}

NAN_GETTER(NUIViewController::extendedLayoutIncludesOpaqueBarsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self extendedLayoutIncludesOpaqueBars]));
  }
}

NAN_SETTER(NUIViewController::extendedLayoutIncludesOpaqueBarsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setExtendedLayoutIncludesOpaqueBars: input];
  }
}

NAN_GETTER(NUIViewController::automaticallyAdjustsScrollViewInsetsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyAdjustsScrollViewInsets]));
  }
}

NAN_SETTER(NUIViewController::automaticallyAdjustsScrollViewInsetsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyAdjustsScrollViewInsets: input];
  }
}

NAN_GETTER(NUIViewController::preferredContentSizeGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self preferredContentSize]));
  }
}

NAN_SETTER(NUIViewController::preferredContentSizeSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setPreferredContentSize: input];
  }
}

NAN_GETTER(NUIViewController::preferredStatusBarStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarStyle([self preferredStatusBarStyle]));
  }
}

NAN_GETTER(NUIViewController::prefersStatusBarHiddenGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prefersStatusBarHidden]));
  }
}

NAN_GETTER(NUIViewController::preferredStatusBarUpdateAnimationGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStatusBarAnimation([self preferredStatusBarUpdateAnimation]));
  }
}

#ifdef __TVOS__
NAN_GETTER(NUIViewController::preferredUserInterfaceStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIUserInterfaceStyle([self preferredUserInterfaceStyle]));
  }
}
#endif

NAN_GETTER(NUIViewController::shouldAutorotateGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAutorotate]));
  }
}

NAN_GETTER(NUIViewController::supportedInterfaceOrientationsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientationMask([self supportedInterfaceOrientations]));
  }
}

NAN_GETTER(NUIViewController::preferredInterfaceOrientationForPresentationGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self preferredInterfaceOrientationForPresentation]));
  }
}

NAN_GETTER(NUIViewController::interfaceOrientationGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIInterfaceOrientation([self interfaceOrientation]));
  }
}

NAN_GETTER(NUIViewController::isEditingGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEditing]));
  }
}

NAN_SETTER(NUIViewController::isEditingSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEditing: input];
  }
}

NAN_GETTER(NUIViewController::editButtonItemGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self editButtonItem]));
  }
}

#if DEPRECATED
NAN_GETTER(NUIViewController::searchDisplayControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISearchDisplayController([self searchDisplayController]));
  }
}
#endif

NAN_GETTER(NUIViewController::childViewControllersGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self childViewControllers]));
  }
}

NAN_GETTER(NUIViewController::childViewControllerForStatusBarStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForStatusBarStyle]));
  }
}

NAN_GETTER(NUIViewController::childViewControllerForStatusBarHiddenGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForStatusBarHidden]));
  }
}

#ifdef __TVOS__
NAN_GETTER(NUIViewController::childViewControllerForUserInterfaceStyleGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForUserInterfaceStyle]));
  }
}
#endif

NAN_GETTER(NUIViewController::shouldAutomaticallyForwardAppearanceMethodsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldAutomaticallyForwardAppearanceMethods]));
  }
}

NAN_GETTER(NUIViewController::restorationIdentifierGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self restorationIdentifier]));
  }
}

NAN_SETTER(NUIViewController::restorationIdentifierSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setRestorationIdentifier: input];
  }
}

NAN_GETTER(NUIViewController::restorationClassGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id /* Class<UIViewControllerRestoration>*/([self restorationClass]));
  }
}

NAN_SETTER(NUIViewController::restorationClassSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id /* Class<UIViewControllerRestoration>*/, input);
    [self setRestorationClass: input];
  }
}

NAN_GETTER(NUIViewController::transitioningDelegateGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIViewControllerTransitioningDelegate>*/([self transitioningDelegate]));
  }
}

NAN_SETTER(NUIViewController::transitioningDelegateSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UIViewControllerTransitioningDelegate>*/, input);
    [self setTransitioningDelegate: input];
  }
}

NAN_GETTER(NUIViewController::topLayoutGuideGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UILayoutSupport>*/([self topLayoutGuide]));
  }
}

NAN_GETTER(NUIViewController::bottomLayoutGuideGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UILayoutSupport>*/([self bottomLayoutGuide]));
  }
}

NAN_GETTER(NUIViewController::additionalSafeAreaInsetsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self additionalSafeAreaInsets]));
  }
}

NAN_SETTER(NUIViewController::additionalSafeAreaInsetsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setAdditionalSafeAreaInsets: input];
  }
}

NAN_GETTER(NUIViewController::systemMinimumLayoutMarginsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDirectionalEdgeInsets([self systemMinimumLayoutMargins]));
  }
}

NAN_GETTER(NUIViewController::viewRespectsSystemMinimumLayoutMarginsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self viewRespectsSystemMinimumLayoutMargins]));
  }
}

NAN_SETTER(NUIViewController::viewRespectsSystemMinimumLayoutMarginsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setViewRespectsSystemMinimumLayoutMargins: input];
  }
}

#define js_value_NSExtensionContext(x) js_value_wrapper_unknown(x, NSExtensionContext)
#define to_value_NSExtensionContext(x) to_value_wrapper_unknown(x, NSExtensionContext)
#define is_value_NSExtensionContext(x) is_value_wrapper_unknown(x, NSExtensionContext)

NAN_GETTER(NUIViewController::extensionContextGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSExtensionContext([self extensionContext]));
  }
}

#include "NUIPresentationController.h"

NAN_GETTER(NUIViewController::presentationControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPresentationController([self presentationController]));
  }
}

#include "NUIPopoverPresentationController.h"

NAN_GETTER(NUIViewController::popoverPresentationControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPopoverPresentationController([self popoverPresentationController]));
  }
}

#if TODO
NAN_GETTER(NUIViewControllerPreviewing::previewingGestureRecognizerForFailureRelationshipGetter) {
  JS_UNWRAP(UIViewControllerPreviewing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIGestureRecognizer([self previewingGestureRecognizerForFailureRelationship]));
  }
}

NAN_GETTER(NUIViewControllerPreviewing::delegateGetter) {
  JS_UNWRAP(UIViewControllerPreviewing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id<UIViewControllerPreviewingDelegate>([self delegate]));
  }
}

NAN_GETTER(NUIViewControllerPreviewing::sourceViewGetter) {
  JS_UNWRAP(UIViewControllerPreviewing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self sourceView]));
  }
}

NAN_GETTER(NUIViewControllerPreviewing::sourceRectGetter) {
  JS_UNWRAP(UIViewControllerPreviewing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self sourceRect]));
  }
}

NAN_SETTER(NUIViewControllerPreviewing::sourceRectSetter) {
  JS_UNWRAP(UIViewControllerPreviewing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setSourceRect: input];
  }
}
#endif

NAN_GETTER(NUIViewController::childViewControllerForScreenEdgesDeferringSystemGesturesGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForScreenEdgesDeferringSystemGestures]));
  }
}

NAN_GETTER(NUIViewController::preferredScreenEdgesDeferringSystemGesturesGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRectEdge([self preferredScreenEdgesDeferringSystemGestures]));
  }
}

NAN_GETTER(NUIViewController::childViewControllerForHomeIndicatorAutoHiddenGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self childViewControllerForHomeIndicatorAutoHidden]));
  }
}

NAN_GETTER(NUIViewController::prefersHomeIndicatorAutoHiddenGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prefersHomeIndicatorAutoHidden]));
  }
}

NAN_GETTER(NUIViewController::previewActionItemsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray/* <id<UIPreviewActionItem>>*/([self previewActionItems]));
  }
}

#if TODO
NAN_GETTER(NUIPreviewActionItem::titleGetter) {
  JS_UNWRAP(UIPreviewActionItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_GETTER(NUIPreviewAction::id<UIPreviewActionItem>(action, UIViewController, previewViewController)Getter) {
  JS_UNWRAP(UIPreviewAction, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_void 94handler([self id<UIPreviewActionItem>(action, UIViewController, previewViewController)]));
  }
}
#endif
