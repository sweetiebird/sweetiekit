//
//  NARSession.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NARSession.h"
#include "NARAnchor.h"
#include "NNSObject.h"
#include "NARFrame.h"
#include "NARWorldTrackingConfiguration.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NARSession::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NARSession::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("ARSession"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "currentFrame", CurrentFrame);
  Nan::SetMethod(proto, "run", Run);
  Nan::SetMethod(proto, "add", Add);
  Nan::SetMethod(proto, "remove", Remove);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NARSession::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NARSession *session = new NARSession();

  if (info[0]->IsExternal()) {
    session->SetNSObject((__bridge ARSession *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("Session must be external");
  }
  session->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NARSession::Run) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);
  
  NARWorldTrackingConfiguration *config = ObjectWrap::Unwrap<NARWorldTrackingConfiguration>(JS_OBJ(info[0]));

  [session runWithConfiguration:config->As<ARWorldTrackingConfiguration>()];
}

NAN_METHOD(NARSession::Add) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);

  NARAnchor *anchor = ObjectWrap::Unwrap<NARAnchor>(JS_OBJ(info[0]));

  [session addAnchor:anchor->As<ARAnchor>()];
}

NAN_METHOD(NARSession::Remove) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);

  NARAnchor *anchor = ObjectWrap::Unwrap<NARAnchor>(JS_OBJ(info[0]));

  [session removeAnchor:anchor->As<ARAnchor>()];
}

NAN_GETTER(NARSession::CurrentFrameGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSession, session);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([session currentFrame], NARFrame::type));
}

NARSession::NARSession () {}
NARSession::~NARSession () {}
