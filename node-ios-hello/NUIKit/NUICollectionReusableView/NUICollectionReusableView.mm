//
//  UICollectionReusableView.mm
//
//  Created by Shawn Presser on 5/16/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUICollectionReusableView.h"

NUICollectionReusableView::NUICollectionReusableView() {}
NUICollectionReusableView::~NUICollectionReusableView() {}

JS_INIT_CLASS(UICollectionReusableView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, reuseIdentifier);
  // static members (ctor)
  JS_INIT_CTOR(UICollectionReusableView, UIView);
JS_INIT_CLASS_END(UICollectionReusableView, UIView);

NAN_METHOD(NUICollectionReusableView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUICollectionReusableView *ui = new NUICollectionReusableView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UICollectionReusableView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UICollectionReusableView alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NUICollectionReusableView::reuseIdentifierGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UICollectionReusableView, ui);
  
  @autoreleasepool {
    NSString* reuseIdentifier = [ui reuseIdentifier];
    if (reuseIdentifier != nullptr) {
      JS_SET_RETURN(JS_STR([reuseIdentifier UTF8String]));
    }
  }
}
