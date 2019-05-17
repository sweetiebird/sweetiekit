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
  Nan::SetAccessor(proto, JS_STR("result"), ResultGetter);
  Nan::SetAccessor(proto, JS_STR("onInfo"), OnInfoGetter, OnInfoSetter);
  Nan::SetAccessor(proto, JS_STR("onCancel"), OnCancelGetter, OnCancelSetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImagePickerControllerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUIImagePickerControllerDelegate *ctrl = new NUIImagePickerControllerDelegate();

  @autoreleasepool {
    ctrl->SetNSObject([[SUIImagePickerControllerDelegate alloc] init]);
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NAN_SETTER(NUIImagePickerControllerDelegate::OnInfoSetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *del = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  del->_onInfo->Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    SUIImagePickerControllerDelegate* d = del->As<SUIImagePickerControllerDelegate>();
    [d setOnInfoClosureWithClosure:^(UIImagePickerController * _Nonnull, NSDictionary<UIImagePickerControllerInfoKey, id> * _Nonnull) {
      Nan::HandleScope scope;
      sweetiekit::Resolve(del->_onInfo);
      return true;
    }];
  }
}


NAN_GETTER(NUIImagePickerControllerDelegate::ResultGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  auto obj = [view->As<SUIImagePickerControllerDelegate>() infoResult];
  if (obj != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)obj)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(obj, NNSObject::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      info.GetReturnValue().Set(value);
  }
  

  //info.GetReturnValue().Set(Nan::New(view->_onInfo));
}

NAN_GETTER(NUIImagePickerControllerDelegate::OnInfoGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_onInfo));
}

NAN_SETTER(NUIImagePickerControllerDelegate::OnCancelSetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *del = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());
  del->_onCancel->Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    SUIImagePickerControllerDelegate* d = del->As<SUIImagePickerControllerDelegate>();
    [d setOnCancelClosureWithClosure:^(UIImagePickerController * _Nonnull) {
      Nan::HandleScope scope;
      sweetiekit::Resolve(del->_onCancel);
      return true;
    }];
  }
}

NAN_GETTER(NUIImagePickerControllerDelegate::OnCancelGetter) {
  Nan::HandleScope scope;

  NUIImagePickerControllerDelegate *view = ObjectWrap::Unwrap<NUIImagePickerControllerDelegate>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_onCancel));
}

NUIImagePickerControllerDelegate::NUIImagePickerControllerDelegate ()
: _onInfo(new Nan::Persistent<Function>())
, _onCancel(new Nan::Persistent<Function>())
{}
NUIImagePickerControllerDelegate::~NUIImagePickerControllerDelegate () { delete _onInfo; delete _onCancel; }
