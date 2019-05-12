//
//  NSKNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NSKNode.h"
#include "NUIResponder.h"
#include "NARSession.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIResponder::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKNode *node = new NSKNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        node->SetNSObject([[SKNode alloc] init]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKNode::NSKNode () {}
NSKNode::~NSKNode () {}
