//
//  NARSession.m
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

NARSession::NARSession () {}
NARSession::~NARSession () {}

JS_INIT_CLASS(ARSession, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, currentFrame);
  JS_ASSIGN_METHOD(proto, run);
  JS_ASSIGN_METHOD(proto, add);
  JS_ASSIGN_METHOD(proto, remove);

  // static members (ctor)
  JS_INIT_CTOR(ARSession, NSObject);
  
JS_INIT_CLASS_END(ARSession, NSObject);

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

NAN_METHOD(NARSession::run) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);
  
  NARWorldTrackingConfiguration *config = ObjectWrap::Unwrap<NARWorldTrackingConfiguration>(JS_OBJ(info[0]));

  [session runWithConfiguration:config->As<ARWorldTrackingConfiguration>()];
}

NAN_METHOD(NARSession::add) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);

  NARAnchor *anchor = ObjectWrap::Unwrap<NARAnchor>(JS_OBJ(info[0]));

  [session addAnchor:anchor->As<ARAnchor>()];
}

NAN_METHOD(NARSession::remove) {
  Nan::HandleScope scope;

  JS_UNWRAP(ARSession, session);

  NARAnchor *anchor = ObjectWrap::Unwrap<NARAnchor>(JS_OBJ(info[0]));

  [session removeAnchor:anchor->As<ARAnchor>()];
}

NAN_GETTER(NARSession::currentFrameGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(ARSession, session);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([session currentFrame], NARFrame::type));
}
