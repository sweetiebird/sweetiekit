//
//  NARAnchor.m
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

NARAnchor::NARAnchor () {}
NARAnchor::~NARAnchor () {}

JS_INIT_CLASS(ARAnchor, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, name);
  JS_ASSIGN_PROP_READONLY(proto, identifier);
  JS_ASSIGN_PROP_READONLY(proto, transform);

  // static members (ctor)
  JS_INIT_CTOR(ARAnchor, NSObject);
  JS_ASSIGN_METHOD(ctor, initWithTransform);

JS_INIT_CLASS_END(ARAnchor, NSObject);

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

NAN_METHOD(NARAnchor::initWithTransform) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(ARAnchor,
      [[ARAnchor alloc] initWithTransform:to_value_simd_float4x4(info[0])]);
  }
}

NAN_GETTER(NARAnchor::nameGetter) {
  JS_UNWRAP(ARAnchor, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NARAnchor::identifierGetter) {
  JS_UNWRAP(ARAnchor, self);
  @autoreleasepool {
    NSUUID* identifier = [self identifier];
    if (identifier != nullptr) {
      JS_SET_RETURN(js_value_NSString([identifier UUIDString]));
    }
  }
}

NAN_GETTER(NARAnchor::transformGetter) {
  JS_UNWRAP(ARAnchor, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_simd_float4x4([self transform]));
  }
}
