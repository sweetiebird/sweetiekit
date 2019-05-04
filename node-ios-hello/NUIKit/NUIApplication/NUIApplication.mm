//
//  NAppDelegate.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIApplication.h"
#include "NUIWindow.h"

Nan::Persistent<FunctionTemplate> NUIApplication::type;
UIWindow* NUIApplication::tmp_UIWindow;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIApplication::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIApplication"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("keyWindow"), KeyWindowGetter);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIApplication::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIApplication *app = new NUIApplication();

  if (info[0]->IsExternal()) {
    app->SetNSObject((__bridge UIApplication *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          app->SetNSObject([UIApplication sharedApplication]);
      });
    }
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NUIApplication::KeyWindowGetter)
{
  JS_UNWRAP(UIApplication, app)

  tmp_UIWindow = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      tmp_UIWindow = [app keyWindow];
      if (tmp_UIWindow == nullptr) {
        tmp_UIWindow = [UIWindow new];
        [tmp_UIWindow makeKeyAndVisible];
      }
    });
  }

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)tmp_UIWindow)
  };
  Local<Object> winObj = JS_TYPE(NUIWindow)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  
  info.GetReturnValue().Set(winObj);
}

#import "node_ios_hello-Swift.h"

NAN_METHOD(NUIApplication::Main) {
  Nan::HandleScope scope;
  
  std::string identifier;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  } else {
    identifier = "AppDelegate";
  }
  NSString* result = [NSString stringWithUTF8String:identifier.c_str()];
  
  __block void (^ _Nonnull _completion)(UIBackgroundFetchResult);
  
  auto onFetchDone = ^{
    _completion(UIBackgroundFetchResultNewData);
  };
  
  [AppDelegate setFetchCallback:^(void (^ _Nonnull completion)(UIBackgroundFetchResult)) {
    Nan::HandleScope handleScope;
    _completion = completion;
    
    iOSLog0("TODO fetch");
    onFetchDone();
  }];
  char* args = "node\0--jitless\0\0";
  char* args1 = (char*)args;
  std::vector<char*> arg;
  while (*args1 != '\0') {
      arg.push_back((char*)args1);
      args1 += strlen(args1) + 1;
      if (arg.size() > 100)
          __builtin_trap();
  }
  arg.push_back(nullptr);
  
  @autoreleasepool {
    UIApplicationMain(arg.size() - 1, &arg[0], nullptr, result);
  }
  
}

NUIApplication::NUIApplication () {}
NUIApplication::~NUIApplication () {}


