//
//  NSKLabelNode.m
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
#include "NSKLabelNode.h"
#include "NARSession.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKLabelNode::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKLabelNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKNode::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKLabelNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "text", Text);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKLabelNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKLabelNode *node = new NSKLabelNode();

  if (info[0]->IsExternal()) {
    node->SetNSObject((__bridge SKLabelNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        SKLabelNode *n = [[SKLabelNode alloc] init];
        [n setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [n setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [n setFontSize:50];
        [n setFontName:@"Arial-BoldMT"];
        node->SetNSObject([[SKLabelNode alloc] init]);
      });
    }
  }
  node->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKLabelNode::NSKLabelNode () {}
NSKLabelNode::~NSKLabelNode () {}

NAN_GETTER(NSKLabelNode::TextGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  __block NSString* str = nullptr;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      str = [node text];
    });
  }

  if (str != nullptr) {
    auto result = JS_STR([str UTF8String]);
    info.GetReturnValue().Set(result);
  }
}

NAN_SETTER(NSKLabelNode::TextSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SKLabelNode, node);

  std::string text;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    text = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [node setText:[NSString stringWithUTF8String:text.c_str()]];
    });
  }
}
