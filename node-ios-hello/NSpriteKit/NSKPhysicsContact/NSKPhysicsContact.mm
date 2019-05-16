//
//  SKPhysicsContact.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSKPhysicsContact.h"
#include "NSKPhysicsBody.h"

Nan::Persistent<FunctionTemplate> NSKPhysicsContact::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKPhysicsContact::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKPhysicsContact"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, bodyA);
  JS_ASSIGN_PROP_READONLY(proto, bodyB);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKPhysicsContact::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsContact *ui = new NSKPhysicsContact();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKPhysicsContact *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKPhysicsContact alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKPhysicsContact::NSKPhysicsContact () {}
NSKPhysicsContact::~NSKPhysicsContact () {}

NAN_GETTER(NSKPhysicsContact::bodyAGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKPhysicsContact, con);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([con bodyA], NSKPhysicsBody::type));
}

NAN_GETTER(NSKPhysicsContact::bodyBGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKPhysicsContact, con);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([con bodyB], NSKPhysicsBody::type));
}

