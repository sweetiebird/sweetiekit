//
//  CABasicAnimation.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/3/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NCABasicAnimation.h"
#include "ColorHelper.h"

Nan::Persistent<FunctionTemplate> NCABasicAnimation::type;

NCABasicAnimation::NCABasicAnimation () {}
NCABasicAnimation::~NCABasicAnimation () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NCABasicAnimation::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;
  
  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CABasicAnimation"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  
  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCABasicAnimation::New) {
  Nan::HandleScope scope;
  
  Local<Object> obj = info.This();
  
  NCABasicAnimation *anim = new NCABasicAnimation();
  
  if (info[0]->IsExternal()) {
    anim->SetNSObject((__bridge CABasicAnimation *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      std::string kp;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        kp = *utf8Value;
      } else {
        Nan::ThrowError("invalid argument: key path");
      }

      NSString *keyPath = [NSString stringWithUTF8String:kp.c_str()];

      anim->SetNSObject([CABasicAnimation animationWithKeyPath:keyPath]);
    }
  }
  anim->Wrap(obj);
  
  JS_SET_RETURN(obj);
}
