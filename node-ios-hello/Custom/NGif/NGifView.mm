//
//  NGifView.mm
//
//  Created by Emily Kolar on 5/17/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NGifView.h"
#include "NGif.h"
#include "NGifManager.h"

NGifView::NGifView () {}
NGifView::~NGifView () {}

JS_INIT_CLASS(GifView, UIImageView);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, setGifImage);
  JS_ASSIGN_METHOD(proto, setGifFromUrl);
  // static members (ctor)
  JS_INIT_CTOR(GifView, UIImageView);
JS_INIT_CLASS_END(GifView, UIImageView);

NAN_METHOD(NGifView::New) {
  JS_RECONSTRUCT(GifView);

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

NAN_METHOD(NGifView::setGifFromUrl) {
  Nan::HandleScope scope;

  NGifView *gv = ObjectWrap::Unwrap<NGifView>(info.This());
  NGifManager *mgr = ObjectWrap::Unwrap<NGifManager>(Local<Object>::Cast(info[1]));

  @autoreleasepool {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      // throw
    }
    NSString* urlStr = [NSString stringWithUTF8String:str.c_str()];
    NSURL* url = [NSURL URLWithString:urlStr];
    double count = TO_DOUBLE(info[2]);
    double integrity = TO_DOUBLE(info[3]);
    BOOL showLoader = TO_BOOL(info[4]);
    auto ui = gv->As<GifView>();
    [ui setGifFromURL:url manager:mgr->As<GifManager>() loopCount:count levelOfIntegrity:integrity showLoader:showLoader];
  }
}

NAN_METHOD(NGifView::setGifImage) {
  Nan::HandleScope scope;

  NGifView *gv = ObjectWrap::Unwrap<NGifView>(info.This());
  NGif *ng = ObjectWrap::Unwrap<NGif>(Local<Object>::Cast(info[0]));
  NGifManager *mgr = ObjectWrap::Unwrap<NGifManager>(Local<Object>::Cast(info[1]));

  @autoreleasepool {
    double count = TO_DOUBLE(info[2]);
    auto ui = gv->As<GifView>();
    [ui setGifImage:ng->As<Gif>() manager:mgr->As<GifManager>() loopCount:count];
  }
}
