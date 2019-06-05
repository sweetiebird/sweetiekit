//
//  RPPreviewViewControllerDelegate.m
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewControllerDelegate.h"
#include "NRPPreviewViewController.h"

NRPPreviewViewControllerDelegate::NRPPreviewViewControllerDelegate () {}
NRPPreviewViewControllerDelegate::~NRPPreviewViewControllerDelegate () {}

JS_INIT_CLASS(RPPreviewViewControllerDelegate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, previewControllerDidFinish);
  // static members (ctor)
  JS_INIT_CTOR(RPPreviewViewControllerDelegate, NSObject);
JS_INIT_CLASS_END(RPPreviewViewControllerDelegate, NSObject);

NAN_METHOD(NRPPreviewViewControllerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NRPPreviewViewControllerDelegate *ui = new NRPPreviewViewControllerDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SRPPreviewViewControllerDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SRPPreviewViewControllerDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NRPPreviewViewControllerDelegate::previewControllerDidFinishGetter) {
  Nan::HandleScope scope;
  
  NRPPreviewViewControllerDelegate *del = ObjectWrap::Unwrap<NRPPreviewViewControllerDelegate>(info.This());
  SRPPreviewViewControllerDelegate *sDel = del->As<SRPPreviewViewControllerDelegate>();
  
  Nan::ThrowError("NRPPreviewViewControllerDelegate::previewControllerDidFinishGetter not implemented");
}

NAN_SETTER(NRPPreviewViewControllerDelegate::previewControllerDidFinishSetter) {
  Nan::HandleScope scope;
  
  NRPPreviewViewControllerDelegate *del = ObjectWrap::Unwrap<NRPPreviewViewControllerDelegate>(info.This());
  SRPPreviewViewControllerDelegate *sDel = del->As<SRPPreviewViewControllerDelegate>();
  
  del->_didFinish.Reset(Local<Function>::Cast(value));
  
  [sDel setDidFinish:^(RPPreviewViewController * _Nonnull preview) {
    Nan::HandleScope scope;
    Local<Value> prevObj = sweetiekit::GetWrapperFor(preview, NRPPreviewViewController::type);
    del->_didFinish("NRPPreviewViewControllerDelegate::previewControllerDidFinishSetter", prevObj);
  }];
}
