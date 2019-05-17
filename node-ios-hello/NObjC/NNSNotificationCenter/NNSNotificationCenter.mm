//
//  NSNotificationCenter.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NNSNotificationCenter.h"
#include "NNSNotification.h"

Nan::Persistent<FunctionTemplate> NNSNotificationCenter::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSNotificationCenter::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSNotificationCenter"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "postNotification", postNotification);
  Nan::SetMethod(proto, "addObserverForName", addObserverForName);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSNotificationCenter::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSNotificationCenter *ui = new NNSNotificationCenter();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSNotificationCenter *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([NSNotificationCenter defaultCenter]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NNSNotificationCenter::NNSNotificationCenter () {}
NNSNotificationCenter::~NNSNotificationCenter () {}

NAN_METHOD(NNSNotificationCenter::postNotification) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotificationCenter, ns);
  
  NNSNotification *notif = ObjectWrap::Unwrap<NNSNotification>(JS_OBJ(info[0]));

  @autoreleasepool {
    [ns postNotification:notif->As<NSNotification>()];
  }
}

NAN_METHOD(NNSNotificationCenter::addObserverForName) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSNotificationCenter, ns);

  @autoreleasepool {
    NSString *name = NJSStringToNSString(info[0]);
    
    [ns addObserverForName:name object:nil queue:nil usingBlock: ^ (NSNotification * _Nonnull note) {
      
    }];
  }
}
