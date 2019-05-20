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
  JS_ASSIGN_PROP(proto, worldAlignment);

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
  
  JS_SET_RETURN(JS_BOOL([config isLightEstimationEnabled]));
}

NAN_SETTER(NARConfiguration::IsLightEstimationEnabledSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);

  @autoreleasepool {
    [config setLightEstimationEnabled:TO_BOOL(value)];
  }
}

NAN_GETTER(NARConfiguration::worldAlignmentGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);
  
  ARWorldAlignment align = [config worldAlignment];

  int alignVal = 0;
  if (align == ARWorldAlignmentGravityAndHeading) {
    alignVal = 2;
  } else if (align == ARWorldAlignmentGravity) {
    alignVal = 1;
  }

  JS_SET_RETURN(JS_NUM(alignVal));
}

NAN_SETTER(NARConfiguration::worldAlignmentSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);

  ARWorldAlignment align = ARWorldAlignmentCamera;
  int alignVal = TO_INT32(value);
  if (alignVal == 1) {
    align = ARWorldAlignmentGravity;
  } else if (alignVal == 2) {
    align = ARWorldAlignmentGravityAndHeading;
  }
  
  @autoreleasepool {
    [config setWorldAlignment:align];
  }
}
