//
//  NSKTexture.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSKTexture.h"

NSKTexture::NSKTexture() {}
NSKTexture::~NSKTexture() {}

JS_INIT_CLASS(SKTexture, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP_READONLY(proto, size);
  JS_ASSIGN_PROP_READONLY(proto, textureRect);
  // static members (ctor)
  JS_INIT_CTOR(SKTexture, NSObject);
  JS_ASSIGN_METHOD(ctor, textureWithImage);
JS_INIT_CLASS_END(SKTexture, NSObject);

#include "NUIImage.h"

NAN_METHOD(NSKTexture::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKTexture *tx = new NSKTexture();

  if (info[0]->IsExternal()) {
    tx->SetNSObject((__bridge SKTexture *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0 && info[0]->IsString()) {
    @autoreleasepool {
      NSString *imageName = NJSStringToNSString(info[0]);
      tx->SetNSObject([SKTexture textureWithImageNamed:imageName]);
    }
  } else if (info.Length() > 0 && JS_INSTANCEOF(info[0], NUIImage)) {
    JS_UNWRAPPED(info[0], UIImage, ui);
    tx->SetNSObject([SKTexture textureWithImage:ui]);
  } else if (info.Length() > 0) {
    delete tx;
    Nan::ThrowError("NSKTexture::New: Invalid argument");
    return;
  } else {
    @autoreleasepool {
      tx->SetNSObject([[SKTexture alloc] init]);
    }
  }

  tx->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NAN_METHOD(NSKTexture::textureWithImage)
{
  if (!JS_INSTANCEOF(info[0], NUIImage)) {
    Nan::ThrowError("NSKTexture::textureWithImage: Expected a UIImage");
    return;
  }
  JS_UNWRAPPED(info[0], UIImage, ui);
  
  Local<Value> argv[] = {
    Nan::New<External>((__bridge void*)[SKTexture textureWithImage:ui])
  };
  JS_SET_RETURN(JS_NEW_ARGV(NSKTexture, argv));
}

JS_GETTER(SKTexture, tex, size, {
  CGSize size = [tex size];
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_NUM(size.width));
  result->Set(JS_STR("height"), JS_NUM(size.height));
  JS_SET_RETURN(result);
});

JS_GETTER(SKTexture, tex, textureRect, {
  CGRect rect = [tex textureRect];
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(rect.origin.x));
  result->Set(JS_STR("y"), JS_NUM(rect.origin.y));
  result->Set(JS_STR("width"), JS_NUM(rect.size.width));
  result->Set(JS_STR("height"), JS_NUM(rect.size.height));
  JS_SET_RETURN(result);
});

