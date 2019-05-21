//
//  NUIAlertAction.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIAlertAction.h"
#include "NNSObject.h"

Nan::Persistent<FunctionTemplate> NUIAlertAction::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIAlertAction::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIAlertAction"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIAlertAction::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIAlertAction *action = new NUIAlertAction();

  if (info[0]->IsExternal()) {
    action->SetNSObject((__bridge UIAlertAction *)(info[0].As<External>()->Value()));
  } else {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      Nan::ThrowError("invalid argument");
    }
    @autoreleasepool {
      NSString *title = [NSString stringWithUTF8String:str.c_str()];
      UIAlertAction* ui = action->SetNSObject([UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler: ^ (UIAlertAction * _Nonnull act) {
        Nan::HandleScope scope;
        Local<Value> actionObj = sweetiekit::GetWrapperFor(act, NUIAlertAction::type);
        JS_GET_FUNCTION(fn, @"sweetiekit_UIAlertAction_callback");
        fn("NUITableViewManager::New", actionObj);
      }]);
      JS_ATTACH_FUNCTION(ui, info[1], @"sweetiekit_UIAlertAction_callback");
    }
  }
  action->Wrap(obj);

  JS_SET_RETURN(obj);
}
  

NUIAlertAction::NUIAlertAction () {}
NUIAlertAction::~NUIAlertAction () {}
