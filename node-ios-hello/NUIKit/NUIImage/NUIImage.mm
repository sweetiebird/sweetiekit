//
//  NUIImage.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NUIImage::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUIImage::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIImage"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "toArrayBuffer", toArrayBuffer);
  JS_ASSIGN_PROP_READONLY(proto, rotated);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}
/*
NAN_METHOD(NUIImage::New) {
  Nan::HandleScope scope;
  @autoreleasepool {
    Local<Object> imgObj = info.This();

    NUIImage *img = new NUIImage();

    if (info[0]->IsExternal()) {
      img->SetNSObject((__bridge UIImage *)(info[0].As<External>()->Value()));
    } else if (info.Length() > 0 && info[0]->IsString()) {
      NSString* result = NJSStringToNSString(info[0]);

      img->SetNSObject([UIImage imageNamed:result]);
    } else if (info.Length() > 0 && info[0]->IsArrayBuffer()) {
      Local<ArrayBuffer> value = Local<ArrayBuffer>::Cast(info[0]);
      NSUInteger length = value->GetContents().ByteLength();
      const void* data = value->GetContents().Data();
      CGFloat scale = info[1]->IsNumber() ? TO_FLOAT(info[1]) : 1.0;
      img->SetNSObject([[UIImage alloc] initWithData:[[NSData alloc] initWithBytes:data length:length] scale:scale]);
    } else {
      img->SetNSObject([[UIImage alloc] init]);
    }
    img->Wrap(imgObj);

    info.GetReturnValue().Set(imgObj);
  }
}*/

NAN_METHOD(NUIImage::New)
{
  Nan::HandleScope scope;
  @autoreleasepool
  {
    Local<Object> uiObj = info.This();
    NUIImage* ui = new NUIImage();
    UIImage* el;
    auto arg0 = info[0];
    decltype(el) __e12 = nil;
    if (arg0->IsExternal()) {
      __e12 = (__bridge UIImage *)(arg0.As<External>()->Value());
    } else {
      decltype(el) __e13 = nil;
      auto obj = Nan::New<Object>();
      Nan::Set(obj, JS_STR("foo"), JS_NUM(42));
      if (arg0->IsString()) {
        NSString* name = NJSStringToNSString(arg0);
        __e13 = [UIImage imageNamed: name];
      } else {
        __e13 = [[UIImage alloc] init];
      }
      __e12 = __e13;
    }
    ui->SetNSObject(__e12);
  }
}


NUIImage::NUIImage () {}
NUIImage::~NUIImage () {}

NAN_METHOD(NUIImage::toArrayBuffer)
{
  JS_UNWRAP(UIImage, ui);
  @autoreleasepool {
    std::string type;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      type = *utf8Value;
    }

    double quality = 0.95;
    if (info[1]->IsNumber()) {
      quality = TO_DOUBLE(info[1]);
    }

    NSData* data = nullptr;
    if (type == "image/png") {
      data = UIImagePNGRepresentation(ui);
    } else if (type == "image/jpeg" || type == "image/jpg") {
      data = UIImageJPEGRepresentation(ui, quality);
    } else {
      type = "image/png";
      data = UIImagePNGRepresentation(ui);
    }
    NSUInteger length = [data length];
    const void* bytes = [data bytes];

    Local<ArrayBuffer> result = ArrayBuffer::New(Isolate::GetCurrent(), length);
    memcpy(result->GetContents().Data(), bytes, length);
    result->Set(JS_STR("type"), JS_STR(type));
    if (type == "image/jpeg" || type == "image/jpg") {
      result->Set(JS_STR("quality"), JS_NUM(quality));
    }
    JS_SET_RETURN(result);
  }
}

JS_GETTER(UIImage, img, rotated, {
  UIImage* img2 = [[UIImage alloc] initWithCGImage:[img CGImage] scale:1.0f orientation:UIImageOrientationRight];
  JS_SET_RETURN(sweetiekit::GetWrapperFor(img2, NUIImage::type));
})
