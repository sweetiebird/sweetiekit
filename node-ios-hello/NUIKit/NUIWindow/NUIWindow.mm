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

Local<Object> NUIWindow::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIWindow"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIWindow::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIWindow *view = new NUIWindow();

  if (info[0]->IsExternal()) {
    view->me = (__bridge UIWindow *)(info[0].As<External>()->Value());
  } else {
  /*
      double x = TO_DOUBLE(info[0]);
      double y = TO_DOUBLE(info[1]);
      double width = TO_DOUBLE(info[2]);
      double height = TO_DOUBLE(info[3]);

      @autoreleasepool {
        dispatch_async(dispatch_get_main_queue(), ^ {
            view->me = [[UIWindow alloc] initWithFrame:CGRectMake(x, y, width, height)];
        });
      }*/
  }
  view->Wrap(viewObj);

/*
  Nan::SetAccessor(viewObj, JS_STR("frame"), FrameGetter, FrameSetter);
  Nan::SetMethod(viewObj, "addSubview", AddSubview);*/

  info.GetReturnValue().Set(viewObj);
}

Local<Object> makeUIWindow() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIWindow::Initialize(isolate));
}

NUIWindow::NUIWindow () {}
NUIWindow::~NUIWindow () {}


NAN_METHOD(NUIWindow::SetRootViewController) {
  NUIWindow *win = ObjectWrap::Unwrap<NUIWindow>(Local<Object>::Cast(info.This()));

/*
  Local<Array> array = Local<Array>::Cast(info[0]);
  bool animated = TO_BOOL(info[1]);
  
  NSMutableArray *controllers = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NUIViewController *view = ObjectWrap::Unwrap<NUIViewController>(JS_OBJ(array->Get(i)));
      [controllers addObject:view->me];
    }
  }
  
  UITabBarController* c = (UITabBarController*)vc->me;
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      [c setViewControllers:controllers animated:animated];
      [[[UIApplication sharedApplication] keyWindow] setRootViewController:c];
    });
  }*/
}
