//
//  NUIImagePickerControllerDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIImagePickerControllerDelegate.h"

Nan::Persistent<FunctionTemplate> NUIImagePickerControllerDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImagePickerControllerDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImagePickerControllerDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("onInfo"), OnInfoGetter, OnInfoSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImagePickerControllerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerControllerDelegate *ctrl = new NUIImagePickerControllerDelegate();

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ctrl->As<SUIImagePickerControllerDelegate>();
    });
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NAN_SETTER(NUIImagePickerControllerDelegate::OnInfoSetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *del = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  del->_onInfo->Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      SUIImagePickerControllerDelegate* d = del->As<SUIImagePickerControllerDelegate>();
      [d setOnInfoClosureWithClosure:^(UIImagePickerController * _Nonnull, NSDictionary<UIImagePickerControllerInfoKey, id> * _Nonnull) {
        sweetiekit::Resolve(del->_onInfo);
        return true;
      }];
    });
  }
}

NAN_GETTER(NUIImagePickerControllerDelegate::OnInfoGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_onInfo));
}

NUIImagePickerControllerDelegate::NUIImagePickerControllerDelegate () : _onInfo(new Nan::Persistent<Function>()) {}
NUIImagePickerControllerDelegate::~NUIImagePickerControllerDelegate () { delete _onInfo; }
