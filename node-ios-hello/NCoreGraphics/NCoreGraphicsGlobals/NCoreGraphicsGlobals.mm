//
//  CoreGraphicsGlobals.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#include "defines.h"
#include "NNSObject.h"
#include "NCoreGraphicsGlobals.h"
#include "NUIImage.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NCoreGraphicsGlobals::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCoreGraphicsGlobals::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CoreGraphicsGlobals"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "uiGraphicsBeginImageContextWithOptions", uiGraphicsBeginImageContextWithOptions);
  Nan::SetMethod(proto, "uiGraphicsGetImageFromCurrentImageContext", uiGraphicsGetImageFromCurrentImageContext);
  Nan::SetMethod(proto, "uiGraphicsEndImageContext", uiGraphicsEndImageContext);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCoreGraphicsGlobals::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCoreGraphicsGlobals *ui = new NCoreGraphicsGlobals();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SCoreGraphicsGlobals *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([SCoreGraphicsGlobals shared]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NCoreGraphicsGlobals::NCoreGraphicsGlobals () {}
NCoreGraphicsGlobals::~NCoreGraphicsGlobals () {}

NAN_METHOD(NCoreGraphicsGlobals::uiGraphicsBeginImageContextWithOptions) {
  Nan::HandleScope scope;
  
  NCoreGraphicsGlobals *cg = ObjectWrap::Unwrap<NCoreGraphicsGlobals>(info.This());
  SCoreGraphicsGlobals* scg = cg->As<SCoreGraphicsGlobals>();
  
  @autoreleasepool {
    float width = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("width")));
    float height = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("height")));
    bool opaque = TO_BOOL(info[1]);
    float scale = TO_FLOAT(info[2]);
    [scg uiGraphicsBeginImageContextWithOptionsWithSize:CGSizeMake(width, height) opaque:opaque scale:scale];
  }
}

NAN_METHOD(NCoreGraphicsGlobals::uiGraphicsGetImageFromCurrentImageContext) {
  Nan::HandleScope scope;
  
  NCoreGraphicsGlobals *cg = ObjectWrap::Unwrap<NCoreGraphicsGlobals>(info.This());
  SCoreGraphicsGlobals* scg = cg->As<SCoreGraphicsGlobals>();
  
  UIImage *img = [scg uiGraphicsGetImageFromCurrentImageContext];
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)img)
  };
  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(img, NUIImage::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  JS_SET_RETURN(value);
}

NAN_METHOD(NCoreGraphicsGlobals::uiGraphicsEndImageContext) {
  Nan::HandleScope scope;

  NCoreGraphicsGlobals *cg = ObjectWrap::Unwrap<NCoreGraphicsGlobals>(info.This());
  SCoreGraphicsGlobals* scg = cg->As<SCoreGraphicsGlobals>();

  [scg uiGraphicsEndImageContext];
}
