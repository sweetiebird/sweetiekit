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
#include "NSKTexture.h"

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
  Nan::SetMethod(ctorFn, "bodyWithCircleOfRadius", bodyWithCircleOfRadius);
  Nan::SetMethod(ctorFn, "bodyWithTexture", bodyWithTexture);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKPhysicsBody::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKPhysicsBody *body = new NSKPhysicsBody();

  if (info[0]->IsExternal()) {
    body->SetNSObject((__bridge SKPhysicsBody *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      body->SetNSObject([[SKPhysicsBody alloc] init]);
    }
  }
  body->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKPhysicsBody::NSKPhysicsBody () {}
NSKPhysicsBody::~NSKPhysicsBody () {}

NAN_METHOD(NSKPhysicsBody::bodyWithCircleOfRadius) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKPhysicsBody)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKPhysicsBody *body = ObjectWrap::Unwrap<NSKPhysicsBody>(obj);

  if (info.Length() == 1) {
    @autoreleasepool {
      float radius = TO_FLOAT(info[0]);
      body->SetNSObject([SKPhysicsBody bodyWithCircleOfRadius:radius]);
    }
  } else if (info.Length() > 1) {
    @autoreleasepool {
      float radius = TO_FLOAT(info[0]);
      double x = TO_DOUBLE(JS_OBJ(info[1])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[1])->Get(JS_STR("y")));
      CGPoint center = CGPointMake(x, y);
      body->SetNSObject([SKPhysicsBody bodyWithCircleOfRadius:radius center:center]);
    }
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NSKPhysicsBody::bodyWithTexture) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NSKPhysicsBody)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NSKPhysicsBody *body = ObjectWrap::Unwrap<NSKPhysicsBody>(obj);

  @autoreleasepool {
    NSKTexture *tx = ObjectWrap::Unwrap<NSKTexture>(Local<Object>::Cast(info[0]));
    double w = TO_DOUBLE(JS_OBJ(info[1])->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(info[1])->Get(JS_STR("height")));
    body->SetNSObject([SKPhysicsBody bodyWithTexture:tx->As<SKTexture>() size:CGSizeMake(w, h)]);
  }

  JS_SET_RETURN(obj);
}
