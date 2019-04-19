//
//  NUIImageView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImageView.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUIImageView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImageView::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImageView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIImageView::New) {
  Nan::HandleScope scope;

  Local<Object> imgObj = info.This();

  NUIImageView *imgView = new NUIImageView();

  if (info[0]->IsExternal()) {
    imgView->SetNSObject((__bridge UIImageView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
          if (info[0]->IsObject() && info[1]->IsObject()) {
            auto img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[0]))->As<UIImage>();
            auto hlImg = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[1]))->As<UIImage>();
            imgView->SetNSObject([[UIImageView alloc] initWithImage:img highlightedImage:hlImg]);
          } else if (info[0]->IsObject()) {
            auto img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(info[0]))->As<UIImage>();
            imgView->SetNSObject([[UIImageView alloc] initWithImage:img]);
          } else {
            imgView->SetNSObject([[UIImageView alloc] init]);
          }
      });
    }
  }
  imgView->Wrap(imgObj);

  info.GetReturnValue().Set(imgObj);
}

NUIImageView::NUIImageView () {}
NUIImageView::~NUIImageView () {}

