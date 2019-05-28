//
//  SCNBox.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNBox.h"

Nan::Persistent<FunctionTemplate> NSCNBox::type;

NSCNBox::NSCNBox () {}
NSCNBox::~NSCNBox () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNBox::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNBox"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNBox::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNBox *ui = new NSCNBox();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNBox *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNBox alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}
