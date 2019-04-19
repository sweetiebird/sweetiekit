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
  
  
  ctrl->controller = [UIViewController alloc];
  ctrl->Wrap(controllerObj);

  Nan::SetAccessor(controllerObj, JS_STR("width"), WidthGetter);
  Nan::SetAccessor(controllerObj, JS_STR("height"), HeightGetter);

  info.GetReturnValue().Set(controllerObj);
}

NAN_GETTER(NUIViewController::WidthGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  info.GetReturnValue().Set(JS_INT(ctrl->GetWidth()));
}

NAN_GETTER(NUIViewController::HeightGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  info.GetReturnValue().Set(JS_INT(ctrl->GetHeight()));
}

unsigned int NUIViewController::GetWidth() {
  if (controller) {
    return 42;
//    return [[[controller view] frame] width];
  } else {
    return 0;
  }
}

unsigned int NUIViewController::GetHeight() {
  if (controller) {
  return 42;
//    return controller->view.frame.height;
  } else {
    return 0;
  }
}

Local<Object> makeUIViewController() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIViewController::Initialize(isolate));
}

NUIViewController::NUIViewController () {}
NUIViewController::~NUIViewController () {}

