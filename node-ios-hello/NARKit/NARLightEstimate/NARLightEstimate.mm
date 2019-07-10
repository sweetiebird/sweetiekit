//
//  NARLightEstimate.mm
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARLightEstimate.h"

#if TARGET_OS_IPHONE

NARLightEstimate::NARLightEstimate () {}
NARLightEstimate::~NARLightEstimate () {}

JS_INIT_CLASS(ARLightEstimate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, ambientIntensity);
  JS_ASSIGN_PROP_READONLY(proto, ambientColorTemperature);

  // static members (ctor)
  JS_INIT_CTOR(ARLightEstimate, NSObject);
  
JS_INIT_CLASS_END(ARLightEstimate, NSObject);

NAN_METHOD(NARLightEstimate::New) {
  JS_RECONSTRUCT(ARLightEstimate);

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

NAN_GETTER(NARLightEstimate::ambientIntensityGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARLightEstimate, est);
  
  JS_SET_RETURN(JS_FLOAT([est ambientIntensity]));
}

NAN_GETTER(NARLightEstimate::ambientColorTemperatureGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARLightEstimate, est);
  
  JS_SET_RETURN(JS_FLOAT([est ambientColorTemperature]));
}

#endif
