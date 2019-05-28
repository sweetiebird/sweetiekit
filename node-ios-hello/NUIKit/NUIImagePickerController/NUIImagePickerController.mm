//
//  NUIImagePickerController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUINavigationController.h"
#include "NUIViewController.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIImagePickerController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImagePickerController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUINavigationController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImagePickerController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("delegate"), DelegateGetter, DelegateSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImagePickerController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerController *ctrl = new NUIImagePickerController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UIImagePickerController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        ctrl->SetNSObject([[UIImagePickerController alloc] init]);
        [ctrl->As<UIImagePickerController>() setAllowsEditing:YES];
        [ctrl->As<UIImagePickerController>() setSourceType:UIImagePickerControllerSourceTypeCamera];
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NAN_GETTER(NUIImagePickerController::DelegateGetter) {
  JS_UNWRAP(UIImagePickerController, ui);
  NUIImagePickerController *view = ObjectWrap::Unwrap<NUIImagePickerController>(info.This());
  Nan::ThrowError("NUIImagePickerController::DelegateGetter not yet implemented");
}

NAN_SETTER(NUIImagePickerController::DelegateSetter) {
  Nan::HandleScope scope;

  NUIImagePickerController *ctrl = ObjectWrap::Unwrap<NUIImagePickerController>(info.This());
  NUIImagePickerControllerDelegate *d = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(Local<Object>::Cast(value));
  auto delegate = d->As<SUIImagePickerControllerDelegate>();

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ctrl->As<UIImagePickerController>() setDelegate:delegate];
    });
  }
}

NUIImagePickerController::NUIImagePickerController () {}
NUIImagePickerController::~NUIImagePickerController () {}
