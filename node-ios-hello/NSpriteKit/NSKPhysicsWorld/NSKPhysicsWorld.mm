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
  Nan::HandleScope scope;
  
  JS_UNWRAP(SKPhysicsWorld, world);
  
  __block double dx = 0;
  __block double dy = 0;
  @autoreleasepool {
    CGVector v = [world gravity];
    dx = v.dx;
    dy = v.dy;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("dx"), JS_NUM(dx));
  result->Set(JS_STR("dy"), JS_NUM(dy));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NSKPhysicsWorld::gravitySetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKPhysicsWorld, world);

  @autoreleasepool {
    double dx = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("dx")));
    double dy = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("dy")));
    CGVector v = CGVectorMake(dx, dy);
    [world setGravity:v];
  }
}

NAN_GETTER(NSKPhysicsWorld::contactDelegateGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKPhysicsWorld, world);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([world contactDelegate], NSKPhysicsContactDelegate::type));
}

NAN_SETTER(NSKPhysicsWorld::contactDelegateSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKPhysicsWorld, world);

  NSKPhysicsContactDelegate *del = ObjectWrap::Unwrap<NSKPhysicsContactDelegate>(Local<Object>::Cast(value));

  [world setContactDelegate:del->As<SSKPhysicsContactDelegate>()];
}
