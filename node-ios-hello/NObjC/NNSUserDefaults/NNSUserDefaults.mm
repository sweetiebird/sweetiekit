//
//  NNSUserDefaults.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUserDefaults.h"

NNSUserDefaults::NNSUserDefaults () {}
NNSUserDefaults::~NNSUserDefaults () {}

JS_INIT_CLASS(NSUserDefaults, NSObject);
  // instance members (proto)
  JS_SET_METHOD(proto, "synchronize", Synchronize);
  JS_SET_METHOD(proto, "setValueForKey", SetValueForKey);
  JS_SET_METHOD(proto, "objectForKey", ObjectForKey);
  JS_SET_METHOD(proto, "stringForKey", ObjectForKey);
  // static members (ctor)
  JS_INIT_CTOR(NSUserDefaults, NSObject);
  JS_SET_PROP_READONLY(JS_OBJ(ctor), "standardUserDefaults", StandardUserDefaults);
JS_INIT_CLASS_END(NSUserDefaults, NSObject);

NAN_METHOD(NNSUserDefaults::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSUserDefaults *app = new NNSUserDefaults();

  if (info[0]->IsExternal()) {
    app->SetNSObject((__bridge NSUserDefaults *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          app->SetNSObject([NSUserDefaults standardUserDefaults]);
      });
    }
  }
  app->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_GETTER(NNSUserDefaults::StandardUserDefaultsGetter)
{
  Nan::HandleScope scope;

  __block NSUserDefaults* ns = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      ns = [NSUserDefaults standardUserDefaults];
    });
  }

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)ns)
  };
  Local<Object> viewObj = JS_TYPE(NNSUserDefaults)->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(viewObj);
}

NAN_METHOD(NNSUserDefaults::Synchronize)
{
  NNSUserDefaults *ns = ObjectWrap::Unwrap<NNSUserDefaults>(Local<Object>::Cast(info.This()));
  
  __block bool result = false;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      result = [ns->As<NSUserDefaults>() synchronize];
    });
  }
  
  info.GetReturnValue().Set(JS_BOOL(result));
}

NAN_METHOD(NNSUserDefaults::SetValueForKey)
{
  NNSUserDefaults *ns = ObjectWrap::Unwrap<NNSUserDefaults>(Local<Object>::Cast(info.This()));

  std::string value;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    value = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  std::string key;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    key = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ns->As<NSUserDefaults>() setValue:[NSString stringWithUTF8String:value.c_str()] forKey:[NSString stringWithUTF8String:key.c_str()]];
    });
  }
}

NAN_METHOD(NNSUserDefaults::ObjectForKey)
{
  NNSUserDefaults *ns = ObjectWrap::Unwrap<NNSUserDefaults>(Local<Object>::Cast(info.This()));
  
  std::string key;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    key = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  __block NSObject* obj = nullptr;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      obj = [ns->As<NSUserDefaults>() objectForKey:[NSString stringWithUTF8String:key.c_str()]];
    });
  }
  if (obj != nullptr) {
    if ([obj isKindOfClass:[NSString class]]) {
      auto result = JS_STR([(NSString*)obj UTF8String]);
      info.GetReturnValue().Set(result);
    } else {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)obj)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(obj, NNSObject::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      info.GetReturnValue().Set(value);
    }
  }
}

NAN_METHOD(NNSUserDefaults::StringForKey)
{
  NNSUserDefaults *ns = ObjectWrap::Unwrap<NNSUserDefaults>(Local<Object>::Cast(info.This()));
  
  std::string key;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    key = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }
  __block NSString* obj = nullptr;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      obj = [ns->As<NSUserDefaults>() stringForKey:[NSString stringWithUTF8String:key.c_str()]];
    });
  }
  if (obj != nullptr && [obj isKindOfClass:[NSString class]]) {
    auto result = JS_STR([(NSString*)obj UTF8String]);
    info.GetReturnValue().Set(result);
  }
}


