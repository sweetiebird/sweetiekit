//
//  SCNCone.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNCone.h"

Nan::Persistent<FunctionTemplate> NSCNCone::type;

NSCNCone::NSCNCone () {}
NSCNCone::~NSCNCone () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNCone::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNCone"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNCone::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNCone *ui = new NSCNCone();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNCone *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNCone alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}
