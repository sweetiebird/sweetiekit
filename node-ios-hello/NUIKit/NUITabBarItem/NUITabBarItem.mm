//
//  NUITabBarItem.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUITabBarItem.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUITabBarItem::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITabBarItem::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITabBarItem"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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

NUITabBarItem::NUITabBarItem () {}
NUITabBarItem::~NUITabBarItem () {}
