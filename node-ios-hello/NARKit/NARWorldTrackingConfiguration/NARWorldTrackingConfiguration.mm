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

NARWorldTrackingConfiguration::NARWorldTrackingConfiguration () {}
NARWorldTrackingConfiguration::~NARWorldTrackingConfiguration () {}

JS_INIT_CLASS(ARWorldTrackingConfiguration, ARConfiguration);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(ARWorldTrackingConfiguration, ARConfiguration);

JS_INIT_CLASS_END(ARWorldTrackingConfiguration, ARConfiguration);


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
