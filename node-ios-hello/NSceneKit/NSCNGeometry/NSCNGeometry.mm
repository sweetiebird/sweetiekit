//
//  SCNGeometry.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NSCNGeometry.h"

Nan::Persistent<FunctionTemplate> NSCNGeometry::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNGeometry::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNGeometry"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNGeometry::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNGeometry *ui = new NSCNGeometry();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SCNGeometry *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SCNGeometry alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSCNGeometry::NSCNGeometry () {}
NSCNGeometry::~NSCNGeometry () {}
