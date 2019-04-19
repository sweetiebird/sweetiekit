//
//  NUIStoryboard.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIStoryboard.h"
#include "NUIViewController.h"
#include "NUITabBarController.h"

Nan::Persistent<FunctionTemplate> NUIStoryboard::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIStoryboard::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIStoryboard"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  Nan::SetMethod(proto, "instantiateViewController", InstantiateViewController);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}


NAN_METHOD(NUIStoryboard::New) {
  Nan::HandleScope scope;

  Local<Object> storyboardObj = info.This();

  NUIStoryboard *sb = new NUIStoryboard();

  if (info[0]->IsExternal()) {
    sb->SetNSObject((__bridge UIStoryboard *)(info[0].As<External>()->Value()));
  } else {
    std::string type;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      type = *utf8Value;
    } else {
      type = "Main";
    }
    NSString* result = [NSString stringWithUTF8String:type.c_str()];

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        sb->SetNSObject([UIStoryboard storyboardWithName:result bundle:nil]);
      });
    }
  }

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
  UIViewController* vc = [sb->As<UIStoryboard>() instantiateViewControllerWithIdentifier:result];

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)vc)
  };
  
  Local<Function> ctor;
  if (info[1]->IsFunction()) {
    ctor = Local<Function>::Cast(info[1]);
  } else if ([vc isKindOfClass:UITabBarController.class]) {
    ctor = JS_FUNC(Nan::New(NUITabBarController::type));
  } else {
    ctor = JS_FUNC(Nan::New(NUIViewController::type));
  }
  Local<Object> vcObj = ctor->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  info.GetReturnValue().Set(vcObj);
}

NUIStoryboard::NUIStoryboard () {}

NUIStoryboard::~NUIStoryboard () {}

