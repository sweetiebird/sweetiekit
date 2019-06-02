//
//  NUIWindow.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIWindow.h"

NUIWindow::NUIWindow() {}
NUIWindow::~NUIWindow() {}

JS_INIT_CLASS(UIWindow, UIView);
  // instance members (proto)
  Nan::SetMethod(proto, "setRootViewController", SetRootViewController);
  Nan::SetMethod(proto, "makeKeyAndVisible", MakeKeyAndVisible);
  JS_ASSIGN_PROP(proto, rootViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIWindow, UIView);
JS_INIT_CLASS_END(UIWindow, UIView);

NAN_METHOD(NUIWindow::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIWindow *view = new NUIWindow();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIWindow *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NUIWindow::New must receive a UIWindow");
  }
  view->Wrap(viewObj);

  info.GetReturnValue().Set(viewObj);
}


NAN_METHOD(NUIWindow::SetRootViewController) {
  NUIWindow *win = ObjectWrap::Unwrap<NUIWindow>(Local<Object>::Cast(info.This()));
  NNSObject *vc = ObjectWrap::Unwrap<NNSObject>(Local<Object>::Cast(info[0]));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [win->As<UIWindow>() setRootViewController:vc->As<UITabBarController>()];
      [win->As<UIWindow>() makeKeyAndVisible];
    });
  }
}

NAN_METHOD(NUIWindow::MakeKeyAndVisible) {
  NUIWindow *win = ObjectWrap::Unwrap<NUIWindow>(Local<Object>::Cast(info.This()));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [win->As<UIWindow>() makeKeyAndVisible];
    });
  }
}

#include "NUIViewController.h"

NAN_GETTER(NUIWindow::rootViewControllerGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIWindow, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui rootViewController], NUIViewController::type));
}

NAN_SETTER(NUIWindow::rootViewControllerSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIWindow, ui);

  NNSObject *vc = ObjectWrap::Unwrap<NNSObject>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setRootViewController:vc->As<UITabBarController>()];
    [ui makeKeyAndVisible];
  }
}
