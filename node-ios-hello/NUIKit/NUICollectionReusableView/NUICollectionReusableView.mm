//
//  UICollectionReusableView.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/16/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NUIView.h"
#include "NUICollectionReusableView.h"

Nan::Persistent<FunctionTemplate> NUICollectionReusableView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUICollectionReusableView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UICollectionReusableView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUICollectionReusableView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUICollectionReusableView *ui = new NUICollectionReusableView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UICollectionReusableView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UICollectionReusableView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUICollectionReusableView::NUICollectionReusableView () {}
NUICollectionReusableView::~NUICollectionReusableView () {}
