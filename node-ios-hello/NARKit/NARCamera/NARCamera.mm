//
//  NARCamera.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARCamera.h"
#include "NNSObject.h"
#include "NARWorldTrackingConfiguration.h"
#import "node_ios_hello-Swift.h"

NARCamera::NARCamera () {}
NARCamera::~NARCamera () {}

JS_INIT_CLASS(ARCamera, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, transform);

  // static members (ctor)
  JS_INIT_CTOR(ARCamera, NSObject);
  
JS_INIT_CLASS_END(ARCamera, NSObject);

NAN_METHOD(NARCamera::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARCamera *cam = new NARCamera();

  if (info[0]->IsExternal()) {
    cam->SetNSObject((__bridge ARCamera *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("ARCamera must be external");
  }
  cam->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NARCamera::transformGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARCamera, cam);
  
  auto xform = cam.transform;
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
}
