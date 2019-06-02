//
//  RPPreviewViewControllerDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPPreviewViewControllerDelegate.h"
#include "NRPPreviewViewController.h"
#import "node_ios_hello-Swift.h"

NRPPreviewViewControllerDelegate::NRPPreviewViewControllerDelegate () {}
NRPPreviewViewControllerDelegate::~NRPPreviewViewControllerDelegate () {}

Nan::Persistent<FunctionTemplate> NRPPreviewViewControllerDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NRPPreviewViewControllerDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("RPPreviewViewControllerDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, previewControllerDidFinish);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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
