//
//  UIPopoverPresentationControllerDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIPopoverPresentationControllerDelegate.h"
#include "NUIPresentationController.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIPopoverPresentationControllerDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIPopoverPresentationControllerDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIPopoverPresentationControllerDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, adaptivePresentationStyle);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIPopoverPresentationControllerDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIPopoverPresentationControllerDelegate *ui = new NUIPopoverPresentationControllerDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SUIPopoverPresentationControllerDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SUIPopoverPresentationControllerDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIPopoverPresentationControllerDelegate::NUIPopoverPresentationControllerDelegate () {}
NUIPopoverPresentationControllerDelegate::~NUIPopoverPresentationControllerDelegate () {}

NAN_GETTER(NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleGetter) {
  Nan::HandleScope scope;
  
  NUIPopoverPresentationControllerDelegate *del = ObjectWrap::Unwrap<NUIPopoverPresentationControllerDelegate>(info.This());
  
  Nan::ThrowError("NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleGetter not implemented");
}

NAN_SETTER(NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleSetter) {
  Nan::EscapableHandleScope scope;
  
  NUIPopoverPresentationControllerDelegate *del = ObjectWrap::Unwrap<NUIPopoverPresentationControllerDelegate>(info.This());
  SUIPopoverPresentationControllerDelegate *sDel = del->As<SUIPopoverPresentationControllerDelegate>();

  del->_adaptivePresentationStyle.Reset(Local<Function>::Cast(value));

  [sDel setAdaptivePresentationStyle: ^ UIModalPresentationStyle (UIPresentationController * _Nonnull controller) {
    Nan::HandleScope scope;
    
    Local<Value> ctrlObj = sweetiekit::GetWrapperFor(controller, NUIPresentationController::type);
    Local<Value> resultVal = del->_adaptivePresentationStyle("NUIPopoverPresentationControllerDelegate::adaptivePresentationStyleSetter", ctrlObj);
    int res = resultVal->IsNumber() ? TO_UINT32(resultVal) : 0;

    return UIModalPresentationNone;
  }];
}
