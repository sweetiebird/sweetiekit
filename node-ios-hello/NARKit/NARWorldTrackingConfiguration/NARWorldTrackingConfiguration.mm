//
//  NARWorldTrackingConfiguration.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NARWorldTrackingConfiguration.h"

NARWorldTrackingConfiguration::NARWorldTrackingConfiguration () {}
NARWorldTrackingConfiguration::~NARWorldTrackingConfiguration () {}

JS_INIT_CLASS(ARWorldTrackingConfiguration, ARConfiguration);
  // instance members (proto)
  
  // static members (ctor)
  JS_INIT_CTOR(ARWorldTrackingConfiguration, ARConfiguration);

JS_INIT_CLASS_END(ARWorldTrackingConfiguration, ARConfiguration);


NAN_METHOD(NARWorldTrackingConfiguration::New) {
  JS_RECONSTRUCT(ARWorldTrackingConfiguration);

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
