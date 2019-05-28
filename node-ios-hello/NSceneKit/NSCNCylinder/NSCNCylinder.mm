//
//  SCNCylinder.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNCylinder.h"

Nan::Persistent<FunctionTemplate> NSCNCylinder::type;

NSCNCylinder::NSCNCylinder () {}
NSCNCylinder::~NSCNCylinder () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNCylinder::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNCylinder"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNCylinder::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNCylinder *ui = new NSCNCylinder();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNCylinder *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNCylinder alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}
