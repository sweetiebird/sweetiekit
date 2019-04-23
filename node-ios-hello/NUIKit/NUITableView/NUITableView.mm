//
//  NUITableView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITableView.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUITableView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITableView::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUITableView *ctrl = new NUITableView();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UITableView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          ctrl->SetNSObject([UITableView alloc]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUITableView::NUITableView () {}
NUITableView::~NUITableView () {}

NAN_METHOD(NUITableView::DequeueReusableCell) {
  JS_UNWRAP(UITableView, tv);

  std::string identifier;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    identifier = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument: identifier");
  }

  __block UITableViewCell* cell;
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      NSString* str = [NSString stringWithUTF8String:identifier.c_str()];
      cell = [tv dequeueReusableCellWithIdentifier:str];
    });
  }
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)cell)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}
