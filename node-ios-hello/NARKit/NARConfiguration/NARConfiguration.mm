//
//  NARConfiguration.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARConfiguration.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARConfiguration::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARConfiguration::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARConfiguration"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "isLightEstimationEnabled", IsLightEstimationEnabled);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARConfiguration::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARConfiguration *config = new NARConfiguration();

  if (info[0]->IsExternal()) {
    config->SetNSObject((__bridge ARConfiguration *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("Init not available");
  }
  config->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NARConfiguration::NARConfiguration () {}
NARConfiguration::~NARConfiguration () {}

NAN_GETTER(NARConfiguration::IsLightEstimationEnabledGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);
  
  JS_SET_RETURN(JS_FLOAT([config isLightEstimationEnabled]));
}

NAN_SETTER(NARConfiguration::IsLightEstimationEnabledSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);

  @autoreleasepool {
    [config setLightEstimationEnabled:TO_BOOL(value)];
  }
}
