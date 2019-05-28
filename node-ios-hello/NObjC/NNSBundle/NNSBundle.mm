//
//  NNSBundle.mm
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NNSBundle.h"

Nan::Persistent<FunctionTemplate> NNSBundle::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSBundle::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSBundle"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "pathForResource", pathForResource);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "main", main);
  
  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSBundle::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSBundle *bundle = new NNSBundle();

  if (info[0]->IsExternal()) {
    bundle->SetNSObject((__bridge NSBundle *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      bundle->SetNSObject([[NSBundle alloc] init]);
    }
  }

  bundle->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NNSBundle::main) {
  Nan::HandleScope scope;

  NSBundle *main = [NSBundle mainBundle];

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)main)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(main, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

NAN_METHOD(NNSBundle::pathForResource) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSBundle, bundle);

  std::string resource;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    resource = *utf8Value;
  } else {
    Nan::ThrowError("NNSBundle::PathForResource: invalid argument resource");
  }
  
  std::string type;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    type = *utf8Value;
  } else {
    Nan::ThrowError("NNSBundle::PathForResource: invalid argument type");
  }

  NSString *path = [bundle pathForResource:[NSString stringWithUTF8String:resource.c_str()] ofType:[NSString stringWithUTF8String:type.c_str()]];

  info.GetReturnValue().Set(JS_STR([path UTF8String]));
}

NNSBundle::NNSBundle () {}
NNSBundle::~NNSBundle () {}
