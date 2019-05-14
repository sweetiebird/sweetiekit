//
//  SKPhysicsBody.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSKPhysicsBody.h"

Nan::Persistent<FunctionTemplate> NSKPhysicsBody::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKPhysicsBody::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKPhysicsBody"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKPhysicsBody::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsBody *ui = new NSKPhysicsBody();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKPhysicsBody *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKPhysicsBody alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKPhysicsBody::NSKPhysicsBody () {}
NSKPhysicsBody::~NSKPhysicsBody () {}
