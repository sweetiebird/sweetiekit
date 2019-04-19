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

Local<Object> makeUIViewController() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIViewController::Initialize(isolate));
}

NUIViewController::NUIViewController () {}
NUIViewController::~NUIViewController () {}

Local<Object> NUIViewController::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  Nan::SetAccessor(proto, JS_STR("view"), ViewGetter);

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIViewController::New) {
  Nan::HandleScope scope;

  Local<Object> controllerObj = info.This();

  NUIViewController *ctrl = new NUIViewController();
  
  UIViewController* vc = info[0]->IsExternal() ? (__bridge UIViewController *)(info[0].As<External>()->Value())  : [UIViewController alloc];

  ctrl->me = vc;
  ctrl->Wrap(controllerObj);

  info.GetReturnValue().Set(controllerObj);
}

NAN_GETTER(NUIViewController::ViewGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)[ctrl->me view])
  };
  Local<Object> viewObj = JS_TYPE(NUIView)->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(viewObj);
}
