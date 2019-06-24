//
//  NUITabBarController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarController.h"

NUITabBarController::NUITabBarController() {}
NUITabBarController::~NUITabBarController() {}

JS_INIT_CLASS(UITabBarController, UIViewController);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, setViewControllers);
  JS_ASSIGN_PROTO_PROP(viewControllers);
  JS_ASSIGN_PROTO_PROP(selectedIndex);
  JS_ASSIGN_PROTO_PROP(selectedViewController);
  JS_ASSIGN_PROP_READONLY(proto, tabBar);
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

  Local<Object> ctrlObj = info.This();

  NUITabBarController *ctrl = new NUITabBarController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITabBarController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ctrl->SetNSObject([[UITabBarController alloc] init]);
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}


NAN_METHOD(NUITabBarController::setViewControllers) {
  NUITabBarController *vc = ObjectWrap::Unwrap<NUITabBarController>(Local<Object>::Cast(info.This()));

  Local<Array> array = Local<Array>::Cast(info[0]);
  bool animated = TO_BOOL(info[1]);
  
  NSMutableArray *controllers = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NUIViewController *view = ObjectWrap::Unwrap<NUIViewController>(JS_OBJ(array->Get(i)));
      [controllers addObject:view->As<UIViewController>()];
    }
  }
  
  UITabBarController* c = vc->As<UITabBarController>();
  
  @autoreleasepool {
    [c setViewControllers:controllers animated:animated];
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

NAN_GETTER(NUITabBarController::selectedIndexGetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self selectedIndex]));
  }
}

NAN_SETTER(NUITabBarController::selectedIndexSetter) {
  JS_UNWRAP(UITabBarController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setSelectedIndex: input];
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

#include "NUITabBar.h"

NAN_GETTER(NUITabBarController::tabBarGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UITabBarController, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui tabBar], NUITabBar::type)));
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

