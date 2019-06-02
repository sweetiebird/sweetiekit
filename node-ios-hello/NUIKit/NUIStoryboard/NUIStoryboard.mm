//
//  NUIStoryboard.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStoryboard.h"

NUIStoryboard::NUIStoryboard() {}
NUIStoryboard::~NUIStoryboard() {}

JS_INIT_CLASS(UIStoryboard, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, instantiateViewController);
  // static members (ctor)
  JS_INIT_CTOR(UIStoryboard, NSObject);
JS_INIT_CLASS_END(UIStoryboard, NSObject);

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


#include "NUIViewController.h"
#include "NUITabBarController.h"

NAN_METHOD(NUIStoryboard::instantiateViewController) {
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

