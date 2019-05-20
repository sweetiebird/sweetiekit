//
//  UIGestureRecognizer.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NUIGestureRecognizer.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NUIGestureRecognizer::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIGestureRecognizer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIGestureRecognizer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addTarget", addTarget);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIGestureRecognizer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIGestureRecognizer *ui = new NUIGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIGestureRecognizer::NUIGestureRecognizer () {}
NUIGestureRecognizer::~NUIGestureRecognizer () {}

NAN_METHOD(NUIGestureRecognizer::addTarget) {
  Nan::EscapableHandleScope scope;

  NUIGestureRecognizer *ui = ObjectWrap::Unwrap<NUIGestureRecognizer>(Local<Object>::Cast(info.This()));

  __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[0]);

  SUITarget* target = [[SUITarget alloc] init];
  
  [target setCallbackClosure:^(id _Nullable) {
    Nan::HandleScope scope;
    (*fn)("NUIGestureRecognizer::addTarget");
  }];

  [target setDeinitClosure:^() {
    Nan::HandleScope scope;
    delete fn; fn = nullptr;
    iOSLog0("NUIGestureRecognizer fn deleted");
  }];

  UIGestureRecognizer *rec = ui->As<UIGestureRecognizer>();
  
  [rec addTarget:target action:[target callbackSelector]];
  
  [rec associateValue:target withKey:@"sweetiekit.nuigesturerecognizer.target"];

  ui->SetNSObject(rec);
}
