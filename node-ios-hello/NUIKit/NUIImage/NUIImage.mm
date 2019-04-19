//
//  NUIImage.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUIImage::type;

Local<Object> NUIImage::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImage"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
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
    dispatch_async(dispatch_get_main_queue(), ^ {
        img->image = [UIImage imageNamed:result];
    });
  }
  img->Wrap(imgObj);

  info.GetReturnValue().Set(imgObj);
}

Local<Object> makeUIImage() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIImage::Initialize(isolate));
}

NUIImage::NUIImage () {}
NUIImage::~NUIImage () {}

