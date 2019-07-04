//
//  NUINavigationController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationController.h"

#define instancetype UINavigationController
#define js_value_instancetype js_value_UINavigationController

NUINavigationController::NUINavigationController() {}
NUINavigationController::~NUINavigationController() {}

JS_INIT_CLASS(UINavigationController, UIViewController);
  JS_ASSIGN_PROTO_METHOD(initWithNavigationBarClassToolbarClass);
  JS_ASSIGN_PROTO_METHOD(initWithRootViewController);
  JS_ASSIGN_PROTO_METHOD(pushViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(popViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(popToViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(popToRootViewControllerAnimated);
  JS_ASSIGN_PROTO_METHOD(setViewControllersAnimated);
  JS_ASSIGN_PROTO_METHOD(setNavigationBarHiddenAnimated);
  JS_ASSIGN_PROTO_METHOD(setToolbarHiddenAnimated);
  JS_ASSIGN_PROTO_METHOD(showViewControllerSender);
  JS_ASSIGN_PROTO_PROP_READONLY(topViewController);
  JS_ASSIGN_PROTO_PROP_READONLY(visibleViewController);
  JS_ASSIGN_PROTO_PROP(viewControllers);
  JS_ASSIGN_PROTO_PROP(isNavigationBarHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(navigationBar);
  JS_ASSIGN_PROTO_PROP(isToolbarHidden);
  JS_ASSIGN_PROTO_PROP_READONLY(toolbar);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(interactivePopGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(hidesBarsWhenKeyboardAppears);
  JS_ASSIGN_PROTO_PROP(hidesBarsOnSwipe);
  JS_ASSIGN_PROTO_PROP_READONLY(barHideOnSwipeGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(hidesBarsWhenVerticallyCompact);
  JS_ASSIGN_PROTO_PROP(hidesBarsOnTap);
  JS_ASSIGN_PROTO_PROP_READONLY(barHideOnTapGestureRecognizer);

  // UIViewController (UINavigationControllerItem)
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_METHOD_AS(NUIViewController_UINavigationControllerItem::setToolbarItemsAnimated, "setToolbarItemsAnimated");
  }
  // UIViewController (UINavigationControllerContextualToolbarItems)
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NUIViewController_UINavigationControllerContextualToolbarItems::navigationItem, "navigationItem");
    JS_ASSIGN_PROTO_PROP_AS(NUIViewController_UINavigationControllerContextualToolbarItems::hidesBottomBarWhenPushed, "hidesBottomBarWhenPushed");
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NUIViewController_UINavigationControllerContextualToolbarItems::navigationController, "navigationController");
    JS_ASSIGN_PROTO_PROP_AS(NUIViewController_UINavigationControllerContextualToolbarItems::toolbarItems, "toolbarItems");
  }
  
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UINavigationController, UIViewController);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
    JS_ASSIGN_ENUM(UINavigationControllerOperationNone, NSInteger);
    JS_ASSIGN_ENUM(UINavigationControllerOperationPush, NSInteger);
    JS_ASSIGN_ENUM(UINavigationControllerOperationPop, NSInteger);
  //};
  
  JS_ASSIGN_ENUM(UINavigationControllerHideShowBarDuration, CGFloat);

JS_INIT_CLASS_END(UINavigationController, UIViewController);

NAN_METHOD(NUINavigationController::New) {
  JS_RECONSTRUCT(UINavigationController);
  @autoreleasepool {
    UINavigationController* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UINavigationController *)(info[0].As<External>()->Value());
    } else if (is_value_UIViewController(info[0])) {
      declare_args();
      declare_pointer(UIViewController, viewController);
      self = [[UINavigationController alloc] initWithRootViewController:viewController];
    } else if (info.Length() <= 0) {
      self = [[UINavigationController alloc] init];
    }
    if (self) {
      NUINavigationController *wrapper = new NUINavigationController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NUINavigationController::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIViewController_UINavigationControllerItem::setToolbarItemsAnimated) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UIBarButtonItem*>, toolbarItems);
    declare_value(BOOL, animated);
    [self setToolbarItems: toolbarItems animated: animated];
  }
}

#include "NUINavigationItem.h"

NAN_GETTER(NUIViewController_UINavigationControllerContextualToolbarItems::navigationItemGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItem([self navigationItem]));
  }
}

NAN_GETTER(NUIViewController_UINavigationControllerContextualToolbarItems::hidesBottomBarWhenPushedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBottomBarWhenPushed]));
  }
}

NAN_SETTER(NUIViewController_UINavigationControllerContextualToolbarItems::hidesBottomBarWhenPushedSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBottomBarWhenPushed: input];
  }
}

NAN_GETTER(NUIViewController_UINavigationControllerContextualToolbarItems::navigationControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationController([self navigationController]));
  }
}

NAN_GETTER(NUIViewController_UINavigationControllerContextualToolbarItems::toolbarItemsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItem*>([self toolbarItems]));
  }
}

NAN_SETTER(NUIViewController_UINavigationControllerContextualToolbarItems::toolbarItemsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItem*>, input);
    [self setToolbarItems: input];
  }
}

NAN_METHOD(NUINavigationController::initWithNavigationBarClassToolbarClass) {
  JS_UNWRAP_OR_ALLOC(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id/* Class*/, navigationBarClass);
    declare_nullable_value(id/* Class*/, toolbarClass);
    JS_SET_RETURN(js_value_instancetype([self initWithNavigationBarClass: navigationBarClass toolbarClass: toolbarClass]));
  }
}

NAN_METHOD(NUINavigationController::initWithRootViewController) {
  JS_UNWRAP_OR_ALLOC(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, rootViewController);
    JS_SET_RETURN(js_value_instancetype([self initWithRootViewController: rootViewController]));
  }
}

NAN_METHOD(NUINavigationController::pushViewControllerAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, viewController);
    declare_value(BOOL, animated);
    [self pushViewController: viewController animated: animated];
  }
}

NAN_METHOD(NUINavigationController::popViewControllerAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    JS_SET_RETURN(js_value_UIViewController([self popViewControllerAnimated: animated]));
  }
}

NAN_METHOD(NUINavigationController::popToViewControllerAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, viewController);
    declare_value(BOOL, animated);
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self popToViewController: viewController animated: animated]));
  }
}

NAN_METHOD(NUINavigationController::popToRootViewControllerAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, animated);
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self popToRootViewControllerAnimated: animated]));
  }
}

NAN_METHOD(NUINavigationController::setViewControllersAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIViewController*>, viewControllers);
    declare_value(BOOL, animated);
    [self setViewControllers: viewControllers animated: animated];
  }
}

NAN_METHOD(NUINavigationController::setNavigationBarHiddenAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, hidden);
    declare_value(BOOL, animated);
    [self setNavigationBarHidden: hidden animated: animated];
  }
}

NAN_METHOD(NUINavigationController::setToolbarHiddenAnimated) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, hidden);
    declare_value(BOOL, animated);
    [self setToolbarHidden: hidden animated: animated];
  }
}

NAN_METHOD(NUINavigationController::showViewControllerSender) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIViewController, vc);
    declare_nullable_value(id, sender);
    [self showViewController: vc sender: sender];
  }
}

NAN_GETTER(NUINavigationController::topViewControllerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self topViewController]));
  }
}

NAN_GETTER(NUINavigationController::visibleViewControllerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self visibleViewController]));
  }
}

NAN_GETTER(NUINavigationController::viewControllersGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self viewControllers]));
  }
}

NAN_SETTER(NUINavigationController::viewControllersSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIViewController*>, input);
    [self setViewControllers: input];
  }
}

NAN_GETTER(NUINavigationController::isNavigationBarHiddenGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isNavigationBarHidden]));
  }
}

NAN_SETTER(NUINavigationController::isNavigationBarHiddenSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNavigationBarHidden: input];
  }
}

#include "NUINavigationBar.h"

NAN_GETTER(NUINavigationController::navigationBarGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationBar([self navigationBar]));
  }
}

NAN_GETTER(NUINavigationController::isToolbarHiddenGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isToolbarHidden]));
  }
}

NAN_SETTER(NUINavigationController::isToolbarHiddenSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setToolbarHidden: input];
  }
}

#include "NUIToolbar.h"

NAN_GETTER(NUINavigationController::toolbarGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIToolbar([self toolbar]));
  }
}

#include "NUINavigationControllerDelegate.h"

NAN_GETTER(NUINavigationController::delegateGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationControllerDelegate([self delegate]));
  }
}

NAN_SETTER(NUINavigationController::delegateSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UINavigationControllerDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUINavigationController::delegate"];
  }
}

#include "NUIGestureRecognizer.h"

NAN_GETTER(NUINavigationController::interactivePopGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIGestureRecognizer([self interactivePopGestureRecognizer]));
  }
}

NAN_GETTER(NUINavigationController::hidesBarsWhenKeyboardAppearsGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsWhenKeyboardAppears]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsWhenKeyboardAppearsSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsWhenKeyboardAppears: input];
  }
}

NAN_GETTER(NUINavigationController::hidesBarsOnSwipeGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsOnSwipe]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsOnSwipeSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsOnSwipe: input];
  }
}

#include "NUITapGestureRecognizer.h"

NAN_GETTER(NUINavigationController::barHideOnSwipeGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPanGestureRecognizer([self barHideOnSwipeGestureRecognizer]));
  }
}

NAN_GETTER(NUINavigationController::hidesBarsWhenVerticallyCompactGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsWhenVerticallyCompact]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsWhenVerticallyCompactSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsWhenVerticallyCompact: input];
  }
}

NAN_GETTER(NUINavigationController::hidesBarsOnTapGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsOnTap]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsOnTapSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsOnTap: input];
  }
}

NAN_GETTER(NUINavigationController::barHideOnTapGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITapGestureRecognizer([self barHideOnTapGestureRecognizer]));
  }
}
