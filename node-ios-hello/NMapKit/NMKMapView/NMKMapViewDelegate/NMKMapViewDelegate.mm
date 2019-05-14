//
//  MKMapViewDelegate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NMKMapViewDelegate.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NMKMapViewDelegate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NMKMapViewDelegate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("MKMapViewDelegate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NMKMapViewDelegate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NMKMapViewDelegate *ui = new NMKMapViewDelegate();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SMKMapViewDelegate *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SMKMapViewDelegate alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NMKMapViewDelegate::NMKMapViewDelegate () {}
NMKMapViewDelegate::~NMKMapViewDelegate () {}
