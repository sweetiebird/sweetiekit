//
//  NUISlider.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUISlider.h"
#include "NUIControl.h"

Nan::Persistent<FunctionTemplate> NUISlider::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUISlider::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UISlider"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "value", Value);
  Nan::SetMethod(proto, "setValue", SetValue);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUISlider::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUISlider *ui = new NUISlider();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UISlider *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      CGRect frame = CGRectMake(x, y, width, height);
      ui->SetNSObject([[UISlider alloc] initWithFrame:frame]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UISlider alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUISlider::NUISlider () {}
NUISlider::~NUISlider () {}

NAN_GETTER(NUISlider::ValueGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISlider, ui);
  
  JS_SET_RETURN(JS_BOOL([ui value]));
}

NAN_SETTER(NUISlider::ValueSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UISlider, ui);

  [ui setValue:TO_DOUBLE(value)];
}

NAN_METHOD(NUISlider::SetValue) {
  Nan::HandleScope scope;

  JS_UNWRAP(UISlider, ui);

  [ui setValue:TO_FLOAT(info[0]) animated:TO_BOOL(info[1])];
}
