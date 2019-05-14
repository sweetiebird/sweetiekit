//
//  NSCNNode.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>
#include "defines.h"
#include "NSCNNode.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addChildNode", AddChildNode);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNNode *node = new NSCNNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SCNNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      node->SetNSObject([[SCNNode alloc] init]);
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNNode::NSCNNode () {}
NSCNNode::~NSCNNode () {}

NAN_METHOD(NSCNNode::AddChildNode) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNNode, node);
  NSCNNode *child = ObjectWrap::Unwrap<NSCNNode>(Local<Object>::Cast(info[0]));
  
  [node addChildNode:child->As<SCNNode>()];
}
