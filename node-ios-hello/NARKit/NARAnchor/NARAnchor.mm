//
//  NARAnchor.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARAnchor.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARAnchor::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARAnchor::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARAnchor"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARAnchor::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARAnchor *anchor = new NARAnchor();

  if (info[0]->IsExternal()) {
    anchor->SetNSObject((__bridge ARAnchor *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NARAnchor::New not implemented");
  }
  anchor->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NARAnchor::NARAnchor () {}
NARAnchor::~NARAnchor () {}
