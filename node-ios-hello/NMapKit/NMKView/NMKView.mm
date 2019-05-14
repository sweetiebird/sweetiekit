//
//  MKView.m
//  node-ios-hello
//
//  Created by undefined on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NUIView.h"
#include "NMKView.h"

Nan::Persistent<FunctionTemplate> NMKView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NMKView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("MKView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NMKView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NMKView *ui = new NMKView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge MKView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[MKView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NMKView::NMKView () {}
NMKView::~NMKView () {}
