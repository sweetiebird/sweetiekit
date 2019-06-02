//
//  NSMutableParagraphStyle.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableParagraphStyle.h"

NNSMutableParagraphStyle::NNSMutableParagraphStyle () {}
NNSMutableParagraphStyle::~NNSMutableParagraphStyle () {}

Nan::Persistent<FunctionTemplate> NNSMutableParagraphStyle::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSMutableParagraphStyle::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSParagraphStyle::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSMutableParagraphStyle"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, lineSpacing);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSMutableParagraphStyle::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSMutableParagraphStyle *ui = new NNSMutableParagraphStyle();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSMutableParagraphStyle *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[NSMutableParagraphStyle alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NNSMutableParagraphStyle::lineSpacingGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSMutableParagraphStyle, style);
  
  JS_SET_RETURN(JS_NUM([style lineSpacing]));
}

NAN_SETTER(NNSMutableParagraphStyle::lineSpacingSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSMutableParagraphStyle, style);
  
  @autoreleasepool {
    double spacing = TO_DOUBLE(value);
    [style setLineSpacing:spacing];
  }
}
