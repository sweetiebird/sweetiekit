//
//  NARAnchor.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARAnchor.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARAnchor::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARAnchor::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARAnchor"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, identifier);
  JS_ASSIGN_PROP_READONLY(proto, transform);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "initWithTransform", InitWithTransform);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARAnchor::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARAnchor *anchor = new NARAnchor();

  if (info[0]->IsExternal()) {
    anchor->SetNSObject((__bridge ARAnchor *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      simd_float4x4 transform = matrix_identity_float4x4;
      anchor->SetNSObject([[ARAnchor alloc] initWithTransform:transform]);
    }
  }
  anchor->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NARAnchor::InitWithTransform) {
  Nan::HandleScope scope;
  
  Local<Object> anchorObj = JS_TYPE(NARAnchor)->NewInstance(JS_CONTEXT(), 0, nullptr).ToLocalChecked();

  JS_UNWRAPPED(anchorObj, ARAnchor, anchor);

  @autoreleasepool {
    simd_float4x4 transform = matrix_identity_float4x4;
    if (!sweetiekit::SetTransform(transform, info[0])) {
      Nan::ThrowError("ARAnchor:initWithTransform: Invalid transform type");
    } else {
      nanchor->SetNSObject([anchor initWithTransform:transform]);
    }
  }

  info.GetReturnValue().Set(anchorObj);
}

NAN_GETTER(NARAnchor::nameGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARAnchor, ar);
  
  @autoreleasepool {
    NSString* name = [ar name];
    if (name != nullptr) {
      JS_SET_RETURN(JS_STR([name UTF8String]));
    }
  }
}

NAN_GETTER(NARAnchor::identifierGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARAnchor, ar);
  
  @autoreleasepool {
    NSUUID* identifier = [ar identifier];
    if (identifier != nullptr) {
      JS_SET_RETURN(JS_STR([[identifier UUIDString] UTF8String]));
    }
  }
}

NAN_GETTER(NARAnchor::transformGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARAnchor, ar);

  auto xform = ar.transform;
  const float* matrix = (const float*)&xform;
  JS_SET_RETURN(createTypedArray<Float32Array>(16, matrix));
}

NARAnchor::NARAnchor () {}
NARAnchor::~NARAnchor () {}
