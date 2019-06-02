//
//  NUITabBarItem.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITabBarItem.h"

NUITabBarItem::NUITabBarItem() {}
NUITabBarItem::~NUITabBarItem() {}

JS_INIT_CLASS(UITabBarItem, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITabBarItem, NSObject);
JS_INIT_CLASS_END(UITabBarItem, NSObject);

#include "NUIImage.h"

NAN_METHOD(NUITabBarItem::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITabBarItem *ui = new NUITabBarItem();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITabBarItem *)(info[0].As<External>()->Value()));
  } else if (info[0]->IsString() && info.Length() == 1) {
    @autoreleasepool {
      NSString *title = NJSStringToNSString(info[0]);
      ui->SetNSObject([[UITabBarItem alloc] initWithTitle:title image:nullptr selectedImage:nullptr]);
    }
  } else if (info[0]->IsString() && info.Length() == 2) {
    @autoreleasepool {
      NSString *title = NJSStringToNSString(info[0]);
      UIImage *img = info[1]->IsObject() ? ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[1]))->As<UIImage>() : nullptr;
      ui->SetNSObject([[UITabBarItem alloc] initWithTitle:title image:img selectedImage:nullptr]);
    }
  } else if (info[0]->IsString() && info.Length() == 3) {
    @autoreleasepool {
      NSString *title = NJSStringToNSString(info[0]);
      UIImage *img = info[1]->IsObject() ? ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[1]))->As<UIImage>() : nullptr;
      UIImage *selImg = info[2]->IsObject() ? ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[2]))->As<UIImage>() : nullptr;
      ui->SetNSObject([[UITabBarItem alloc] initWithTitle:title image:img selectedImage:selImg]);
    }
  } else {
    ui->SetNSObject([[UITabBarItem alloc] init]);
  }

  ui->Wrap(obj);

  info.GetReturnValue().Set(obj);
}
