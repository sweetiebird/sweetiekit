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
  // constants (exports)

//typedef NS_ENUM(NSInteger, NSLineBreakMode) {
  JS_ASSIGN_ENUM(NSLineBreakByWordWrapping, NSInteger); // Wrap at word boundaries, default
  JS_ASSIGN_ENUM(NSLineBreakByCharWrapping, NSInteger); // Wrap at character boundaries
  JS_ASSIGN_ENUM(NSLineBreakByClipping, NSInteger); // Simply clip
  JS_ASSIGN_ENUM(NSLineBreakByTruncatingHead, NSInteger); // Truncate at head of line: "...wxyz"
  JS_ASSIGN_ENUM(NSLineBreakByTruncatingTail, NSInteger); // Truncate at tail of line: "abcd..."
  JS_ASSIGN_ENUM(NSLineBreakByTruncatingMiddle, NSInteger); // Truncate middle of line:  "ab...yz"
//} NS_ENUM_AVAILABLE(10_0, 6_0);

JS_INIT_CLASS_END(NSParagraphStyle, NSObject);

NAN_METHOD(NNSParagraphStyle::New) {
  JS_RECONSTRUCT(NSParagraphStyle);

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
