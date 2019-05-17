//
//  Gif.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIImage.h"
#include "NGif.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NGif::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NGif::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIImage::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("Gif"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NGif::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NGif *ui = new NGif();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge Gif *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      std::string imageName;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        imageName = *utf8Value;
      } else {
        // throw
      }
      NSString* result = [NSString stringWithUTF8String:imageName.c_str()];
      ui->SetNSObject([[Gif alloc] initWithGifName:result levelOfIntegrity:0.8 error:nullptr]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NGif::NGif () {}
NGif::~NGif () {}
