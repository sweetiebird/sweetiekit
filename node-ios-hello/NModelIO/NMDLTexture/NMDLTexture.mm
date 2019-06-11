//
//  NMDLTexture.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMDLTexture.h"

NMDLTexture::NMDLTexture() {}
NMDLTexture::~NMDLTexture() {}

JS_INIT_CLASS(MDLTexture, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MDLTexture, NSObject);
JS_INIT_CLASS_END(MDLTexture, NSObject);

NAN_METHOD(NMDLTexture::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MDLTexture(...)', turn into construct call.
      JS_SET_RETURN_NEW(MDLTexture, info);
      return;
    }

    MDLTexture* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MDLTexture *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MDLTexture alloc] init];
    }
    if (self) {
      NMDLTexture *wrapper = new NMDLTexture();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MDLTexture::New: invalid arguments");
    }
  }
}
