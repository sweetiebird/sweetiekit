//
//  NSKTexture.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <ARKit/ARKit.h>
#include "defines.h"
#include "NSKTexture.h"
#include "NNSObject.h"
#include "NARSession.h"
#include "NUIImage.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSKTexture::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSKTexture::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKTexture"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "textureWithImage", textureWithImage);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKTexture::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKTexture *tx = new NSKTexture();

  if (info[0]->IsExternal()) {
    tx->SetNSObject((__bridge SKTexture *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0 && info[0]->IsString()) {
    @autoreleasepool {
      NSString *imageName = NJSStringToNSString(info[0]);
      tx->SetNSObject([SKTexture textureWithImageNamed:imageName]);
    }
  } else if (info.Length() > 0 && JS_INSTANCEOF(info[0], NUIImage)) {
    JS_UNWRAPPED(info[0], UIImage, ui);
    tx->SetNSObject([SKTexture textureWithImage:ui]);
  } else if (info.Length() > 0) {
    delete tx;
    Nan::ThrowError("NSKTexture::New: Invalid argument");
    return;
  } else {
    @autoreleasepool {
      tx->SetNSObject([[SKTexture alloc] init]);
    }
  }

  tx->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSKTexture::textureWithImage)
{
  if (!JS_INSTANCEOF(info[0], NUIImage)) {
    Nan::ThrowError("NSKTexture::textureWithImage: Expected a UIImage");
    return;
  }
  JS_UNWRAPPED(info[0], UIImage, ui);
  
  Local<Value> argv[] = {
    Nan::New<External>((__bridge void*)[SKTexture textureWithImage:ui])
  };
  JS_SET_RETURN(JS_NEW(NSKTexture, argv));
}

NSKTexture::NSKTexture () {}
NSKTexture::~NSKTexture () {}
