//
//  UITouch.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUITouch.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUITouch::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITouch::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITouch"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "locationInView", locationInView);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITouch::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITouch *ui = new NUITouch();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITouch *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITouch alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUITouch::NUITouch () {}
NUITouch::~NUITouch () {}

NAN_METHOD(NUITouch::locationInView) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITouch, ui);
  
  NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(info[0]));

  __block double x = 0;
  __block double y = 0;
  @autoreleasepool {
    CGPoint loc = [ui locationInView:view->As<UIView>()];
    x = loc.x;
    y = loc.y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(x));
  result->Set(JS_STR("y"), JS_NUM(y));
  
  JS_SET_RETURN(result);
}
