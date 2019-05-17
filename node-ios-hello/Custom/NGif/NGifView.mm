//
//  NGifView.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUIImageView.h"
#include "NGifView.h"
#include "NGif.h"
#include "NGifManager.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NGifView::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NGifView::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIImageView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("GifView"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "setGifImage", setGifImage);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NGifView::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NGifView *ui = new NGifView();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge GifView *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      double width = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
      double height = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
      double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
      double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
      ui->SetNSObject([[GifView alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NGifView::NGifView () {}
NGifView::~NGifView () {}

NAN_METHOD(NGifView::setGifImage) {
  Nan::HandleScope scope;

  NGifView *gv = ObjectWrap::Unwrap<NGifView>(info.This());
  NGif *ng = ObjectWrap::Unwrap<NGif>(Local<Object>::Cast(info[0]));
  NGifManager *mgr = ObjectWrap::Unwrap<NGifManager>(Local<Object>::Cast(info[1]));
  double count = TO_DOUBLE(info[2]);

  @autoreleasepool {
    auto ui = gv->As<GifView>();
    [ui setGifImage:ng->As<Gif>() manager:mgr->As<GifManager>() loopCount:count];
  }
}
