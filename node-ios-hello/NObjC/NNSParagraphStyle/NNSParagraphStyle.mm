//
//  NSParagraphStyle.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSParagraphStyle.h"

NNSParagraphStyle::NNSParagraphStyle () {}
NNSParagraphStyle::~NNSParagraphStyle () {}

JS_INIT_CLASS(NSParagraphStyle, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, lineSpacing);
  // static members (ctor)
  JS_INIT_CTOR(NSParagraphStyle, NSObject);
JS_INIT_CLASS_END(NSParagraphStyle, NSObject);

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
