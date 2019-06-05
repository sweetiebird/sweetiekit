//
//  CIImage.m
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
  JS_UNWRAP(CIImage, self);
  @autoreleasepool {
    simd_float3x3 xform = matrix_identity_float3x3;
    if (sweetiekit::SetTransform3(xform, info[0])) {
      CGAffineTransform aff = CGAffineTransformMake(xform.columns[0][0], xform.columns[0][1], xform.columns[1][0], xform.columns[1][1], xform.columns[2][0], xform.columns[2][1]);
      JS_SET_RETURN_EXTERNAL(CIImage, [self imageByApplyingTransform:aff]);
    }
  }
}

NAN_METHOD(NCIImage::initWithImage) {
  @autoreleasepool {
    JS_SET_RETURN_EXTERNAL(CIImage, [[CIImage alloc] initWithImage:to_value_UIImage(info[0])]);
  }
}
