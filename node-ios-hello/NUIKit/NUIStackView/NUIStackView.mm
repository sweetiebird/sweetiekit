//
//  UIStackView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NUIView.h"
#include "NUIStackView.h"

Nan::Persistent<FunctionTemplate> NUIStackView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIStackView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIStackView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIStackView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIStackView *ui = new NUIStackView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIStackView *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    ui->SetNSObject([[UIStackView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIStackView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUIStackView::NUIStackView () {}
NUIStackView::~NUIStackView () {}
