//
//  NSMutableParagraphStyle.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableParagraphStyle.h"

NNSMutableParagraphStyle::NNSMutableParagraphStyle () {}
NNSMutableParagraphStyle::~NNSMutableParagraphStyle () {}

JS_INIT_CLASS(NSMutableParagraphStyle, NSParagraphStyle);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, lineSpacing);
  // static members (ctor)
  JS_INIT_CTOR(NSMutableParagraphStyle, NSParagraphStyle);
JS_INIT_CLASS_END(NSMutableParagraphStyle, NSParagraphStyle);

NAN_METHOD(NNSMutableParagraphStyle::New) {
  JS_RECONSTRUCT(NSMutableParagraphStyle);

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
