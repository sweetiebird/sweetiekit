//
//  UIGestureRecognizer.mm
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIGestureRecognizer.h"

NUIGestureRecognizer::NUIGestureRecognizer() {}
NUIGestureRecognizer::~NUIGestureRecognizer() {}

JS_INIT_CLASS(UIGestureRecognizer, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, addTarget);
  // static members (ctor)
  JS_INIT_CTOR(UIGestureRecognizer, NSObject);
JS_INIT_CLASS_END(UIGestureRecognizer, NSObject);

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
