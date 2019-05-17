//
//  NGifManager.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NGif.h"
#include "NGifManager.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NGifManager::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NGifManager::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("GifManager"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NGifManager::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NGifManager *ui = new NGifManager();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge GifManager *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      double limit = TO_DOUBLE(info[0]);
      ui->SetNSObject([[GifManager alloc] initWithMemoryLimit:limit]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NGifManager::NGifManager () {}
NGifManager::~NGifManager () {}
