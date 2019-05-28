//
//  NUIWindow.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIWindow.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUIWindow::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIWindow::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIWindow"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "setRootViewController", SetRootViewController);
  Nan::SetMethod(proto, "makeKeyAndVisible", MakeKeyAndVisible);
  JS_ASSIGN_PROP(proto, rootViewController);
  JS_ASSIGN_PROP_READONLY(proto, layer);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NUIWindow::NUIWindow () {}
NUIWindow::~NUIWindow () {}


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

#include "NCALayer.h"

NAN_GETTER(NUIWindow::layerGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIWindow, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui layer], NCALayer::type));
}
