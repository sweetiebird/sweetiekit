//
//  UINavigationBar.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NUIView.h"
#include "NUINavigationBar.h"

Nan::Persistent<FunctionTemplate> NUINavigationBar::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUINavigationBar::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UINavigationBar"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, barStyle);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUINavigationBar::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUINavigationBar *ui = new NUINavigationBar();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UINavigationBar *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UINavigationBar alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUINavigationBar::NUINavigationBar () {}
NUINavigationBar::~NUINavigationBar () {}

NAN_GETTER(NUINavigationBar::barStyleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  JS_SET_RETURN(JS_NUM([ui barStyle]));
}

NAN_SETTER(NUINavigationBar::barStyleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationBar, ui);

  @autoreleasepool {
    [ui setBarStyle:UIBarStyle(TO_UINT32(value))];
  }
}
