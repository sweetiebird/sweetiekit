//
//  SCNSphere.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNSphere.h"

Nan::Persistent<FunctionTemplate> NSCNSphere::type;

NSCNSphere::NSCNSphere () {}
NSCNSphere::~NSCNSphere () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNSphere::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNSphere"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNSphere::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNSphere *ui = new NSCNSphere();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNSphere *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNSphere alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}
