//
//  NUIImage.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUIImage::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImage::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImage"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImage::New) {
  Nan::HandleScope scope;

  Local<Object> imgObj = info.This();

  NUIImage *img = new NUIImage();

  std::string imageName;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    imageName = *utf8Value;
  } else {
    // throw
  }
  NSString* result = [NSString stringWithUTF8String:imageName.c_str()];

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
        img->SetNSObject([UIImage imageNamed:result]);
    });
  }
  img->Wrap(imgObj);

  info.GetReturnValue().Set(imgObj);
}

NUIImage::NUIImage () {}
NUIImage::~NUIImage () {}

