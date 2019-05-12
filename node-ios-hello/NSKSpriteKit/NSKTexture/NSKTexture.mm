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

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKTexture::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKTexture *tx = new NSKTexture();

  if (info[0]->IsExternal()) {
    tx->SetNSObject((__bridge SKTexture *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    std::string name;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      name = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *imageName = [NSString stringWithUTF8String:name.c_str()];
      tx->SetNSObject([SKTexture textureWithImageNamed:imageName]);
    }
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        tx->SetNSObject([[SKTexture alloc] init]);
      });
    }
  }

  tx->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSKTexture::NSKTexture () {}
NSKTexture::~NSKTexture () {}
