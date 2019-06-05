//
//  MKDirectionsRequest.m
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NMKDirectionsRequest.h"

Nan::Persistent<FunctionTemplate> NMKDirectionsRequest::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NMKDirectionsRequest::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("MKDirectionsRequest"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NMKDirectionsRequest::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NMKDirectionsRequest *ui = new NMKDirectionsRequest();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge MKDirectionsRequest *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[MKDirectionsRequest alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NMKDirectionsRequest::NMKDirectionsRequest () {}
NMKDirectionsRequest::~NMKDirectionsRequest () {}
