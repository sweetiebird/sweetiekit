//
//  UITapGestureRecognizer.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NUIGestureRecognizer.h"
#include "NUITapGestureRecognizer.h"

Nan::Persistent<FunctionTemplate> NUITapGestureRecognizer::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITapGestureRecognizer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIGestureRecognizer::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITapGestureRecognizer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITapGestureRecognizer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITapGestureRecognizer *ui = new NUITapGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITapGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITapGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUITapGestureRecognizer::NUITapGestureRecognizer () {}
NUITapGestureRecognizer::~NUITapGestureRecognizer () {}
