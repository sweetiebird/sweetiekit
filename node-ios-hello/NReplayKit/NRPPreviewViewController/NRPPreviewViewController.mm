//
//  RPPreviewViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewController.h"
#include "NRPPreviewViewControllerDelegate.h"
#import "node_ios_hello-Swift.h"

NRPPreviewViewController::NRPPreviewViewController () {}
NRPPreviewViewController::~NRPPreviewViewController () {}

Nan::Persistent<FunctionTemplate> NRPPreviewViewController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NRPPreviewViewController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("RPPreviewViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, previewControllerDelegate);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NRPPreviewViewController::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NRPPreviewViewController *ui = new NRPPreviewViewController();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge RPPreviewViewController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[RPPreviewViewController alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NRPPreviewViewController::previewControllerDelegateGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NRPPreviewViewController::previewControllerDelegateGetter not implemented");
}

NAN_SETTER(NRPPreviewViewController::previewControllerDelegateSetter) {
  Nan::HandleScope scope;
  
  NRPPreviewViewController *rp = ObjectWrap::Unwrap<NRPPreviewViewController>(info.This());
  NRPPreviewViewControllerDelegate *del = ObjectWrap::Unwrap<NRPPreviewViewControllerDelegate>(Local<Object>::Cast(value));
  auto delegate = del->As<SRPPreviewViewControllerDelegate>();

  rp->_delegate.Reset(value);
  
  @autoreleasepool {
    auto ui = rp->As<RPPreviewViewController>();
    [ui associateValue:delegate withKey:@"sweetiekit.pickerview.delegate"];
    [ui setPreviewControllerDelegate:delegate];
  }
}


