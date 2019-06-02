//
//  NSParagraphStyle.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSParagraphStyle.h"

NNSParagraphStyle::NNSParagraphStyle () {}
NNSParagraphStyle::~NNSParagraphStyle () {}

Nan::Persistent<FunctionTemplate> NNSParagraphStyle::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSParagraphStyle::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSParagraphStyle"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP_READONLY(proto, lineSpacing);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSParagraphStyle::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSParagraphStyle *ui = new NNSParagraphStyle();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSParagraphStyle *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[NSParagraphStyle alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NNSParagraphStyle::lineSpacingGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSParagraphStyle, style);
  
  JS_SET_RETURN(JS_NUM([style lineSpacing]));
}
