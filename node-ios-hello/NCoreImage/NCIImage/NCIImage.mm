//
//  CIImage.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
#include "defines.h"
#include "NNSObject.h"
#include "NCIImage.h"
#include "NUIImage.h"

NCIImage::NCIImage () {}
NCIImage::~NCIImage () {}

JS_INIT_CLASS(CIImage, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, imageByApplyingTransform);
  // static members (ctor)
  JS_INIT_CTOR(CIImage, NSObject);
  JS_ASSIGN_METHOD(ctor, initWithImage);
JS_INIT_CLASS_END(CIImage, NSObject);

NAN_METHOD(NCIImage::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCIImage *ui = new NCIImage();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CIImage *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CIImage alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCIImage::imageByApplyingTransform) {
  Nan::HandleScope scope;
  
  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NCIImage)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  NCIImage *ciObj = ObjectWrap::Unwrap<NCIImage>(obj);

  JS_UNWRAP(CIImage, ci);

  @autoreleasepool {
    UInt32 orient = [[UIApplication sharedApplication] statusBarOrientation];
    simd_float3x3 xform = matrix_identity_float3x3;
    if (sweetiekit::SetTransform3(xform, info[0])) {
        CGAffineTransform aff = CGAffineTransformMake(xform.columns[0][0], xform.columns[0][1], xform.columns[1][0], xform.columns[1][1], xform.columns[2][0], xform.columns[2][1]);
      ciObj->SetNSObject([ci imageByApplyingTransform:aff]);
    }
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NCIImage::initWithImage) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NCIImage)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
  NCIImage *ci = ObjectWrap::Unwrap<NCIImage>(obj);

  Local<Object> imgObj = JS_OBJ(info[0]);
  NUIImage *img = ObjectWrap::Unwrap<NUIImage>(imgObj);

  @autoreleasepool {
    ci->SetNSObject([[CIImage alloc] initWithImage:img->As<UIImage>()]);
  }

  JS_SET_RETURN(obj);
}
