//
//  RPScreenRecorder.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NRPScreenRecorder.h"

Nan::Persistent<FunctionTemplate> NRPScreenRecorder::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NRPScreenRecorder::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("RPScreenRecorder"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NRPScreenRecorder::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NRPScreenRecorder *ui = new NRPScreenRecorder();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge RPScreenRecorder *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[RPScreenRecorder alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NRPScreenRecorder::NRPScreenRecorder () {}
NRPScreenRecorder::~NRPScreenRecorder () {}
