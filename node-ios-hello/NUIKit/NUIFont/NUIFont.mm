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
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIFont(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIFont, info);
      return;
    }
    UIFont* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIFont *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && info[0]->IsString()) {
      self = [UIFont fontWithName:to_value_NSString(info[0]) size:(info[1]->IsNumber() ? TO_INT32(info[1]) : 17)];
    } else if (info.Length() <= 0) {
      self = [[UIFont alloc] init];
    }
    if (self) {
      NUIFont *wrapper = new NUIFont();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIFont::New: invalid arguments");
    }
  }
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
