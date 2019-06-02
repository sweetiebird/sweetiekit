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
  JS_ASSIGN_PROP(proto, image);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

#include "NUIImage.h"

NAN_METHOD(NUIImageView::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `UIImageView(...)`, turn into construct call.
      JS_SET_RETURN_NEW(UIImageView, info);
      return;
    }
    UIImageView* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge UIImageView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIImageView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (is_value_UIImage(info[0]) && is_value_UIImage(info[1])) {
      self = [[UIImageView alloc] initWithImage:to_value_UIImage(info[0]) highlightedImage:to_value_UIImage(info[1])];
    } else if (is_value_UIImage(info[0])) {
      self = [[UIImageView alloc] initWithImage:to_value_UIImage(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIImageView alloc] init];
    }
    if (self) {
      NUIImageView *wrapper = new NUIImageView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIImageView::New: invalid arguments");
    }
  }
}

NUIImageView::NUIImageView () {}
NUIImageView::~NUIImageView () {}

NAN_GETTER(NUIImageView::imageGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIImageView, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui image], NUIImage::type));
}

NAN_SETTER(NUIImageView::imageSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIImageView, ui);
  
  UIImage *img = ObjectWrap::Unwrap<NUIImage>(Local<Object>::Cast(value))->As<UIImage>();

  @autoreleasepool {
    [ui setImage:img];
  }
}
