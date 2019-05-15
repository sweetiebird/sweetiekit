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
#include "NSKPhysicsBody.h"
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
  JS_SET_PROP(proto, "physicsBody", PhysicsBody);
  JS_SET_PROP(proto, "position", Position);
  JS_SET_PROP(proto, "zRotation", ZRotation);
  Nan::SetMethod(proto, "addChild", AddChild);
  Nan::SetMethod(proto, "removeFromParent", RemoveFromParent);
  
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
        node->SetNSObject([SKNode node]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKNode::NSKNode () {}
NSKNode::~NSKNode () {}

NAN_GETTER(NSKNode::PositionGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_FLOAT([node position].x));
  result->Set(JS_STR("y"), JS_FLOAT([node position].y));
  
  JS_SET_RETURN(result);
}

NAN_SETTER(NSKNode::PositionSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  __block float x = 0;
  __block float y = 0;
  @autoreleasepool {
    x = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("x")));
    y = TO_FLOAT(JS_OBJ(value)->Get(JS_STR("y")));
  }

  [node setPosition:CGPointMake(x, y)];
}

NAN_GETTER(NSKNode::ZRotationGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  JS_SET_RETURN(JS_FLOAT([node zRotation]));
}

NAN_SETTER(NSKNode::ZRotationSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  __block float rotation = 0;
  @autoreleasepool {
    rotation = TO_FLOAT(value);
  }

  [node setZRotation:rotation];
}

NAN_GETTER(NSKNode::PhysicsBodyGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([node physicsBody], NSKPhysicsBody::type));
}

NAN_SETTER(NSKNode::PhysicsBodySetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);
  
  NSKPhysicsBody *body = ObjectWrap::Unwrap<NSKPhysicsBody>(Local<Object>::Cast(value));

  [node setPhysicsBody:body->As<SKPhysicsBody>()];
}

NAN_METHOD(NSKNode::AddChild) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  NSKNode *child = ObjectWrap::Unwrap<NSKNode>(Local<Object>::Cast(info[0]));

  [node addChild:child->As<SKNode>()];
}

NAN_METHOD(NSKNode::RemoveFromParent) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKNode, node);

  [node removeFromParent];
}
