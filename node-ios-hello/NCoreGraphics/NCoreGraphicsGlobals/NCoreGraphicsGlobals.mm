//
//  CoreGraphicsGlobals.m
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCoreGraphicsGlobals.h"
#include "NUIImage.h"

NCoreGraphicsGlobals::NCoreGraphicsGlobals () {}
NCoreGraphicsGlobals::~NCoreGraphicsGlobals () {}

JS_INIT_CLASS(CoreGraphicsGlobals, NSObject);
JS_INIT_CTOR(CoreGraphicsGlobals, NSObject);
  JS_ASSIGN_METHOD(ctor, UIGraphicsBeginImageContextWithOptions);
  JS_ASSIGN_METHOD(ctor, UIGraphicsGetImageFromCurrentImageContext);
  JS_ASSIGN_METHOD(ctor, UIGraphicsEndImageContext);
JS_INIT_CLASS_END(CoreGraphicsGlobals, NSObject);

NAN_METHOD(NCoreGraphicsGlobals::New) {
  JS_RECONSTRUCT(CoreGraphicsGlobals);

  Local<Object> obj = info.This();

  NCoreGraphicsGlobals *ui = new NCoreGraphicsGlobals();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SCoreGraphicsGlobals *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([SCoreGraphicsGlobals shared]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCoreGraphicsGlobals::UIGraphicsBeginImageContextWithOptions) {
  Nan::HandleScope scope;
  
  @autoreleasepool {
    float width = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("width")));
    float height = TO_FLOAT(JS_OBJ(info[0])->Get(JS_STR("height")));
    bool opaque = TO_BOOL(info[1]);
    float scale = TO_FLOAT(info[2]);
    [SCoreGraphicsGlobals uiGraphicsBeginImageContextWithOptionsWithSize:CGSizeMake(width, height) opaque:opaque scale:scale];
  }
}

NAN_METHOD(NCoreGraphicsGlobals::UIGraphicsGetImageFromCurrentImageContext) {
  Nan::HandleScope scope;

  UIImage *img = [SCoreGraphicsGlobals uiGraphicsGetImageFromCurrentImageContext];
  
  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)img)
  };
  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(img, NUIImage::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

NAN_METHOD(NCoreGraphicsGlobals::UIGraphicsEndImageContext) {
  Nan::HandleScope scope;

  [SCoreGraphicsGlobals uiGraphicsEndImageContext];
}
