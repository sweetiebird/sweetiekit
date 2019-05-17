//
//  UIFont.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIFont.h"

Nan::Persistent<FunctionTemplate> NUIFont::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIFont::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIFont"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "systemFont", systemFont);
  Nan::SetMethod(ctorFn, "boldSystemFont", boldSystemFont);
  Nan::SetMethod(ctorFn, "italicSystemFont", italicSystemFont);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIFont::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIFont *ui = new NUIFont();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIFont *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      std::string str;
      if (info[0]->IsString()) {
        Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
        str = *utf8Value;
      } else {
        // throw
      }
      NSString* name = [NSString stringWithUTF8String:str.c_str()];
      double size = TO_DOUBLE(info[1]);
      ui->SetNSObject([UIFont fontWithName:name size:size]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIFont alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIFont::NUIFont () {}
NUIFont::~NUIFont () {}

NAN_METHOD(NUIFont::systemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont systemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIFont::boldSystemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont boldSystemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIFont::italicSystemFont) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIFont)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIFont *ui = ObjectWrap::Unwrap<NUIFont>(obj);

  @autoreleasepool {
    double size = TO_DOUBLE(info[0]);
    ui->SetNSObject([UIFont italicSystemFontOfSize:size]);
  }

  JS_SET_RETURN(obj);
}
