//
//  NARConfiguration.m
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

NARConfiguration::NARConfiguration () {}
NARConfiguration::~NARConfiguration () {}

JS_INIT_CLASS(ARConfiguration, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, isLightEstimationEnabled);
  JS_ASSIGN_PROP(proto, worldAlignment);

  // static members (ctor)
  JS_INIT_CTOR(ARConfiguration, NSObject);
  
JS_INIT_CLASS_END(ARConfiguration, NSObject);

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

NAN_GETTER(NARConfiguration::isLightEstimationEnabledGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARConfiguration, config);
  
  JS_SET_RETURN(JS_BOOL([config isLightEstimationEnabled]));
}

NAN_SETTER(NARConfiguration::isLightEstimationEnabledSetter) {
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
