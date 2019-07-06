//
//  NUITabBarController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarController.h"

#define instancetype UITabBarController
#define js_value_instancetype js_value_UITabBarController

NUITabBarController::NUITabBarController() {}
NUITabBarController::~NUITabBarController() {}

JS_INIT_CLASS(UITabBarController, UIViewController);
  JS_ASSIGN_PROTO_METHOD(setViewControllersAnimated);
  JS_ASSIGN_PROTO_PROP(viewControllers);
  JS_ASSIGN_PROTO_PROP(selectedViewController);
  JS_ASSIGN_PROTO_PROP(selectedIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(moreNavigationController);
  JS_ASSIGN_PROTO_PROP(customizableViewControllers);
  JS_ASSIGN_PROTO_PROP_READONLY(tabBar);
  JS_ASSIGN_PROTO_PROP(delegate);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBarController, UIViewController);
  
  // UIViewController (UITabBarControllerItem)
  {
    JS_WITH_TYPE(UIViewController);
    JS_ASSIGN_PROTO_PROP_AS(NUIViewController_UITabBarControllerItem::tabBarItem, "tabBarItem");
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NUIViewController_UITabBarControllerItem::tabBarController, "tabBarController");
  }
JS_INIT_CLASS_END(UITabBarController, UIViewController);

NAN_METHOD(NUITabBarController::New) {
  JS_RECONSTRUCT(UITabBarController);
  @autoreleasepool {
    UITabBarController* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITabBarController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITabBarController alloc] init];
    }
    if (self) {
      NUITabBarController *wrapper = new NUITabBarController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITabBarController::New: invalid arguments");
    }
  }
}

#include "NUIViewController.h"

NAN_METHOD(NUITabBarController::setViewControllersAnimated) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray<UIViewController*>, viewControllers);
    declare_value(BOOL, animated);
    [self setViewControllers: viewControllers animated: animated];
  }
}

NAN_GETTER(NUITabBarController::viewControllersGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self viewControllers]));
  }
}

NAN_SETTER(NUITabBarController::viewControllersSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIViewController*>, input);
    [self setViewControllers: input];
  }
}

NAN_GETTER(NUITabBarController::selectedViewControllerGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self selectedViewController]));
  }
}

NAN_SETTER(NUITabBarController::selectedViewControllerSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIViewController, input);
    [self setSelectedViewController: input];
  }
}

NAN_GETTER(NUITabBarController::selectedIndexGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self selectedIndex]));
  }
}

NAN_SETTER(NUITabBarController::selectedIndexSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSUInteger, input);
    [self setSelectedIndex: input];
  }
}

#include "NUINavigationController.h"

NAN_GETTER(NUITabBarController::moreNavigationControllerGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationController([self moreNavigationController]));
  }
}

NAN_GETTER(NUITabBarController::customizableViewControllersGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self customizableViewControllers]));
  }
}

NAN_SETTER(NUITabBarController::customizableViewControllersSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIViewController*>, input);
    [self setCustomizableViewControllers: input];
  }
}

#include "NUITabBar.h"

NAN_GETTER(NUITabBarController::tabBarGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBar([self tabBar]));
  }
}

#include "NUITabBarControllerDelegate.h"

NAN_GETTER(NUITabBarController::delegateGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarControllerDelegate([self delegate]));
  }
}

NAN_SETTER(NUITabBarController::delegateSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UITabBarControllerDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUITabBarController::delegate"];
  }
}

#include "NUITabBarItem.h"

NAN_GETTER(NUIViewController_UITabBarControllerItem::tabBarItemGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarItem([self tabBarItem]));
  }
}

NAN_SETTER(NUIViewController_UITabBarControllerItem::tabBarItemSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UITabBarItem, input);
    [self setTabBarItem: input];
  }
}

NAN_GETTER(NUIViewController_UITabBarControllerItem::tabBarControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarController([self tabBarController]));
  }
}

