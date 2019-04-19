//
//  NUIStoryboard.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIStoryboard.h"
#include "NUIViewController.h"
#include "NUITabBarController.h"

Nan::Persistent<FunctionTemplate> NUIStoryboard::type;

Local<Object> NUIStoryboard::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIStoryboard"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  Nan::SetMethod(proto, "instantiateViewController", InstantiateViewController);

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
}

NAN_METHOD(NUIStoryboard::New) {
  Nan::HandleScope scope;

  Local<Object> storyboardObj = info.This();

  NUIStoryboard *sb = new NUIStoryboard();

  std::string type;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    type = *utf8Value;
  } else {
    type = "Main";
  }
  NSString* result = [NSString stringWithUTF8String:type.c_str()];
  sb->me = [UIStoryboard storyboardWithName:result bundle:nil];
  sb->Wrap(storyboardObj);

  info.GetReturnValue().Set(storyboardObj);
}

NAN_METHOD(NUIStoryboard::InstantiateViewController) {
  NUIStoryboard *sb = ObjectWrap::Unwrap<NUIStoryboard>(Local<Object>::Cast(info.This()));

  std::string identifier;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  } else {
    // throw
  }
  NSString* result = [NSString stringWithUTF8String:identifier.c_str()];
  UIViewController* vc = [sb->me instantiateViewControllerWithIdentifier:result];
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)vc)
  };
  Local<Object> storyboardObj = JS_FUNC(Nan::New(info[1]->IsUndefined() ? NUIViewController::type : NUITabBarController::type))->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(storyboardObj);
}



Local<Object> makeUIStoryboard() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUIStoryboard::Initialize(isolate));
}

NUIStoryboard::NUIStoryboard () {}

NUIStoryboard::~NUIStoryboard () {}

