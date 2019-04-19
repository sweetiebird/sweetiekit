//
//  NUIViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIViewController.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUIViewController::type;

Local<Object> NUIViewController::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  //Nan::SetMethod(proto, "init", InitMethod);
  Nan::SetAccessor(proto, JS_STR("view"), ViewGetter);
  Nan::SetMethod(proto, "setViewControllers", SetViewControllers);

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIViewController::New) {
  Nan::HandleScope scope;

  Local<Object> controllerObj = info.This();

  NUIViewController *ctrl = new NUIViewController();
  
  UIViewController* vc = info[0]->IsExternal() ? (__bridge UIViewController *)(info[0].As<External>()->Value())  : [UIViewController alloc];

  ctrl->controller = vc;
  ctrl->Wrap(controllerObj);

//  Nan::SetAccessor(controllerObj, JS_STR("width"), WidthGetter);
//  Nan::SetAccessor(controllerObj, JS_STR("height"), HeightGetter);

  info.GetReturnValue().Set(controllerObj);
}

//NAN_GETTER(NUIViewController::WidthGetter) {
//  Nan::HandleScope scope;
//
//  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
//  info.GetReturnValue().Set(JS_INT(ctrl->GetWidth()));
//}

NAN_GETTER(NUIViewController::ViewGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)[ctrl->controller view])
  };
  Local<Object> viewObj = JS_TYPE(NUIView)->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(viewObj);
}

//unsigned int NUIViewController::GetWidth() {
//  if (controller) {
//    return 42;
////    return [[[controller view] frame] width];
//  } else {
//    return 0;
//  }
//}

//NUIView* NUIViewController::GetView() {
//  if (controller) {
//   viewWrapper->me = [controller view];
//   return viewWrapper;
////    return controller->view.frame.height;
//  } else {
//    return nullptr;
//  }
//}


NAN_METHOD(NUIViewController::SetViewControllers) {
  NUIViewController *vc = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info.This()));


  Local<Array> array = Local<Array>::Cast(info[0]);
  bool animated = TO_BOOL(info[1]);
  
  NSMutableArray *controllers = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NUIViewController *view = ObjectWrap::Unwrap<NUIViewController>(JS_OBJ(array->Get(i)));
      [controllers addObject:view->controller];
    }
  }
  
  UITabBarController* c = (UITabBarController*)vc->controller;
  
  @autoreleasepool {
    dispatch_async(dispatch_get_main_queue(), ^ {
      [c setViewControllers:controllers animated:animated];
      [[[UIApplication sharedApplication] keyWindow] setRootViewController:c];
    });
  }
}

Local<Object> makeUIViewController() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIViewController::Initialize(isolate));
}

NUIViewController::NUIViewController () {
//    viewWrapper = new NUIView();
}
NUIViewController::~NUIViewController () {}

