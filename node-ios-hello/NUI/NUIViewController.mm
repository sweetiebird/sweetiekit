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

Local<Object> NUIViewController::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewController"));

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  //Nan::SetMethod(proto, "init", InitMethod);

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

//NAN_GETTER(NUIViewController::ViewGetter) {
//  Nan::HandleScope scope;
//
//  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
//  info.GetReturnValue().Set(JS_OBJ(ctrl->GetView()));
//}

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

Local<Object> makeUIViewController() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIViewController::Initialize(isolate));
}

NUIViewController::NUIViewController () {
//    viewWrapper = new NUIView();
}
NUIViewController::~NUIViewController () {}

