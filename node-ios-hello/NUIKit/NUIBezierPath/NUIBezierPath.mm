//
//  UIBezierPath.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIBezierPath.h"

Nan::Persistent<FunctionTemplate> NUIBezierPath::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIBezierPath::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIBezierPath"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIBezierPath::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIBezierPath *ui = new NUIBezierPath();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIBezierPath *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIBezierPath alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIBezierPath::NUIBezierPath () {}
NUIBezierPath::~NUIBezierPath () {}
