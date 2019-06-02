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
  JS_ASSIGN_PROP_READONLY(proto, tabBar);
  // static members (ctor)
  JS_INIT_CTOR(UITabBarController, UIViewController);
JS_INIT_CLASS_END(UITabBarController, UIViewController);

NAN_METHOD(NUITabBarController::New) {
  Nan::HandleScope scope;

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

#include "NUITabBar.h"

NAN_GETTER(NUITabBarController::tabBarGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UITabBarController, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui tabBar], NUITabBar::type)));
}
