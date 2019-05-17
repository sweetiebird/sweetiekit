//
//  NARLightEstimate.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARLightEstimate.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARLightEstimate::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARLightEstimate::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARLightEstimate"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "ambientIntensity", AmbientIntensity);
  JS_SET_PROP_READONLY(proto, "ambientColorTemperature", AmbientColorTemperature);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARLightEstimate::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARLightEstimate *est = new NARLightEstimate();

  if (info[0]->IsExternal()) {
    est->SetNSObject((__bridge ARLightEstimate *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("ArLightEstimate must be external");
  }
  est->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NARLightEstimate::NARLightEstimate () {}
NARLightEstimate::~NARLightEstimate () {}

NAN_GETTER(NARLightEstimate::AmbientIntensityGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARLightEstimate, est);
  
  JS_SET_RETURN(JS_FLOAT([est ambientIntensity]));
}

NAN_GETTER(NARLightEstimate::AmbientColorTemperatureGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARLightEstimate, est);
  
  JS_SET_RETURN(JS_FLOAT([est ambientColorTemperature]));
}
