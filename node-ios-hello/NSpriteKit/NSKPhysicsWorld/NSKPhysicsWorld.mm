//
//  SKPhysicsWorld.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSKPhysicsWorld.h"
#include "NSKPhysicsContactDelegate.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKPhysicsWorld::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKPhysicsWorld::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKPhysicsWorld"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, gravity);
  JS_ASSIGN_PROP(proto, speed);
  JS_ASSIGN_PROP(proto, contactDelegate);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKPhysicsWorld::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsWorld *ui = new NSKPhysicsWorld();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKPhysicsWorld *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKPhysicsWorld alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKPhysicsWorld::NSKPhysicsWorld () {}
NSKPhysicsWorld::~NSKPhysicsWorld () {}

NAN_GETTER(NSKPhysicsWorld::gravityGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGVector([self gravity]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::gravitySetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setGravity: to_value_CGVector(value)];
  }
}

NAN_GETTER(NSKPhysicsWorld::speedGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self speed]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::speedSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setSpeed: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKPhysicsWorld::contactDelegateGetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SKPhysicsContactDelegate([self contactDelegate]));
    return;
  }
}

NAN_SETTER(NSKPhysicsWorld::contactDelegateSetter) {
  JS_UNWRAP(SKPhysicsWorld, self);
  @autoreleasepool
  {
    [self setContactDelegate: to_value_SKPhysicsContactDelegate(value)];
  }
}
