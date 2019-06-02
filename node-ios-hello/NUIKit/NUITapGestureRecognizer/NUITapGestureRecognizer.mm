//
//  UITapGestureRecognizer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITapGestureRecognizer.h"

NUITapGestureRecognizer::NUITapGestureRecognizer() {}
NUITapGestureRecognizer::~NUITapGestureRecognizer() {}

JS_INIT_CLASS(UITapGestureRecognizer, UIGestureRecognizer);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITapGestureRecognizer, UIGestureRecognizer);
JS_INIT_CLASS_END(UITapGestureRecognizer, UIGestureRecognizer);

NAN_METHOD(NUITapGestureRecognizer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITapGestureRecognizer *ui = new NUITapGestureRecognizer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITapGestureRecognizer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITapGestureRecognizer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
