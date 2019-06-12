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
  JS_ASSIGN_PROTO_METHOD(setRootViewController);
  JS_ASSIGN_PROTO_METHOD(makeKeyAndVisible);
  JS_ASSIGN_PROTO_PROP(rootViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIWindow, UIView);
JS_INIT_CLASS_END(UIWindow, UIView);

NAN_METHOD(NUIWindow::New) {
  JS_RECONSTRUCT(UIWindow);

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

#include "NUIViewController.h"

NAN_METHOD(NUIWindow::setRootViewController) {
  JS_UNWRAP(UIWindow, self);
  @autoreleasepool {
    [self setRootViewController:to_value_UIViewController(info[0])];
    [self makeKeyAndVisible];
  }
}

NAN_METHOD(NUIWindow::makeKeyAndVisible) {
  JS_UNWRAP(UIWindow, self);
  @autoreleasepool {
    [self makeKeyAndVisible];
  }
}

NAN_GETTER(NUIWindow::rootViewControllerGetter) {
  JS_UNWRAP(UIWindow, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self rootViewController]));
  }
}

NAN_SETTER(NUIWindow::rootViewControllerSetter) {
  JS_UNWRAP(UIWindow, self);
  @autoreleasepool {
    [self setRootViewController:to_value_UIViewController(value)];
    [self makeKeyAndVisible];
  }
}
