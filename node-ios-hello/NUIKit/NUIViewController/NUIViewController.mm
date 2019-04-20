//
//  NUIViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIViewController.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUIViewController::type;

NUIViewController::NUIViewController () {}
NUIViewController::~NUIViewController () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIViewController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIResponder::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("view"), ViewGetter);
  Nan::SetMethod(proto, "present", PresentViewController);
  Nan::SetMethod(proto, "dismiss", DismissViewController);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIViewController::New) {
  Nan::HandleScope scope;

  Local<Object> controllerObj = info.This();

  NUIViewController *ctrl = new NUIViewController();
  
  UIViewController* vc = info[0]->IsExternal() ? (__bridge UIViewController *)(info[0].As<External>()->Value())  : [UIViewController alloc];

  ctrl->SetNSObject(vc);
  [ctrl->As<UIViewController>() addTargetClosureWithClosure:^(UITextField* field){
    const char* text = [[field text] UTF8String];
    iOSLog0(text);
    //sweetiekit::Resolve(cb);
    return true;
  }];
  ctrl->Wrap(controllerObj);

  info.GetReturnValue().Set(controllerObj);
}

NAN_GETTER(NUIViewController::ViewGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  
  __block UIView* view = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      view = [ctrl->As<UIViewController>() view];
    });
  }

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)view)
  };
  Local<Object> viewObj = JS_TYPE(NUIView)->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(viewObj);
}

NAN_METHOD(NUIViewController::PresentViewController)
{
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>();
  
  NUIViewController *vc = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));
  bool animated = info[1]->IsBoolean() ? TO_BOOL(info[1]) : true;
  if (info[2]->IsFunction()) {
    cb->Reset(Local<Function>::Cast(info[2]));
  }

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^{
      [ctrl->As<UIViewController>() presentViewController:vc->As<UIViewController>() animated:animated completion:^{
        sweetiekit::Resolve(cb, true);
      }];
    });
  }
}

NAN_METHOD(NUIViewController::DismissViewController)
{
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>();
  
  bool animated = info[0]->IsBoolean() ? TO_BOOL(info[0]) : true;
  if (info[1]->IsFunction()) {
    cb->Reset(Local<Function>::Cast(info[1]));
  }

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^{
      [ctrl->As<UIViewController>() dismissViewControllerAnimated:animated
       completion:^{
        sweetiekit::Resolve(cb, true);
      }];
    });
  }
}
