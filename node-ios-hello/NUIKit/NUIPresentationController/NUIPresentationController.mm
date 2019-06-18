//
//  NUIPresentationController.mm
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPresentationController.h"

#define instancetype UIPresentationController
#define js_value_instancetype js_value_UIPresentationController

NUIPresentationController::NUIPresentationController() {}
NUIPresentationController::~NUIPresentationController() {}

JS_INIT_CLASS(UIPresentationController, NSObject);
  // instance members (proto)
#if TODO
// UIAdaptivePresentationControllerDelegate
  JS_ASSIGN_PROTO_METHOD(adaptivePresentationStyleForPresentationController);
  JS_ASSIGN_PROTO_METHOD(adaptivePresentationStyleForPresentationControllerTraitCollection);
  JS_ASSIGN_PROTO_METHOD(presentationControllerViewControllerForAdaptivePresentationStyle);
  JS_ASSIGN_PROTO_METHOD(presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator);
#endif
// UIPresentationController
  JS_ASSIGN_STATIC_METHOD(initWithPresentedViewControllerPresentingViewController);
  JS_ASSIGN_PROTO_METHOD(adaptivePresentationStyle);
  JS_ASSIGN_PROTO_METHOD(adaptivePresentationStyleForTraitCollection);
  JS_ASSIGN_PROTO_METHOD(containerViewWillLayoutSubviews);
  JS_ASSIGN_PROTO_METHOD(containerViewDidLayoutSubviews);
  JS_ASSIGN_PROTO_METHOD(presentedView);
  JS_ASSIGN_PROTO_METHOD(frameOfPresentedViewInContainerView);
  JS_ASSIGN_PROTO_METHOD(shouldPresentInFullscreen);
  JS_ASSIGN_PROTO_METHOD(shouldRemovePresentersView);
  JS_ASSIGN_PROTO_METHOD(presentationTransitionWillBegin);
  JS_ASSIGN_PROTO_METHOD(presentationTransitionDidEnd);
  JS_ASSIGN_PROTO_METHOD(dismissalTransitionWillBegin);
  JS_ASSIGN_PROTO_METHOD(dismissalTransitionDidEnd);
  JS_ASSIGN_PROTO_PROP_READONLY(presentingViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(presentedViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(presentationStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(containerView);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(adaptivePresentationStyle);
  JS_ASSIGN_PROTO_PROP_READONLY(presentedView);
  JS_ASSIGN_PROTO_PROP_READONLY(frameOfPresentedViewInContainerView);
  JS_ASSIGN_PROTO_PROP_READONLY(shouldPresentInFullscreen);
  JS_ASSIGN_PROTO_PROP_READONLY(shouldRemovePresentersView);
  JS_ASSIGN_PROTO_PROP(overrideTraitCollection);

  // static members (ctor)
  JS_INIT_CTOR(UIPresentationController, NSObject);
JS_INIT_CLASS_END(UIPresentationController, NSObject);

#include "NUIViewController.h"

NAN_METHOD(NUIPresentationController::New) {
  JS_RECONSTRUCT(UIPresentationController);
  @autoreleasepool {
    UIPresentationController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPresentationController *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIPresentationController *wrapper = new NUIPresentationController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPresentationController::New: invalid arguments");
    }
  }
}

#if TODO
NAN_METHOD(NUIAdaptivePresentationControllerDelegate::adaptivePresentationStyleForPresentationController) {
  JS_UNWRAP(UIAdaptivePresentationControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIPresentationController, controller);
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self adaptivePresentationStyleForPresentationController: controller]));
  }
}

NAN_METHOD(NUIAdaptivePresentationControllerDelegate::adaptivePresentationStyleForPresentationControllerTraitCollection) {
  JS_UNWRAP(UIAdaptivePresentationControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIPresentationController, controller);
    declare_pointer(UITraitCollection, traitCollection);
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self adaptivePresentationStyleForPresentationController: controller traitCollection: traitCollection]));
  }
}

NAN_METHOD(NUIAdaptivePresentationControllerDelegate::presentationControllerViewControllerForAdaptivePresentationStyle) {
  JS_UNWRAP(UIAdaptivePresentationControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIPresentationController, controller);
    declare_value(UIModalPresentationStyle, style);
    JS_SET_RETURN(js_value_UIViewController([self presentationController: controller viewControllerForAdaptivePresentationStyle: style]));
  }
}

NAN_METHOD(NUIAdaptivePresentationControllerDelegate::presentationControllerWillPresentWithAdaptiveStyleTransitionCoordinator) {
  JS_UNWRAP(UIAdaptivePresentationControllerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIPresentationController, presentationController);
    declare_value(UIModalPresentationStyle, style);
    declare_nullable_value(id<UIViewControllerTransitionCoordinator>, transitionCoordinator);
    [self presentationController: presentationController willPresentWithAdaptiveStyle: style transitionCoordinator: transitionCoordinator];
  }
}
#endif

NAN_METHOD(NUIPresentationController::initWithPresentedViewControllerPresentingViewController) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, presentedViewController);
    declare_nullable_pointer(UIViewController, presentingViewController);
    JS_SET_RETURN(js_value_instancetype([[UIPresentationController alloc] initWithPresentedViewController: presentedViewController presentingViewController: presentingViewController]));
  }
}

NAN_METHOD(NUIPresentationController::adaptivePresentationStyle) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self adaptivePresentationStyle]));
  }
}

#include "NUITraitCollection.h"

NAN_METHOD(NUIPresentationController::adaptivePresentationStyleForTraitCollection) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITraitCollection, traitCollection);
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self adaptivePresentationStyleForTraitCollection: traitCollection]));
  }
}

NAN_METHOD(NUIPresentationController::containerViewWillLayoutSubviews) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    [self containerViewWillLayoutSubviews];
  }
}

NAN_METHOD(NUIPresentationController::containerViewDidLayoutSubviews) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    [self containerViewDidLayoutSubviews];
  }
}

#include "NUIView.h"

NAN_METHOD(NUIPresentationController::presentedView) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self presentedView]));
  }
}

NAN_METHOD(NUIPresentationController::frameOfPresentedViewInContainerView) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self frameOfPresentedViewInContainerView]));
  }
}

NAN_METHOD(NUIPresentationController::shouldPresentInFullscreen) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldPresentInFullscreen]));
  }
}

NAN_METHOD(NUIPresentationController::shouldRemovePresentersView) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldRemovePresentersView]));
  }
}

NAN_METHOD(NUIPresentationController::presentationTransitionWillBegin) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    [self presentationTransitionWillBegin];
  }
}

NAN_METHOD(NUIPresentationController::presentationTransitionDidEnd) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, completed);
    [self presentationTransitionDidEnd: completed];
  }
}

NAN_METHOD(NUIPresentationController::dismissalTransitionWillBegin) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    [self dismissalTransitionWillBegin];
  }
}

NAN_METHOD(NUIPresentationController::dismissalTransitionDidEnd) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, completed);
    [self dismissalTransitionDidEnd: completed];
  }
}

NAN_GETTER(NUIPresentationController::presentingViewControllerGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self presentingViewController]));
  }
}

NAN_GETTER(NUIPresentationController::presentedViewControllerGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self presentedViewController]));
  }
}

NAN_GETTER(NUIPresentationController::presentationStyleGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self presentationStyle]));
  }
}

NAN_GETTER(NUIPresentationController::containerViewGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self containerView]));
  }
}

NAN_GETTER(NUIPresentationController::delegateGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIAdaptivePresentationControllerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUIPresentationController::delegateSetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UIAdaptivePresentationControllerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NUIPresentationController::adaptivePresentationStyleGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIModalPresentationStyle([self adaptivePresentationStyle]));
  }
}

NAN_GETTER(NUIPresentationController::presentedViewGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self presentedView]));
  }
}

NAN_GETTER(NUIPresentationController::frameOfPresentedViewInContainerViewGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self frameOfPresentedViewInContainerView]));
  }
}

NAN_GETTER(NUIPresentationController::shouldPresentInFullscreenGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldPresentInFullscreen]));
  }
}

NAN_GETTER(NUIPresentationController::shouldRemovePresentersViewGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldRemovePresentersView]));
  }
}

NAN_GETTER(NUIPresentationController::overrideTraitCollectionGetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITraitCollection([self overrideTraitCollection]));
  }
}

NAN_SETTER(NUIPresentationController::overrideTraitCollectionSetter) {
  JS_UNWRAP(UIPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITraitCollection, input);
    [self setOverrideTraitCollection: input];
  }
}

