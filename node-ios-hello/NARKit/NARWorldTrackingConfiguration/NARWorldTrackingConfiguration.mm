//
//  NARWorldTrackingConfiguration.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARWorldTrackingConfiguration.h"
#include "NARConfiguration.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARWorldTrackingConfiguration::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARWorldTrackingConfiguration::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NARConfiguration::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARWorldTrackingConfiguration"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARWorldTrackingConfiguration::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARWorldTrackingConfiguration *config = new NARWorldTrackingConfiguration();

  if (info[0]->IsExternal()) {
    config->SetNSObject((__bridge ARWorldTrackingConfiguration *)(info[0].As<External>()->Value()));
  } else {
    config->SetNSObject([[ARWorldTrackingConfiguration alloc] init]);
  }
  config->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NARWorldTrackingConfiguration::NARWorldTrackingConfiguration () {}
NARWorldTrackingConfiguration::~NARWorldTrackingConfiguration () {}
