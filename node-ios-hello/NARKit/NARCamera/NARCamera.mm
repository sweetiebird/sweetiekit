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

Nan::Persistent<FunctionTemplate> NARCamera::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARCamera::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARCamera"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "transform", Transform);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NAN_GETTER(NARCamera::TransformGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARCamera, cam);
  
  auto xform = cam.transform;
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
}

NARCamera::NARCamera () {}
NARCamera::~NARCamera () {}
