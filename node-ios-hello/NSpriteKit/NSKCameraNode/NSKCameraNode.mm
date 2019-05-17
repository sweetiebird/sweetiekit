//
//  SKCameraNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#include "defines.h"
#include "NSKNode.h"
#include "NSKCameraNode.h"

Nan::Persistent<FunctionTemplate> NSKCameraNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKCameraNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKNode::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKCameraNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKCameraNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKCameraNode *ui = new NSKCameraNode();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKCameraNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKCameraNode alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NSKCameraNode::NSKCameraNode () {}
NSKCameraNode::~NSKCameraNode () {}
