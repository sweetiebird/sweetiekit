//
//  NUIResponder.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NUIResponder.h"

Nan::Persistent<FunctionTemplate> NUIResponder::type;

NUIResponder::NUIResponder () {}
NUIResponder::~NUIResponder () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIResponder::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIResponder"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIResponder::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIResponder *view = new NUIResponder();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIResponder *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NUIResponder::New must receive a UIResponder");
  }
  view->Wrap(viewObj);

  info.GetReturnValue().Set(viewObj);
}
