//
//  NUINib.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUINib.h"
#include "NNSObject.h"

Nan::Persistent<FunctionTemplate> NUINib::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUINib::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UINib"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUINib::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINib *nib = new NUINib();

  if (info[0]->IsExternal()) {
    nib->SetNSObject((__bridge UINib *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string name;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      name = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *nibName = [NSString stringWithUTF8String:name.c_str()];
      nib->SetNSObject([UINib nibWithNibName:nibName bundle:nullptr]);
    }
  } else {
    @autoreleasepool {
      nib->SetNSObject([[UINib alloc] init]);
    }
  }
  nib->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUINib::NUINib () {}
NUINib::~NUINib () {}
