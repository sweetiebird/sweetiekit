//
//  CLPlacemark.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NCLPlacemark.h"
#include "NCLLocation.h"

Nan::Persistent<FunctionTemplate> NCLPlacemark::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCLPlacemark::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CLPlacemark"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, location);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCLPlacemark::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCLPlacemark *ui = new NCLPlacemark();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CLPlacemark *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CLPlacemark alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NCLPlacemark::NCLPlacemark () {}
NCLPlacemark::~NCLPlacemark () {}

NAN_GETTER(NCLPlacemark::locationGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CLPlacemark, cl);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([cl location], NCLLocation::type));
}
