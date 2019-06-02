//
//  RPPreviewViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewController.h"
#include "NRPPreviewViewControllerDelegate.h"

NRPPreviewViewController::NRPPreviewViewController () {}
NRPPreviewViewController::~NRPPreviewViewController () {}

JS_INIT_CLASS(RPPreviewViewController, UIViewController);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, previewControllerDelegate);
  // static members (ctor)
  JS_INIT_CTOR(RPPreviewViewController, UIViewController);
JS_INIT_CLASS_END(RPPreviewViewController, UIViewController);

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


