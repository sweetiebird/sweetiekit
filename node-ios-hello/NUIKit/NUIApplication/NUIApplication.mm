//
//  NUIApplication.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIApplication.h"

NUIApplication::NUIApplication() {}
NUIApplication::~NUIApplication() {}

JS_INIT_CLASS(UIApplication, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, keyWindow);
  JS_ASSIGN_PROP_READONLY(proto, statusBarOrientation);
  // static members (ctor)
  JS_INIT_CTOR(UIApplication, NSObject);
JS_INIT_CLASS_END(UIApplication, NSObject);

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

#include "NUIWindow.h"

NAN_GETTER(NUIApplication::keyWindowGetter)
{
  JS_UNWRAP(UIApplication, app)
  
  @autoreleasepool {
    JS_SET_RETURN(js_value_UIWindow([app keyWindow]));
  }
}

#include "main.h"

namespace sweetiekit {
  extern Isolate* nodeIsolate;
}
NAN_METHOD(NUIApplication::main) {
  Nan::HandleScope scope;
  
  std::string identifier("AppDelegate");
  sweetiekit::JSFunction fetchFn;
  
  __block void (^ _completion)(UIBackgroundFetchResult);
  
  __block sweetiekit::JSFunction onFetchDoneFn(sweetiekit::FromBlock("BackgroundFetchCompletionHandler", ^(JSInfo info) {
    if (_completion != nullptr) {
      _completion(UIBackgroundFetchResultNewData);
      _completion = nullptr;
    }
  }));
  
  
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  }
  if (info[0]->IsObject()) {
    auto delegateName = JS_OBJ(info[0])->Get(JS_STR("appDelegate"));
    if (delegateName->IsString()) {
      NJSStringGetUTF8String(delegateName, identifier);
    }
    auto onBackgroundFetch = JS_OBJ(info[0])->Get(JS_STR("onBackgroundFetch"));
    if (onBackgroundFetch->IsFunction()) {
      fetchFn.Reset(onBackgroundFetch);
    }
  }
  
  [AppDelegate setFetchCallback:^(void (^ _Nonnull completion)(UIBackgroundFetchResult)) {
    Nan::HandleScope handleScope;
    _completion = completion;
    [[UIApplication sharedApplication] associateValue:_completion withKey:@"sweetiekit.UIApplication._completion"];
    fetchFn.Call("AppDelegate:fetchCallback", onFetchDoneFn.GetValue());
  }];
  char* args = (char*)"node\0--jitless\0\0";
  char* args1 = (char*)args;
  std::vector<char*> arg;
  while (*args1 != '\0') {
      arg.push_back((char*)args1);
      args1 += strlen(args1) + 1;
      if (arg.size() > 100)
          __builtin_trap();
  }
  arg.push_back(nullptr);
  
  Isolate* isolate = info.GetIsolate();
  MicrotasksScope noMicrotasks(isolate, MicrotasksScope::kDoNotRunMicrotasks);
  sweetiekit::nodeIsolate = isolate;
  isolate->Exit();
//  @autoreleasepool {
//    UIApplicationMain(arg.size() - 1, &arg[0], NSStringFromClass(JSApplication.class), result);
//  }
  
}

NAN_GETTER(NUIApplication::statusBarOrientationGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIApplication, ui);

  JS_SET_RETURN(JS_NUM([ui statusBarOrientation]));
}
